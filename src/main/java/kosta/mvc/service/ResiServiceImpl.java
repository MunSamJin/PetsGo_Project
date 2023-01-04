package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kosta.mvc.domain.Camp;
import kosta.mvc.domain.Residence;
import kosta.mvc.domain.ResidenceDetail;
import kosta.mvc.repository.ResidenceDetailRepository;
import kosta.mvc.repository.ResidenceRepository;

@Service
@Transactional
public class ResiServiceImpl implements ResiService {
	
	@Autowired
	private ResidenceRepository resiRep;
	@Autowired
	private ResidenceDetailRepository resiDetailRep;

	@Override
	public List<Residence> selectAll(Long campNo) {
		List<Residence> resiList= resiRep.findAll();
		return resiList;
	}

	@Override
	public Page<Residence> selectAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(Residence resi, String resiCount) {
		resiRep.save(resi);
		
		int count = Integer.parseInt(resiCount);
		for(int i=1; i<=count; i++) {
			String resiDetailName = "숙소";
			resiDetailRep.save(new ResidenceDetail(null,resiDetailName+i,resi));
		}
	}

	@Override
	public Residence selectByResiNo(Long resiNo) {
		Residence resi = resiRep.findById(resiNo).orElse(null);
		if(resi==null) throw new RuntimeException("해당 숙소는 존재하지 않습니다");
		return resi;
	}

	@Override
	public Residence update(Residence resi) {
		Residence dbResi = resiRep.findById(resi.getResiNo()).orElse(null);
		if(dbResi==null) throw new RuntimeException("해당 숙소는 존재하지 않습니다");
		
		//camp, residenceDetailList 뺌
		dbResi.setResiAmeniti(resi.getResiAmeniti());
		dbResi.setResiEnv(resi.getResiEnv());
		dbResi.setResiFilename(resi.getResiFilename());
		dbResi.setResiGround(resi.getResiGround());
		dbResi.setResiIntro(resi.getResiIntro());
		dbResi.setResiName(resi.getResiName());
		dbResi.setResiPeople(resi.getResiPeople());
		dbResi.setResiPet(resi.getResiPet());
		dbResi.setResiPrice(resi.getResiPrice());
		dbResi.setResiType(resi.getResiType());
		
		return dbResi;
	}

	@Override
	public void delete(Long bno, String password) {
		// TODO Auto-generated method stub

	}

}
