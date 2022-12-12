package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.querydsl.jpa.impl.JPAQueryFactory;

import kosta.mvc.domain.QReservation;
import kosta.mvc.domain.QTemporary;
import kosta.mvc.domain.Reservation;
import kosta.mvc.repository.ReservationRepository;

@Service
@Transactional
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	private ReservationRepository reservationRepository;
	
	
	@Autowired
	private JPAQueryFactory queryFactory;
	
	private QReservation qReservation = QReservation.reservation;
	
	private QTemporary qTemporary = QTemporary.temporary;

	@Override
	public void insert(Reservation reser) {
		reservationRepository.save(reser);
	}

	@Override
	public Reservation selectBy(Long resiNo, String checkIn, String checkOut) {
		Reservation re = queryFactory
				.selectFrom(qReservation)
				.where(qReservation.reservCheckin.between(checkIn, checkOut))
				.where(qReservation.reservCheckout.between(checkIn, checkOut))
				.where(qReservation.residence.resiNo.eq(resiNo))
				.fetchOne();
		return re;
	}

	public List<Reservation> selectByCampNo(Long campNo) {
		//List<Reservation> reservList = reservationRepository.findByCampOrderByReservDate(campNo);
		List<Reservation> reservList = reservationRepository.selectByCamp(campNo);
		return reservList;
	}

}
