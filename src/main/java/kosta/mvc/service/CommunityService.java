package kosta.mvc.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import kosta.mvc.domain.CommunityBoard;
import kosta.mvc.domain.LikeBoard;
import kosta.mvc.domain.LikeBoardArrange;

public interface CommunityService {

	/**
	 *  전체검색
	 */
	List<CommunityBoard> selectAll(); 
	Page<CommunityBoard> selectAll(Pageable pageable); 
	
	/**
	 *  등록
	 */
	void insert(CommunityBoard communityBoard);
	
	/**
	 * 상세보기
	 */
	CommunityBoard selectBy(Long boardNo);
	
	/**
	 *  수정하기
	 */
	CommunityBoard update(CommunityBoard board);
	
	/**
     * 삭제하기
     * */
    void delete(Long boardNo);

    /**
     * 태그 검색하기 + 최신순정렬기능
     * @param tag
     * @param page 
     * @return 
     */
	Page<CommunityBoard> selectByTag(String tag, PageRequest page);
	
	/**
	 * 좋아요많은순 정렬
	 * @param page 
	 */
	Page<LikeBoardArrange> selectLikeBoardArrange(PageRequest page);
	
	/**
	 *  좋아요 등록 / 좋아요 삭제
	 */
	int selectAll(Long memberNo, Long boardNo);
	
	/**
	 * 커뮤니티 게시글 상세보기에서 좋아요 조회
	 */
	LikeBoard selectLikeNo(Long memberNo, Long boardNo);
	

}
