package kosta.mvc.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.mvc.domain.QnaBoard;
import kosta.mvc.repository.QnaRepository;

@Service
@Transactional
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	private QnaRepository qnaRep;

	@Override
	public void qnaInsert(QnaBoard qnaBoard) {
		qnaRep.save(qnaBoard);
	}

}
