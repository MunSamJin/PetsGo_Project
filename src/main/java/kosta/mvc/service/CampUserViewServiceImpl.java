package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.mvc.domain.Camp;
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
	public Camp selectByCampNo(Long campNo) {
		Camp camp = campUserViewRepository.findById(campNo).orElse(null);
		if(camp==null) throw new RuntimeException("해당 캠핑장은 없는 정보 입니다");
		return camp;
	}
}
