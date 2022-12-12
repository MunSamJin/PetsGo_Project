package kosta.mvc.service;

import kosta.mvc.domain.Reservation;

public interface ReservationService {

	void insert(Reservation reser);
	
	Reservation selectBy(Long resiNo, String checkIn, String checkOut);
}
