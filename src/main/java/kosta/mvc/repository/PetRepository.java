package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.Pet;

public interface PetRepository extends JpaRepository<Pet, Long> {

}
