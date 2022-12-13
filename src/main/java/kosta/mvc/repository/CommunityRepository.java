package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.CommunityBoard;
import kosta.mvc.domain.LikeBoardArrange;

public interface CommunityRepository extends JpaRepository<CommunityBoard, Long>, 
		QuerydslPredicateExecutor<CommunityBoard> {
	
	/**
	 *  태그 이름에 해당하는 정보 조회!
	 */
	@Query("select c from CommunityBoard c where c.boardTag like ?1 order by c.boardDate desc")
	//@Modifying //dml이나ddl은 필수!
	Page<CommunityBoard> tagSelect(String tag, PageRequest page);
	
	/**
	 *  정렬기능(최신순)
	 * @param page 
	 */
	@Query("select c from CommunityBoard c order by c.boardDate desc")
	Page<CommunityBoard> latestSelect(PageRequest page);
	
	/**
	 * 정렬기능(좋아요 많은 순)
	 */
	@Query(value = "select count(l.board_no) as likecount,  c.board_no as boardno, c.board_content as boardcontent, \r\n"
			+ "                c.board_file_name as boardfilename, c.board_tag as boardtag, c. member_no as memberno\r\n"
			+ "        from community_board c left join like_board l\r\n"
			+ "        on c.board_no=l.board_no\r\n"
			+ "        group by c.board_no, c.board_content, c.board_file_name, c.board_tag,c. member_no", 
			countQuery = "select count(l.board_no) as likecount,  c.board_no as boardno, c.board_content as boardcontent, \r\n"
					+ "                c.board_file_name as boardfilename, c.board_tag as boardtag, c. member_no as memberno\r\n"
					+ "        from community_board c left join like_board l\r\n"
					+ "        on c.board_no=l.board_no\r\n"
					+ "        group by c.board_no, c.board_content, c.board_file_name, c.board_tag,c.member_no",
			nativeQuery = true)
	Page<LikeBoardArrange> likeSelect(PageRequest page);

	/**
	 * 마이페이지 내커뮤니티 조회
	 */
	@Query(value = "select * from community_board where member_no = ?1 order by board_date", nativeQuery = true)
	List<CommunityBoard> selectCommunityAll(Long memberNo);
}
