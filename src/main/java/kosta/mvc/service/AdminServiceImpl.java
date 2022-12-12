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
public class AdminServiceImpl implements AdminService {

	@Autowired
	private QnaRepository qnaRep;
	
	@Override
	public Page<QnaBoard> selectAll(Pageable page) {
		return qnaRep.findAll(page);
	}
}






























