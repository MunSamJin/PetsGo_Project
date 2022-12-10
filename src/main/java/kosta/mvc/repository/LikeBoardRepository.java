package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.LikeBoard;

public interface LikeBoardRepository extends JpaRepository<LikeBoard, Long>, 
			QuerydslPredicateExecutor<LikeBoard>{
	
	@Query(value = "select * from like_board where member_no = ?1 and board_no = ?2", nativeQuery = true)
	LikeBoard selectAll(Long memberNo, Long boardNo);
	
	
	@Query(value = "insert into like_board values(like_lno_seq.nextval, ?1, ?2)", nativeQuery = true)
	@Modifying
	int insertLikeBoard(Long boardNo, Long memberNo);
	
	

	

}
