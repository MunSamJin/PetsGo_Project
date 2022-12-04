package kosta.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.mvc.domain.CommunityFiles;
import kosta.mvc.repository.CommunityFilesRepository;

@Service
public class CommunityFilesServiceImpl implements CommunityFilesService {
	
	@Autowired
	private CommunityFilesRepository communityFilesRepository;

	@Override
	public List<CommunityFiles> getAllFiles() {
		
		return communityFilesRepository.findAll();
		//return null;
	}

	@Override
	public void saveAllFilesList(List<CommunityFiles> fileList) {
		
		for(CommunityFiles communityFiles : fileList) {
			communityFilesRepository.save(communityFiles);
		}

	}

}
