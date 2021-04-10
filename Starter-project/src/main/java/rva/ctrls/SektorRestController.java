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
import rva.jpa.Sektor;
import rva.repository.SektorRepository;

@CrossOrigin
@RestController
@Api(tags = {"Sektor CRUD operacije"})
public class SektorRestController {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private SektorRepository sektorRepository;
	
	@GetMapping("sektor")
	@ApiOperation(value = "Vraća kolekciju svih sektora iz baze podataka")
	public Collection<Sektor> getSektor() {
		return sektorRepository.findAll();
	}
	
	@GetMapping("sektor/{id}")
	@ApiOperation(value = "Vraća sektor iz baze podataka čiji je id vrednost prosleđena kao path varijabla")
	public Sektor getSektor(@PathVariable("id") Integer id) {
		return sektorRepository.getOne(id);
	}
	
	@GetMapping("sektorNaziv/{naziv}")
	@ApiOperation(value = "Vraća kolekciju svih sektora iz baze podataka koji u nazivu sadrže string prosleđen kao path varijabla")
	public Collection<Sektor> getSektorByNaziv(@PathVariable("naziv") String naziv) {
		return sektorRepository.findByNazivContainingIgnoreCase(naziv);
	}
	
	@PostMapping("sektor")
	@ApiOperation(value = "Upisuje sektor u bazu podataka")
	public ResponseEntity<Sektor> insertSektor(@RequestBody Sektor sektor) {
		if(!sektorRepository.existsById(sektor.getId())) {
			sektorRepository.save(sektor);
			return new ResponseEntity<Sektor>(HttpStatus.OK);
		}
		return new ResponseEntity<Sektor>(HttpStatus.CONFLICT);
	}
	
	@PutMapping("sektor")
	@ApiOperation(value = "Modifikuje postojeći sektor u bazi podataka")
	public ResponseEntity<Sektor> updateSektor(@RequestBody Sektor sektor) {
		if(!sektorRepository.existsById(sektor.getId())) {
			return new ResponseEntity<Sektor>(HttpStatus.NO_CONTENT);
		}
		sektorRepository.save(sektor);
		return new ResponseEntity<Sektor>(HttpStatus.OK);
	}
	
	
	@DeleteMapping("sektor/{id}")
	@ApiOperation(value = "Briše sektor iz baze podataka čiji je id vrednost prosleđena kao path varijabla")
	public ResponseEntity<Sektor> deleteSektor(@PathVariable("id") Integer id) {
		if(!sektorRepository.existsById(id) ) {
			return new ResponseEntity<Sektor>(HttpStatus.NO_CONTENT);
		}
		jdbcTemplate.execute("delete from sektor where preduzece= " + id);
		sektorRepository.deleteById(id);
		if(id == -100) {
			jdbcTemplate.execute(" INSERT INTO \"sektor\" (\"id\", \"naziv\", \"oznaka\", \"preduzece\")  "
					+ "VALUES (-100, 'Test naziv', 'TstOzn', 2) "
					);
		}
		return new ResponseEntity<Sektor>(HttpStatus.OK);

	}
	
}
