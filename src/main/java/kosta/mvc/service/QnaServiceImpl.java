package kosta.mvc.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kosta.mvc.domain.QnaBoard;
import kosta.mvc.repository.QnaRepository;

@Service
@Transactional
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	private QnaRepository qnaRep;

	@Override
	public Page<QnaBoard> selectAll(Pageable page) {
		return qnaRep.findAll(page);
	}

	@Override
	public QnaBoard replyInsert(QnaBoard qna) {		
		QnaBoard dbQna = qnaRep.findById(qna.getQnaNo()).orElse(null);
		
		if(dbQna == null) throw new RuntimeException("답변을 등록할 수 없습니다.");
		
		dbQna.setQnaReContent(qna.getQnaReContent());
		dbQna.setQnaReDate(qna.getQnaReDate());		
		
		return dbQna;
	}

	@Override
	public QnaBoard replyDelete(QnaBoard qna) {		
		QnaBoard dbQna = qnaRep.findById(qna.getQnaNo()).orElse(null);
		
		if(dbQna == null) throw new RuntimeException("답변을 삭제할 수 없습니다.");
		
		dbQna.setQnaReContent("");
		
		return dbQna;
	}
}
