package kosta.mvc;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

import kosta.mvc.domain.Camp;
import kosta.mvc.domain.Residence;
import kosta.mvc.repository.CampRepository;
import kosta.mvc.repository.ResidenceDetailRepository;
import kosta.mvc.repository.ResidenceRepository;

@SpringBootTest
@Commit
@Transactional
public class SeryunTest {
	
	@Autowired
	private CampRepository campRep;
	
	@Autowired
	private ResidenceRepository resiRep;
	
	@Autowired
	private ResidenceDetailRepository resiDetailRep;
	
	
	@Test
	public void contextLoads() {
		//캠핑장 테스트 데이터
		campRep.save(new Camp(null, "1234", "zzangah99@naver.com", 1, "﻿CDFI2262132016000034", "141-12-01303", "안성 용설호수캠핑장", "010-8502-2863",17523,
				"경기 안성시 죽산면 용설호수길 234", "0", "0", null,"﻿camp_21_01.jpg",
				"예약시 예약자 성함과 입금자 성함이 동일해야 합니다. 틀리게 되면 예약이 안 될 수 있습니다. <br>용설호수캠핑장은 소규모 캠핑장으로 가족 캠핑을 지향하고 있습니다. 혹여나 사전 예약없이 가까운 지인이나 가족방문시 추가요금 인당 2만원, 차량 2만원 요금을 결제할 분들만 초대해 주세요.", 
				"﻿전사이트 바로앞 용설호수뷰 캠핑 가능. <br>캠핑과 낚시 둘레길 걷기, 허브와 풍뎅이, 등산 주변 골프장 등을 즐길 수 있는 조용한 가족 캠핑장입니다.(사이트 바로 앞 주차)", 
				"화장실,샤워실,개수대,매점,와이파이,체험활동,산책로,반려동물,물놀이,낚시,골프,스키,등산,MTB,기타", null, "13:00", "11:00", "ROLE_OWNER", null));
		
	}
	
	
	
	@Test
	public void resiInsert() {
		//숙소 테스트 데이터
		resiRep.save(new Residence(null, "﻿텐트존", "오토캠핑", "산,숲,호수", "파쇄석", "와이파이,화장실,샤워실,개수대", 50000, 
				"﻿기본인원 : 성인 2명, 미성년 2명 <br>인원추가요금 : 성인(1명 당) 20,000원 <br>청소년(1명 당) 10,000원 <br>미취학아동(1명 당) : 0원 <br>* 추가 요금은 현장에서 결제해주세요. <br><br>카라반&트레일러는 1~10번 사이트만 가능합니다. <br>장박은 캠핑장에 문의해주세요. <br>텐트 옆 기본 주차 1대 가능입니다. <br>기준주차초과 1대 당 10000원 추가<br>트레일러, 캠핑카 진입 가능",
				null, "﻿camp_21_resi_01_01.jpeg,camp_21_resi_01_02.jpg,camp_21_resi_01_03.jpg,camp_21_resi_01_04.jpg",
				5, "﻿5kg 미만 소형견 1마리" , new Camp(), null));
		
	}

}
