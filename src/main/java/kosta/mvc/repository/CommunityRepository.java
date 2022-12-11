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
	 *  태그 이름에 해당하는 정보 조회!
	 */
	@Query("select c from CommunityBoard c where c.boardTag like ?1 order by c.boardDate desc")
	//@Modifying //dml이나ddl은 필수!
	List<CommunityBoard> tagSelect(String tag);
	
	/**
	 *  정렬기능(최신순)
	 */
	@Query("select c from CommunityBoard c order by c.boardDate desc")
	List<CommunityBoard> latestSelect();
	
	/**
	 * 정렬기능(좋아요 많은 순)
	 */
	//@Query("")
	//List<CommunityBoard> likeSelect();

}
