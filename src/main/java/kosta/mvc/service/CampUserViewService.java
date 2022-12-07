package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.Camp;

public interface CampUserViewService {

	List<Camp> selectAll();
	
	Camp selectByCampNo(Long campNo);
}
