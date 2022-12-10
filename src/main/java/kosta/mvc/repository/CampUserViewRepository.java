package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.Camp;

public interface CampUserViewRepository extends JpaRepository<Camp, Long>, QuerydslPredicateExecutor<Camp> {
	
	@Query(value = "select c.camp_no from camp c join (select camp_no, min(resi_price) as price from residence group by camp_no) d on c.camp_no=d.camp_no order by d.price ?1;", nativeQuery = true)
	List<Camp> selectByPrice(String aa);
	
	@Query(value = "", nativeQuery = true)
	List<Camp> selectAll();
}
