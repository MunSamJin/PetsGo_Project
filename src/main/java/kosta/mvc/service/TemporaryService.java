package kosta.mvc.service;

import kosta.mvc.domain.Temporary;

public interface TemporaryService {
	
	Long insert(Temporary temporary);
	
	void delete(Long teNo);

	Temporary selectBy(Long resiNo, String checkIn, String checkOut);
}
