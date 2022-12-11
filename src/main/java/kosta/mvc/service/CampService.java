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
	 * 글번호 검색 : 조회수 증가.... - state가 true이면 조회수 증가한다.
	 */
	Camp selectBy(Long bno);
	
	
	/**
	 * 캠핑장 중복 검색 : 조회수 증가.... - state가 true이면 조회수 증가한다.
	 */
	Camp selectBy(String campRegNo);
	

	/**
	 * 수정하기
	 */

	Camp update(Camp camp);

	/**
	 * 삭제요청 (캠핑장 상태 변경)
	 */
	void campDeleteRequest(Long campNo);
	
	/**
	 * 로그인
	 * */
	//Camp login(Camp camp);

}
