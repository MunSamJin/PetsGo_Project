package kosta.mvc.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.mvc.domain.Camp;
import kosta.mvc.domain.Residence;
import kosta.mvc.repository.CampUserViewRepository;

@Service
@Transactional
public class CampUserViewServiceImpl implements CampUserViewService {
	
	@Autowired
	private CampUserViewRepository campUserViewRepository;

	@Override
	public List<Camp> selectAll() {
		return campUserViewRepository.findAll();
	}
	
	@Override
	public List<Camp> selectAll(int resiPrice1, int resiPrice2, String aa) {
		List<Camp> campList = new ArrayList<Camp>();
		if(aa.equals('1')) {
			campList = campUserViewRepository.selectByPrice("desc");
		} else if(aa.equals('2')) {
			campList = campUserViewRepository.selectByPrice("asc");
		} else {
			campList = campUserViewRepository.findAll();
		}
		List<Camp> campserch = new ArrayList<Camp>();
		for(Camp c : campList) {
			List<Residence> resiList = c.getResidenceList();
			for(Residence r : resiList) {
				int price = r.getResiPrice();
				if(price<=resiPrice2 && price>=resiPrice1) {
					if(!campserch.equals(c)) campserch.add(c);
				}
			}
		}
		return campserch;
	}

	@Override
	public Camp selectByCampNo(Long campNo) {
		Camp camp = campUserViewRepository.findById(campNo).orElse(null);
		if(camp==null) throw new RuntimeException("해당 캠핑장은 없는 정보 입니다");
		return camp;
	}
}
