package rva.ctrls;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import rva.jpa.Obrazovanje;
import rva.jpa.Radnik;
import rva.jpa.Sektor;
import rva.repository.ObrazovanjeRepository;
import rva.repository.RadnikRepository;
import rva.repository.SektorRepository;

@CrossOrigin
@RestController
@Api(tags = {"Radnik CRUD operacije"})
public class RadnikRestController {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private RadnikRepository radnikRepository;
	
	@Autowired
	private SektorRepository sektorRepository;
	
	@Autowired
	private ObrazovanjeRepository obrazovanjeRepository;
	
	@GetMapping("radnik")
	@ApiOperation(value = "Vraća kolekciju svih radnika iz baze podataka")
	public Collection<Radnik> getRadnici() {
		return radnikRepository.findAll();
	}
	
	@GetMapping("radnik/{id}")
	@ApiOperation(value = "Vraća radnika iz baze podataka čiji je id vrednost prosleđena kao path varijabla")
	public Radnik getRadnik(@PathVariable("id") Integer id) {
		return radnikRepository.getOne(id);
	}
	
	@GetMapping("radniciZaSektor/{id}")
	@ApiOperation(value = "Vraća kolekciju svih radnika iz baze podataka koji rade u sektoru čiji je id vrednost prosleđena kao path varijabla")
	public Collection<Radnik> radniciPoSektoruId(@PathVariable("id") Integer id) {
		Sektor s = sektorRepository.getOne(id);
		return radnikRepository.findBySektor(s);
	}
	
	@GetMapping("radniciZaObrazovanje/{id}")
	@ApiOperation(value = "Vraća kolekciju svih radnika iz baze podataka koji poseduju obrazovanje čiji je id vrednost prosleđena kao path varijabla")
	public Collection<Radnik> radniciPoObrazovanjuId(@PathVariable("id") Integer id) {
		Obrazovanje o = obrazovanjeRepository.getOne(id);
		return radnikRepository.findByObrazovanje(o);
	}
	
	@PostMapping("radnik")
	@ApiOperation(value = "Upisuje radnika u bazu podataka")
	public ResponseEntity<Radnik> insertRadnik(@RequestBody Radnik radnik) {
		if(!radnikRepository.existsById(radnik.getId())) {
			radnikRepository.save(radnik);
			return new ResponseEntity<Radnik>(HttpStatus.OK);
		}
		return new ResponseEntity<Radnik>(HttpStatus.CONFLICT);
	}
	
	@PutMapping("radnik")
	@ApiOperation(value = "Modifikuje postojećeg radnika u bazi podataka")
	public ResponseEntity<Radnik> updateRadnik(@RequestBody Radnik radnik) {
		if(!radnikRepository.existsById(radnik.getId())) {
			return new ResponseEntity<Radnik>(HttpStatus.NO_CONTENT);
		}
		radnikRepository.save(radnik);
		return new ResponseEntity<Radnik>(HttpStatus.OK);
	}
	
	@DeleteMapping("radnik/{id}")
	@ApiOperation(value = "Briše radnik iz baze podataka čiji je id vrednost prosleđena kao path varijabla")
	public ResponseEntity<Radnik> deleteRadnik(@PathVariable("id") Integer id) {
		if(!radnikRepository.existsById(id)) {
			return new ResponseEntity<Radnik>(HttpStatus.NO_CONTENT);
		}
		radnikRepository.deleteById(id);
		if(id == -100) {
			jdbcTemplate.execute(" INSERT INTO \"radnik\" (\"id\", \"ime\", \"prezime\", \"broj_lk\", \"obrazovanje\", \"sektor\")  "
					+ "VALUES (-100, 'Test Ime', 'Test Prezime', 12345, 1, 1) "
					);
		}
		return new ResponseEntity<Radnik>(HttpStatus.OK);
	}
	
	

}
