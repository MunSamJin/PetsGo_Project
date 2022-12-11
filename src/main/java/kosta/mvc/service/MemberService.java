package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.Member;
import kosta.mvc.domain.Pet;
import kosta.mvc.domain.Reservation;

public interface MemberService {
	
	/**
	 * 이메일 중복 확인
	 * */
	String emailCheck(String email);
	
	/**
	 * 닉네임 중복 확인
	 * */
	String nicknameCheck(String nickname);
	
	/**
	 * 회원 가입
	 * */
	void register(Member member);
	
	/**
	 * 로그인
	 * */
	Member login(Member member);
	
	/**
	 * 회원 정보 수정하기
	 * */
	Member updateInfo(Member member);
	
	/////////////////////////
	
	/**
	 * 이메일 찾기
	 * */
	String searchEmail(Member member);
	
	/**
	 * 비밀번호 찾기
	 * */
	String searchPwd(Member member);
	
	/**
	 *  마이페이지 예약내역 조회
	 */
	List<Reservation> selectAll(Long memberNo);
	
	/**
	 *  결제취소요청하기
	 */
	int updateReservState(Long memberNo, Long reservationNo);
	
}
