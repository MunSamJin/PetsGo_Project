package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.querydsl.jpa.impl.JPAQueryFactory;

import kosta.mvc.domain.CommunityBoard;
import kosta.mvc.domain.QCommunityBoard;
import kosta.mvc.repository.CommunityRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class CommunityServiceImpl implements CommunityService {
	
	private final CommunityRepository communityRepository;
	
	@Autowired
	private JPAQueryFactory queryFactory;

	@Override
	public List<CommunityBoard> selectAll() {
		
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
		
		QCommunityBoard board = QCommunityBoard.communityBoard;
		
		long re = queryFactory
				.delete(board)
				.where(board.boardNo.eq(boardNo))
				.execute();
		
		System.out.println("re = " + re);
		
		if(re==0)throw new RuntimeException("삭제할 수 없습니다.");
		
	}

	@Override
	public List<CommunityBoard> selectByTag(String tag) {
		List<CommunityBoard> list = communityRepository.tagSelect("%"+tag+"%");
		//System.out.println("서비스 list = " + list);
		
		return list;
	}

}
