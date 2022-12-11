package kosta.mvc.service;

import java.util.List;
import java.util.Random;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kosta.mvc.domain.Camp;
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
		camp.setCampState(1);
		camp.setCampLat("0");
		camp.setCampLong("0");
		camp.setCampManageNo("temporaryNo");
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
	public Camp campStateUpdate(Long campNo, int campState) {
		Camp camp = campRep.findById(campNo).orElse(null);
		
		if(campState==0) camp.setCampState(0);
		else if(campState==1) {//등록
			camp.setCampState(1);
			camp.setCampRole("ROLE_OWNER");
			while(true) {
				String campManageNo = createManageNo();
				if(campRep.findByCampManageNo(campManageNo)==null) {
					camp.setCampManageNo(campManageNo);
					break;
				}
			}
			
		}
		else if(campState==2) camp.setCampState(2);
		else if(campState==3) camp.setCampState(3);
		else if(campState==5) delete(campNo);
		
		System.out.println("캠핑장 상태 변경! campNo="+campNo+" campState="+campState);
		return camp;
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

	@Override
	public List<Camp> select(int campState) {
		List<Camp> campList = campRep.findByCampState(campState);
		return campList;
	}

	@Override
	public List<Camp> selectAll() {
		List<Camp> campList = campRep.findAll();
		return campList;
	}
	
	
	//관리자번호 랜덤 생성
	public String createManageNo() {
		Random ran = new Random();
		StringBuilder sb = new StringBuilder();

        for (int i = 0; i < 16; i++) {
        	sb.append((ran.nextInt(10)));
    	}
    	return "CDFI"+sb.toString();
	}

	@Override
	public void delete(Long campNo) {
		campRep.deleteById(campNo);
		
	}

}
