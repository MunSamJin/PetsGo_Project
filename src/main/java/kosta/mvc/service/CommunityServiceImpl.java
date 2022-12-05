package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import kosta.mvc.domain.CommunityBoard;
import kosta.mvc.repository.CommunityRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class CommunityServiceImpl implements CommunityService {
	
	private final CommunityRepository communityRepository;

	@Override
	public List<CommunityBoard> selectAll() {
		
		return communityRepository.findAll();
	}

	@Override
	public void insert(CommunityBoard communityBoard) {
		communityRepository.save(communityBoard);

	}

}
