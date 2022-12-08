package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.CommunityBoard;

public interface CommunityRepository extends JpaRepository<CommunityBoard, Long>, 
		QuerydslPredicateExecutor<CommunityBoard> {
	
	/**
	 *  글번호에 해당하는 조회수 증가
	 */
	@Query("select c from CommunityBoard c where c.boardTag like ?1")
	//@Modifying //dml이나ddl은 필수!
	List<CommunityBoard> tagSelect(String tag);

}
