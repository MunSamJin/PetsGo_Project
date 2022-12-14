package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.querydsl.jpa.impl.JPAQueryFactory;

import kosta.mvc.domain.CommunityBoard;
import kosta.mvc.domain.LikeBoard;
import kosta.mvc.domain.LikeBoardArrange;
import kosta.mvc.domain.QCommunityBoard;
import kosta.mvc.repository.CommunityRepository;
import kosta.mvc.repository.LikeBoardRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class CommunityServiceImpl implements CommunityService {
	
	private final CommunityRepository communityRepository;
	private final LikeBoardRepository likeBoardRepository;
	
	@Autowired
	private JPAQueryFactory queryFactory;
	
	private QCommunityBoard qCommunityBoard = QCommunityBoard.communityBoard;

	@Override
	public List<CommunityBoard> selectAll() {
		
		return communityRepository.findAll();
	}
	
	@Override
	public Page<CommunityBoard> selectAll(Pageable pageable) {
		
		return communityRepository.findAll(pageable);
	}

	@Override
	public void insert(CommunityBoard communityBoard) {
		communityRepository.save(communityBoard);

	}

	@Override
	public CommunityBoard selectBy(Long boardNo) {
		CommunityBoard board = communityRepository.findById(boardNo).orElse(null);
		
		if(board==null) {
			throw new RuntimeException("상세보기 오류입니다.");
		}
		return board;
	}

	@Override
	public CommunityBoard update(CommunityBoard board) {
		
		System.out.println("서비스 들어왔니?? repository 호출하자.");
		
		CommunityBoard dbBoard = communityRepository.findById(board.getBoardNo()).orElse(null);
		if(dbBoard==null) {
			throw new RuntimeException("글번호 오류로 수정할 수 없습니다.");
		}
		
		System.out.println("repository 다녀왔니??");
		//수정하자
		dbBoard.setBoardTag(board.getBoardTag());
		dbBoard.setBoardContent(board.getBoardContent());
		dbBoard.setBoardFileName(board.getBoardFileName());
		
		System.out.println("결과는?? dbBoard = " + dbBoard );
		
		return dbBoard;
	}

	@Override
	public void delete(Long boardNo) {
		System.out.println("queryFactory = " + queryFactory);

		communityRepository.deleteById(boardNo);

	}

	@Override
	public Page<CommunityBoard> selectByTag(String tag,PageRequest page) {
		Page<CommunityBoard> list = null;
		if(tag.equals("최신")) {
			System.out.println("최신 정렬기능, 서비스 tag = " + tag);
			list = communityRepository.latestSelect(page);
			
		}else {
			list = communityRepository.tagSelect("%"+tag+"%", page);
		}
		
		return list;
	}
	
	

	@Override
	public int selectAll(Long memberNo, Long boardNo) {
		
		int likeResult = 0;
		
		System.out.println("좋아요 서비스 들어왔니?");
		
		LikeBoard likeBoard = likeBoardRepository.selectAll(memberNo, boardNo);
		System.out.println("좋아요 서비스 likeBoard= " + likeBoard);
		
		
		if(likeBoard != null) {
			
			//좋아요 삭제하러 가자
			likeBoardRepository.delete(likeBoard);
			return likeResult;
				
			
	    }else{
	    	//좋아요 insert 
	    	System.out.println("좋아요 안누른게 맞아?? likeBoard=null?? " + likeBoard);
	    	
	    	likeBoardRepository.insertLikeBoard(boardNo, memberNo);
	    	
	    	return likeResult=1;
	    }
	    	
	}

	@Override
	public Page<LikeBoardArrange> selectLikeBoardArrange(PageRequest page) {
		
		return communityRepository.likeSelect(page);
	}

	@Override
	public LikeBoard selectLikeNo(Long memberNo, Long boardNo) {
		
		return likeBoardRepository.selectAll(memberNo, boardNo);
	}

	@Override
	public Page<CommunityBoard> selectByCampTag(String tag, Pageable page) {
		return communityRepository.campTagSelect("%"+tag+"%", page);
	}

	@Override
	public List<CommunityBoard> selectByCampRe(String campName) {
		return queryFactory
				.selectFrom(qCommunityBoard)
				.where(qCommunityBoard.boardTag.contains(campName))
				.fetch();
	}

	@Override
	public int selectLikeTotal(Long memberNo) {
		
		return communityRepository.selectLikeTotal(memberNo);
	}



}
