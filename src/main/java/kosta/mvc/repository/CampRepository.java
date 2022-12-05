package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.Camp;

public interface CampRepository extends JpaRepository<Camp, Long>, QuerydslPredicateExecutor<Camp> {
	
	
	//@Query("select c from Camp c where c.campManageNo ='CDFI2262132016000034'")
	@Query("select c from Camp c where c.campRegNo =?1")
	Camp selectCamp(String campRegNo);
	
}
