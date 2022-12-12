package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.mvc.domain.Reservation;
import kosta.mvc.repository.ReservationRepository;

@Service
@Transactional
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	private ReservationRepository reservationRepository;

	@Override
	public void insert(Reservation reser) {
		reservationRepository.save(reser);
	}

	@Override
	public List<Reservation> selectByCampNo(Long campNo) {
		//List<Reservation> reservList = reservationRepository.findByCampOrderByReservDate(campNo);
		List<Reservation> reservList = reservationRepository.selectByCamp(campNo);
		return reservList;
	}

}
