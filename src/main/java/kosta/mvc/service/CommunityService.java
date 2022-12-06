package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.CommunityBoard;

public interface CommunityService {

	/**
	 *  전체검색
	 */
	List<CommunityBoard> selectAll(); 
	
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
	
	
	
}
