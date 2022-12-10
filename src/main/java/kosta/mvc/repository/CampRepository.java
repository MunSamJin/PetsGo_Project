package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import com.google.common.base.Optional;

import kosta.mvc.domain.Camp;

public interface CampRepository extends JpaRepository<Camp, Long>, QuerydslPredicateExecutor<Camp> {
	
	
	//@Query("select c from Camp c where c.campManageNo ='CDFI2262132016000034'")
	//@Query("select c from Camp c where c.campRegNo =?1") 
	//Camp selectCamp(String campRegNo);
	 
	
	Camp findByCampRegNo(String campRegNo);
}
