package kosta.mvc.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.querydsl.jpa.impl.JPAQueryFactory;

import kosta.mvc.domain.QTemporary;
import kosta.mvc.domain.Temporary;
import kosta.mvc.repository.TemporaryRepository;

@Service
@Transactional
public class TemporaryServiceImpl implements TemporaryService {
	
	@Autowired
	private TemporaryRepository temporaryRepository;
	
	@Autowired
	private JPAQueryFactory queryFactory;
	
	private QTemporary qTemporary = QTemporary.temporary;

	@Override
	public Temporary selectBy(Long resiNo, String checkIn, String checkOut) {
		Temporary temporary = queryFactory
				.selectFrom(qTemporary)
				.where(qTemporary.resi.resiNo.eq(resiNo))
				.where(qTemporary.reservCheckin.between(checkIn, checkOut))
				.where(qTemporary.reservCheckout.between(checkIn, checkOut))
				.fetchOne();
		return temporary;
	}

	@Override
	public Long insert(Temporary temporary) {
		 Temporary te = temporaryRepository.save(temporary);
		return te.getTempNo();
	}

	@Override
	public void delete(Long teNo) {
		temporaryRepository.deleteById(teNo);
	}

}
