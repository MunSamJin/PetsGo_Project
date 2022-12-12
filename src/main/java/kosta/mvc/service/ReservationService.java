package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.Reservation;

public interface ReservationService {

	void insert(Reservation reser);
	
	Reservation selectBy(Long resiNo, String checkIn, String checkOut);
	
	Reservation selectByReservNo(Long reservNo);

	List<Reservation> selectByCampNo(Long campNo);
	
	List<Reservation> selectByReservState(Long campNo, int reservState);
	
	int updateState(Long reservNo, int reservState);

}
