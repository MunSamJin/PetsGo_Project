package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.BannerBoard;

public interface BannerService {

	/**
	 * 전체검색
	 * @param bannerBoard
	 */
	List<BannerBoard> selectAll();
	
	/**
	 * 등록
	 * @param bannerBoard
	 */
	void insert(BannerBoard bannerBoard);

	/**
	 * 상세보기
	 * @param boardNo
	 * @return
	 */
	BannerBoard selectBy(Long boardNo);

	/**
	 * 수정하기
	 * @param board
	 * @return
	 */
	BannerBoard update(BannerBoard board);

	/**
	 * 삭제하기
	 * @param boardNo
	 */
	void delete(Long boardNo);

}
