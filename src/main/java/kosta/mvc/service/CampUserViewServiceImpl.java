package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.jpa.JPAExpressions;
import com.querydsl.jpa.impl.JPAQueryFactory;

import kosta.mvc.domain.Camp;
import kosta.mvc.domain.QCamp;
import kosta.mvc.domain.QReservation;
import kosta.mvc.domain.QResidence;
import kosta.mvc.domain.Residence;
import kosta.mvc.repository.CampUserViewRepository;
import kosta.mvc.repository.ResidenceRepository;

@Service
@Transactional
public class CampUserViewServiceImpl implements CampUserViewService {
	
	@Autowired
	private CampUserViewRepository campUserViewRepository;
	
	@Autowired
	private JPAQueryFactory queryFactory;
	
	private QCamp qCamp = QCamp.camp;
	private QResidence qResidence = QResidence.residence;
	private QReservation qReservation = QReservation.reservation;

	@Override
	public List<Camp> selectAll(int resiPeople, String campAddr, String checkIn, String checkOut) {
		List<Camp> campList = queryFactory
				.selectFrom(qCamp)
				.where(qCamp.in(JPAExpressions
						.select(qResidence.camp)
						.from(qResidence)
						.where(qResidence.resiPeople.goe(resiPeople))
						.where(qResidence.notIn(JPAExpressions
								.select(qReservation.residence)
								.from(qReservation)
								.where(qReservation.reservCheckin.between(checkIn, checkOut))
								.where(qReservation.reservCheckout.between(checkIn, checkOut))))))
				.where(qCamp.campAddr.contains(campAddr))
				.fetch();
				
		return campList;
	}
	

	@Override
	public List<Camp> select(int resiPeople, String campAddr, String checkIn, String checkOut, 
			int resiPrice1, int resiPrice2, String aa, String tag) {
		List<Camp> campList = queryFactory
				.selectFrom(qCamp)
				.where(qCamp.in(JPAExpressions
						.select(qResidence.camp)
						.from(qResidence)
						.where(qResidence.resiPeople.goe(resiPeople))
						.where(qResidence.resiPrice.between(resiPrice1, resiPrice2))
						.where(qResidence.notIn(JPAExpressions
								.select(qReservation.residence)
								.from(qReservation)
								.where(qReservation.reservCheckin.between(checkIn, checkOut))
								.where(qReservation.reservCheckout.between(checkIn, checkOut))))))
				.where(qCamp.campAddr.contains(campAddr))
				.where(qCamp.campFacility.contains(tag))
				.fetch();
		return campList;
	}

	@Override
	public Camp selectByCampNo(Long campNo) {
		Camp camp = campUserViewRepository.findById(campNo).orElse(null);
		if(camp==null) throw new RuntimeException("해당 캠핑장은 없는 정보 입니다");
		return camp;
	}
}
