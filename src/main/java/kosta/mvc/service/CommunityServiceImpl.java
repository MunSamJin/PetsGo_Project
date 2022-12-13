package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
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

	@Override
	public List<CommunityBoard> selectAll() {
		
		return communityRepository.findAll();
	}
	
	@Override
	public List<CommunityBoard> selectAll(Pageable pageable) {
		
		return communityRepository.findAll();
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
		CommunityBoard dbBoard = communityRepository.findById(board.getBoardNo()).orElse(null);
		if(dbBoard==null) {
			throw new RuntimeException("글번호 오류로 수정할 수 없습니다.");
		}
		
		//수정하자
		dbBoard.setBoardTag(board.getBoardTag());
		dbBoard.setBoardContent(board.getBoardContent());
		dbBoard.setBoardFileName(board.getBoardFileName());
		
		return dbBoard;
	}

	@Override
	public void delete(Long boardNo) {
		System.out.println("queryFactory = " + queryFactory);

		communityRepository.deleteById(boardNo);

	}

	@Override
	public List<CommunityBoard> selectByTag(String tag) {
		List<CommunityBoard> list = null;
		if(tag.equals("최신")) {
			System.out.println("최신 정렬기능, 서비스 tag = " + tag);
			list = communityRepository.latestSelect();
			
		}else {
			list = communityRepository.tagSelect("%"+tag+"%");
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
	public List<LikeBoardArrange> selectLikeBoardArrange() {
		
		return communityRepository.likeSelect();
	}

	@Override
	public LikeBoard selectLikeNo(Long memberNo, Long boardNo) {
		
		return likeBoardRepository.selectAll(memberNo, boardNo);
	}


}
