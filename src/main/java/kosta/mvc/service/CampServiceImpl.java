package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kosta.mvc.domain.Camp;
import kosta.mvc.domain.Member;
import kosta.mvc.repository.CampRepository;

@Service
@Transactional
public class CampServiceImpl implements CampService {
	
	@Autowired
	private CampRepository campRep;
	
	/*
	 * 비밀번호 암호화를 위한 객체를 주입받는다 
	 */
	@Autowired
	private PasswordEncoder passwordEncoder; 


	@Override
	public void insert(Camp camp) {
		//비밀번호 암호화
		String encodedPassword = passwordEncoder.encode(camp.getCampPassword());
		System.out.println("캠핑장 신청 service encodedPassword = " + encodedPassword);
		
		camp.setCampPassword(encodedPassword);
		camp.setCampState(0);
		camp.setCampLat("0");
		camp.setCampLong("0");
		camp.setCampManageNo("guest");
		campRep.save(camp);

	}	

	@Override
	public Camp selectBy(Long bno) {
		Camp camp = campRep.findById(bno).orElse(null);
		if(camp==null) throw new RuntimeException("해당 캠핑장은 존재하지 않습니다");
		return camp;
	}

	@Override
	public Camp update(Camp camp) {
		//String str="141-12-01303";
		Camp dbCamp = campRep.findById(camp.getCampNo()).orElse(null);
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

	@Override
	public Camp selectBy(String campRegNo) {
		Camp camp = campRep.findByCampRegNo(campRegNo);
		/*Camp camp = null;
		for(Camp c : campList) { //어차피 1개...
			camp = c;
		}*/
		return camp;
	}

}
