package kosta.mvc.service;

import kosta.mvc.domain.QnaBoard;

public interface QnaService {

	/**
	 * 문의 등록
	 * */
	void qnaInsert(QnaBoard qnaBoard);
}
