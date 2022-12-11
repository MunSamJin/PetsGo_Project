package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.Camp;

public interface CampUserViewService {

	List<Camp> selectAll(int resiPeople, String campAddr, String checkIn, String checkOut);
	
	List<Camp> select(int resiPeople, String campAddr, String checkIn, String checkOut, 
			int resiPrice1, int resiPrice2, String aa, String tag);
	
	Camp selectByCampNo(Long campNo);
}
