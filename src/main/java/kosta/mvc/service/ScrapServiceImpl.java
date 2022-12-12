package kosta.mvc.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.querydsl.jpa.impl.JPAQueryFactory;

import kosta.mvc.domain.Camp;
import kosta.mvc.domain.Member;
import kosta.mvc.domain.QScrap;
import kosta.mvc.domain.Scrap;
import kosta.mvc.repository.ScrapRepository;

@Service
@Transactional
public class ScrapServiceImpl implements ScrapService {
	
	@Autowired
	private ScrapRepository scrapRepository;
	
	@Autowired
	private JPAQueryFactory queryFactory;
	
	private QScrap qScrap = QScrap.scrap;

	@Override
	public String scrap(Member member, Camp camp) {
		Scrap scrap = queryFactory
				.selectFrom(qScrap)
				.where(qScrap.member.eq(member))
				.where(qScrap.camp.eq(camp))
				.fetchOne();
		
		String message = "스크랩";
		
		if(scrap==null) {
			scrapRepository.save(new Scrap(null, member, camp));
		} else {
			scrapRepository.delete(scrap);
			message = "언스크랩";
		}
		
		return message;
	}

}
