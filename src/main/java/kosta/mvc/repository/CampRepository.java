package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.Camp;

public interface CampRepository extends JpaRepository<Camp, Long>, QuerydslPredicateExecutor<Camp> {
	
	
	//@Query("select c from Camp c where c.campManageNo ='CDFI2262132016000034'")
	//@Query("select c from Camp c where c.campRegNo =?1") 
	//Camp selectCamp(String campRegNo);
	 
	 /* @Override
	  @EntityGraph(attributePaths = { "scrapList"})
	 List<Camp> findAll() ;*/
	
	//@Query("select c from Camp c join fetch c.residenceList.camp")
	//List<Camp> findAllTest() ;
	
	
	
	Camp findByCampRegNo(String campRegNo);
	
	Camp findByCampManageNo(String campManageNo);
	
	List<Camp> findByCampState(int campState);
}
