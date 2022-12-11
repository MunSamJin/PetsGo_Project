package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.Camp;

public interface CampUserViewRepository extends JpaRepository<Camp, Long>, QuerydslPredicateExecutor<Camp> {
	
	@Query(value = "select c.camp_no from camp c join (select camp_no, min(resi_price) as price from residence group by camp_no) d on c.camp_no=d.camp_no order by d.price ?1;", nativeQuery = true)
	List<Camp> selectByPrice(String aa);
	
	@Query(value = "select c.* "
			+ "from camp c "
			+ "join (select r.camp_no "
			+ "from residence r "
			+ "left join reservation c "
			+ "on r.resi_no = c.resi_no "
			+ "where r.resi_people>?1) a "
			+ "on c.camp_no=a.camp_no "
			+ "where c.camp_addr like ?2", nativeQuery = true)
	List<Camp> selectAll(int resiPeople, String campAddr);
	
	@Query(value = "select c.* "
			+ "from camp c "
			+ "join (select r.camp_no "
			+ "from residence r "
			+ "left join reservation c "
			+ "on r.resi_no = c.resi_no "
			+ "where (reserv_checkin not BETWEEN ?3 and ?4) "
			+ "and (c.reserv_checkout not BETWEEN ?3 and ?4) "
			+ "and r.resi_people>?1) a "
			+ "on c.camp_no=a.camp_no "
			+ "where c.camp_addr like ?2", nativeQuery = true)
	List<Camp> selectAll(int resiPeople, String campAddr, String checkIn, String checkOut);
	
	@Query(value = "select c.* "
			+ "from camp c "
			+ "join (select r.camp_no, r.resi_price "
			+ "from residence r "
			+ "left join reservation c "
			+ "on r.resi_no = c.resi_no "
			+ "where (c.reserv_checkin not BETWEEN ?3 and ?4) "
			+ "and (c.reserv_checkout not BETWEEN ?3 and ?4) "
			+ "and r.resi_people>?1 "
			+ "and (r.resi_price BETWEEN ?5 and ?6)) a "
			+ "on c.camp_no=a.camp_no "
			+ "where c.camp_addr like ?2", nativeQuery = true)
	List<Camp> selectAll(int resiPeople, String campAddr, String checkIn, String checkOut, int resiPrice1, int resiPrice2, String aa);
}
