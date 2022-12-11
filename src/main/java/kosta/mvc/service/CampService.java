package kosta.mvc.service;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kosta.mvc.domain.Camp;

public interface CampService {


	/**
	 * 등록
	 */
	void insert(Camp camp);
	
	
	/**
	 * 전체 캠핑장 검색
	 */
	List<Camp> selectAll();
	

	/**
	 * 캠핑장 번호로 검색
	 */
	Camp selectBy(Long bno);
	
	
	/**
	 * 캠핑장 사업자 번호로 검색
	 */
	Camp selectBy(String campRegNo);
	
	
	/**
	 * 요청 캠핑장 검색
	 */
	List<Camp> select(int campState);
	

	/**
	 * 수정하기
	 */

	Camp update(Camp camp);

	/**
	 * 캠핑장 상태 변경
	 */
	Camp campStateUpdate(Long campNo, int campState);
	
	/**
	 * 삭제하기(승인 거절)
	 * */
	void delete(Long campNo);

}
