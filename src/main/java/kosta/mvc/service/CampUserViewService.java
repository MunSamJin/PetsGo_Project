package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.Camp;

public interface CampUserViewService {

	List<Camp> selectAll();
	
	List<Camp> selectAll(int resiPrice1, int resiPrice2, String aa);
	
	Camp selectByCampNo(Long campNo);
}
