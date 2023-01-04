package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.Camp;
import kosta.mvc.domain.Residence;

public interface ResidenceRepository extends JpaRepository<Residence, Long>, QuerydslPredicateExecutor<Residence> {
	
	//List<Residence> findByCamp(Long campNo);
	
	@Query("select r from Residence r where r.camp=?1")
	List<Residence> selectAll(Camp camp);
}
