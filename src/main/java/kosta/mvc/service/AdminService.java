package kosta.mvc.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kosta.mvc.domain.QnaBoard;

public interface AdminService {
	
	/**
	 * 전체 문의 답변 페이지
	 * */
	Page<QnaBoard> selectAll(Pageable page);

}
