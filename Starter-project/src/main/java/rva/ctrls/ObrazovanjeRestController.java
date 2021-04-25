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
import rva.repository.ObrazovanjeRepository;

@CrossOrigin
@RestController
@Api(tags = {"Obrazovanje CRUD operacije"})
public class ObrazovanjeRestController {
	
	@Autowired
	private ObrazovanjeRepository obrazovanjeRepository;
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@GetMapping("obrazovanje")
	@ApiOperation(value = "Vraća kolekciju svih artikala iz baze podataka")
	public Collection<Obrazovanje> getObrazovanje() {
		return obrazovanjeRepository.findAll();
	}
	
	@GetMapping("obrazovanje/{id}")
	@ApiOperation(value = "Vraća obrazovanje iz baze podataka čiji je id vrednost prosleđena kao path varijabla")
	public Obrazovanje getObrazovanje(@PathVariable("id") Integer id) {
		return obrazovanjeRepository.getOne(id);
	}
	
	@GetMapping("obrazovanjeNaziv/{naziv}")
	@ApiOperation(value = "Vraća kolekciju svih artikala iz baze podataka koji u nazivu sadrže string prosleđen kao path varijabla")
	public Collection<Obrazovanje> getObrazovanjeByNaziv(@PathVariable("naziv") String naziv) {
		return obrazovanjeRepository.findByNazivContainingIgnoreCase(naziv);
	}
	
	@PostMapping("obrazovanje")
	@ApiOperation(value = "Upisuje obrazovanje u bazu podataka")
	public ResponseEntity<Obrazovanje> insertObrazovanje(@RequestBody Obrazovanje obrazovanje) {
		if(!obrazovanjeRepository.existsById(obrazovanje.getId())) {
			obrazovanjeRepository.save(obrazovanje);
			return new ResponseEntity<Obrazovanje>(HttpStatus.OK);
		}
		return new ResponseEntity<Obrazovanje>(HttpStatus.CONFLICT);
		
	}
	
	@PutMapping("obrazovanje")
	@ApiOperation(value = "Modifikuje postojeće obrazovanje u bazi podataka")
	public ResponseEntity<Obrazovanje> updateObrazovanje(@RequestBody Obrazovanje obrazovanje) {
		if(!obrazovanjeRepository.existsById(obrazovanje.getId())) {
			return new ResponseEntity<Obrazovanje>(HttpStatus.NO_CONTENT);
		}
		obrazovanjeRepository.save(obrazovanje);
		return new ResponseEntity<Obrazovanje>(HttpStatus.OK);
	}
	
	@DeleteMapping("obrazovanje/{id}")
	@ApiOperation(value = "Briše obrazovanje iz baze podataka čiji je id vrednost prosleđena kao path varijabla")
	public ResponseEntity<Obrazovanje> deleteObrazovanje(@PathVariable("id") Integer id) {
		if(!obrazovanjeRepository.existsById(id)) {
			return new ResponseEntity<Obrazovanje>(HttpStatus.NO_CONTENT);
		}
		obrazovanjeRepository.deleteById(id);
		if(id == -100) {
			jdbcTemplate.execute("INSERT INTO \"obrazovanje\" (\"id\", \"naziv\",\"opis\",\"stepen_strucne_spreme\")  "
					+ "VALUES (-100, 'Test naziv','Test opis','Test SSS') "
					);
		}
		
		return new ResponseEntity<Obrazovanje>(HttpStatus.OK);
	}

}
