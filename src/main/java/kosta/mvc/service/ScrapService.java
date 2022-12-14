package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.Camp;
import kosta.mvc.domain.Member;
import kosta.mvc.domain.Scrap;

public interface ScrapService {

	String scrap(Member member, Camp camp);
	
	List<Scrap> selectByMember(Long memberNo);
}
