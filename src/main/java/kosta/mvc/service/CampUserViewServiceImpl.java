package kosta.mvc.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.querydsl.jpa.impl.JPAQueryFactory;

import kosta.mvc.domain.Camp;
import kosta.mvc.domain.QCamp;
import kosta.mvc.domain.QReservation;
import kosta.mvc.domain.QResidence;
import kosta.mvc.domain.Residence;
import kosta.mvc.repository.CampUserViewRepository;
import kosta.mvc.repository.ReservationRepository;
import kosta.mvc.repository.ResidenceRepository;

@Service
@Transactional
public class CampUserViewServiceImpl implements CampUserViewService {
	
	@Autowired
	private CampUserViewRepository campUserViewRepository;
	
	@Autowired
	private JPAQueryFactory queryFactory;

	@Override
	public List<Camp> selectAll(int resiPeople, String campAddr, String checkIn, String checkOut) {
		QCamp ca = QCamp.camp;
		QReservation qre = QReservation.reservation;
		QResidence qsi = QResidence.residence;
		
		List<Camp> campList = queryFactory
				.selectFrom(ca)
				.leftJoin(qsi).on(ca.campNo.eq(qsi.camp.campNo))
				.leftJoin(qre).on(qsi.resiNo.eq(qre.residence.resiNo))
				.where(ca.campAddr.contains(campAddr)
						.and(qre.reservCheckin.notBetween(checkIn, checkOut)
								.and(qre.reservCheckout.notBetween(checkIn, checkOut)
										.and(qsi.resiPeople.goe(resiPeople)))))
				.fetch();
		
		return campList;
	}
	
	@Override
	public List<Camp> selectAll(int resiPeople, String campAddr, String checkIn, String checkOut, int resiPrice1, int resiPrice2, String aa) {
		List<Camp> campList = new ArrayList<Camp>();
		if(aa.equals('1')) {
			campList = campUserViewRepository.selectByPrice("desc");
		} else if(aa.equals('2')) {
			campList = campUserViewRepository.selectByPrice("asc");
		} else {
			campList = campUserViewRepository.findAll();
		}
		List<Camp> campserch = new ArrayList<Camp>();
		for(Camp c : campList) {
			List<Residence> resiList = c.getResidenceList();
			for(Residence r : resiList) {
				int price = r.getResiPrice();
				if(price<=resiPrice2 && price>=resiPrice1) {
					if(!campserch.equals(c)) campserch.add(c);
				}
			}
		}
		return campserch;
	}

	@Override
	public Camp selectByCampNo(Long campNo) {
		Camp camp = campUserViewRepository.findById(campNo).orElse(null);
		if(camp==null) throw new RuntimeException("해당 캠핑장은 없는 정보 입니다");
		return camp;
	}
	
	@Override
	public List<Camp> findAll() {
		return campUserViewRepository.findAll();
	};
}
