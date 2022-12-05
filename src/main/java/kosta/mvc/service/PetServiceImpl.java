package kosta.mvc.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.mvc.domain.Pet;
import kosta.mvc.repository.PetRepository;

@Service
@Transactional
public class PetServiceImpl implements PetService {
	
	@Autowired
	private PetRepository petRep;

	@Override
	public void addPet(Pet pet) {
		petRep.save(pet);
	}

}