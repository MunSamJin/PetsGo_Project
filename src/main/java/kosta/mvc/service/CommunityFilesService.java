package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.CommunityFiles;

public interface CommunityFilesService {
	
	List<CommunityFiles> getAllFiles();
	
    void saveAllFilesList(List<CommunityFiles> fileList);

}
