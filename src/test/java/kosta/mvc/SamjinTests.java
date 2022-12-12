package kosta.mvc;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

import kosta.mvc.domain.Member;
import kosta.mvc.domain.Reservation;
import kosta.mvc.repository.DetailRepository;
import kosta.mvc.repository.ReservationRepository;

@SpringBootTest
@Commit
@Transactional
public class SamjinTests {
	
	@Autowired
	private ReservationRepository reservationRep;
	
	@Autowired
	private DetailRepository detailRep;
	
	@Test
	void syso() {
		System.out.println("reservationRep = " + reservationRep);
	}
	
	/**
	 * 예약테이블 등록
	 */
	/*
	 * void insert() { reservationRep.save(new Reservation(null, null, null, null,
	 * null, 0, 0, 0, null, null, 0, 0, null, null, null, null)); }
	 */
	
	//null, "문삼진", "010-6613-0091", null, "kakaopay", 120000, 0, 2, "22/12/23", "22/12/25", 1, 10000, new Member((long) 1), null, null
	
	/*Long reservNo, String reservName, String reservPhone, LocalDateTime reservDate, 
	String reservType, int reservPrice, int reservState, int reservPeople, String reservCheckin, String reservCheckout,
	int reservTotalPet, int reservInsuranceTotal, 
	Member member, Camp camp, Residence residence */
	
	/**
	 *  예약상세테이블 등록
	 */
	
	


}
