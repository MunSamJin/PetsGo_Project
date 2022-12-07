package kosta.mvc.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kosta.mvc.domain.Camp;
import kosta.mvc.domain.Residence;

public interface ResiService {

	/**
	 * 전체검색
	 */
	List<Residence> selectAll();

	/**
	 * 전체검색 - Page처리
	 */
	Page<Residence> selectAll(Pageable pageable);

	/**
	 * 등록
	 */
	void insert(Residence resi);

	/**
	 * 글번호 검색
	 */
	Residence selectByResiNo(Long resiNo);

	/**
	 * 수정하기
	 */

	Residence update(Residence resi);

	/**
	 * 삭제하기
	 */
	void delete(Long bno, String password);
}
