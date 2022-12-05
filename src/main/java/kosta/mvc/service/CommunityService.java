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
	
	
	
}
