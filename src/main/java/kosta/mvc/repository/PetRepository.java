package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.Pet;

public interface PetRepository extends JpaRepository<Pet, Long>, QuerydslPredicateExecutor<Pet> {
	@Query(value = "SELECT * FROM PET WHERE MEMBER_NO=?1 ORDER BY PET_NO ASC", nativeQuery = true)
	List<Pet> selectPetByMember(Long memberNo);
}
