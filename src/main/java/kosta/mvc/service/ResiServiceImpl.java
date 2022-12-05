package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kosta.mvc.domain.Camp;
import kosta.mvc.domain.Residence;
import kosta.mvc.repository.ResidenceRepository;

@Service
@Transactional
public class ResiServiceImpl implements ResiService {
	
	@Autowired
	private ResidenceRepository resiRep;
	

	@Override
	public List<Residence> selectAll() {
		List<Residence> resiList= resiRep.findAll();
		
		return resiList;
	}

	@Override
	public Page<Residence> selectAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(Residence resi) {
		// TODO Auto-generated method stub

	}

	@Override
	public Camp selectBy(Long bno, boolean state) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Camp update(Residence resi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Long bno, String password) {
		// TODO Auto-generated method stub

	}

}
