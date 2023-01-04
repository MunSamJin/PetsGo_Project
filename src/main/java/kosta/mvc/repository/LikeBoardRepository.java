package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.LikeBoard;

public interface LikeBoardRepository extends JpaRepository<LikeBoard, Long>, 
			QuerydslPredicateExecutor<LikeBoard>{
	
	/**
	 *  커뮤니티 게시글 상세보기에서 좋아요 눌렀는지 확인하는 쿼리
	 * @param memberNo
	 * @param boardNo
	 * @return
	 */
	@Query(value = "select * from like_board where member_no = ?1 and board_no = ?2", nativeQuery = true)
	LikeBoard selectAll(Long memberNo, Long boardNo);
	
	/**
	 * 커뮤니티 게시글 상세보기에서 좋아요 누르기
	 * @param boardNo
	 * @param memberNo
	 * @return
	 */
	@Query(value = "insert into like_board values(like_lno_seq.nextval, ?1, ?2)", nativeQuery = true)
	@Modifying
	int insertLikeBoard(Long boardNo, Long memberNo);
	
	/**
	 * 마이페이지 내 커뮤니티에서 좋아요 누른 게시글 조회
	 */
	@Query(value = "select * from like_board where member_no = ?1", nativeQuery = true)
	List<LikeBoard> selectLikeList(Long memberNo);
	

}
