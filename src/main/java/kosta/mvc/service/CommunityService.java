package kosta.mvc.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import kosta.mvc.domain.CommunityBoard;
import kosta.mvc.domain.LikeBoard;

public interface CommunityService {

	/**
	 *  전체검색
	 */
	List<CommunityBoard> selectAll(); 
	List<CommunityBoard> selectAll(Pageable pageable); 
	
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
     * 태그 검색하기 + 정렬기능
     * @param tag
     * @return 
     */
	List<CommunityBoard> selectByTag(String tag);
	
	
	/**
	 *  좋아요 기능
	 */
	int selectAll(Long memberNo, Long boardNo);
	
	
}
