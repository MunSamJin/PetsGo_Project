package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.Reservation;

public interface ReservationRepository extends JpaRepository<Reservation, Long>, QuerydslPredicateExecutor<Reservation>{

	@Query(value = "select * from Reservation where member_no=?1 order by reserv_date desc", nativeQuery = true)
	List<Reservation> selectAll(Long memberNo);
	
	@Query(value = "update reservation set reserv_state=4 where member_no=?1 and reserv_no=?2", nativeQuery = true)
	@Modifying
	int updateReservState(Long memberNo, Long reservationNo);
	
	@Query(value = "select reserv_state from Reservation where member_no=?1 and reserv_no=?2", nativeQuery = true)
	int selectReservState(Long memberNo, Long reservationNo);

	
	//List<Reservation> findByCampOrderByReservDate(Long campNo);
	
	@Query(value="select * from Reservation where camp_no=?1 order by reserv_date", nativeQuery = true)
	List<Reservation> selectByCamp(Long campNo);
	
	@Query(value="select * from Reservation where camp_no=?1 and reserv_state=?2 order by reserv_date", nativeQuery = true)
	List<Reservation> selectByCampState(Long campNo, int reservState);
	
	@Query(value = "update reservation set reserv_state=?2 where reserv_no=?1", nativeQuery = true)
	@Modifying
	int updateReservState(Long reservNo, int reservState);
}
