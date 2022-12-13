package kosta.mvc.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kosta.mvc.domain.QnaBoard;

public interface QnaService {

	/**
	 * 문의 등록
	 * */
	//void qnaInsert(QnaBoard qnaBoard);
	
	/**
	 * 전체 문의 답변 페이지
	 * */
	Page<QnaBoard> selectAll(Pageable page);
	
	
	/**
	 * 문의 답변 등록하기
	 * */
	//void replyInsert(QnaBoard qna);
	QnaBoard replyInsert(QnaBoard qna);
	
	/**
	 * 문의 답변 삭제하기
	 * */
	QnaBoard replyDelete(QnaBoard qna);
}
