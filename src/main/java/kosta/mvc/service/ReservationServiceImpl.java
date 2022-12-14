package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.querydsl.jpa.impl.JPAQueryFactory;

import kosta.mvc.domain.Detail;
import kosta.mvc.domain.Pet;
import kosta.mvc.domain.QPet;
import kosta.mvc.domain.QReservation;
import kosta.mvc.domain.QTemporary;
import kosta.mvc.domain.Reservation;
import kosta.mvc.repository.DetailRepository;
import kosta.mvc.repository.PetRepository;
import kosta.mvc.repository.ReservationRepository;

@Service
@Transactional
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	private ReservationRepository reservationRepository;
	
	@Autowired
	private DetailRepository detailRepository;
	
	@Autowired PetRepository petRepository;
	
	@Autowired
	private JPAQueryFactory queryFactory;
	
	private QReservation qReservation = QReservation.reservation;
	
	private QTemporary qTemporary = QTemporary.temporary;
	
	private QPet qPet = QPet.pet;

	@Override
	public void insert(Reservation reser, Detail detail) {
		Reservation re = reservationRepository.save(reser);
		if(re != null) {
			detail.setReservation(re);
			detailRepository.save(detail);
		}
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

	@Override
	public List<Reservation> selectByCampNo(Long campNo) {
		//List<Reservation> reservList = reservationRepository.findByCampOrderByReservDate(campNo);
		List<Reservation> reservList = reservationRepository.selectByCamp(campNo);
		return reservList;
	}
	
	@Override
	public List<Reservation> selectByReservState(Long campNo, int reservState) {
		List<Reservation> reservList = reservationRepository.selectByCampState(campNo, reservState);
		return reservList;
	}

	@Override
	public Reservation selectByReservNo(Long reservNo) {
		Reservation reserv = reservationRepository.findById(reservNo).orElse(null);
		if(reserv==null) throw new RuntimeException("존재하지 않는 예약 내역입니다.");
		return reserv;
	}

	@Override
	public int updateState(Long reservNo, int reservState) {
		int result = reservationRepository.updateReservState(reservNo, reservState);
		if(result<=0) throw new RuntimeException("예약 상태 수정에 실패했습니다.");
		return result;
	}

	@Override
	public List<Pet> selectPet(Long memberNo) {
		return queryFactory
				.selectFrom(qPet)
				.where(qPet.member.memberNo.eq(memberNo))
				.fetch();
	}

}
