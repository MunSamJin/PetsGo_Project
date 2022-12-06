package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kosta.mvc.domain.Camp;
import kosta.mvc.repository.CampRepository;

@Service
@Transactional
public class CampServiceImpl implements CampService {
	
	@Autowired
	private CampRepository campRep;

	
	/**
	 * 전체검색
	 */
	@Override
	public Camp selectAll() {
		String str="141-12-01303";
		Camp camp = campRep.selectCamp(str);
		return camp;
		//return null;
	}

	@Override
	public Page<Camp> selectAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(Camp camp) {
		camp.setCampState(0);
		campRep.save(camp);

	}

	@Override
	public Camp selectBy(Long bno, boolean state) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Camp update(Camp camp) {
		String str="141-12-01303";
		Camp dbCamp = campRep.selectCamp(str);
		dbCamp.setCampAddr(camp.getCampAddr());
		dbCamp.setCampCheckin(camp.getCampCheckin());
		dbCamp.setCampCheckout(camp.getCampCheckout());
		dbCamp.setCampFacility(camp.getCampFacility());
		dbCamp.setCampFilename(camp.getCampFilename());
		dbCamp.setCampIntro(camp.getCampIntro());
		dbCamp.setCampNotify(camp.getCampNotify());
		dbCamp.setCampPhone(camp.getCampPhone());
		dbCamp.setCampPost(camp.getCampPost());
		
		
		return dbCamp;
	}

	@Override
	public void delete(Long bno, String password) {
		// TODO Auto-generated method stub

	}

}
