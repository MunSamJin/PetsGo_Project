package kosta.mvc.service;

import kosta.mvc.domain.Member;

public interface MemberService {
	/**
	 * 회원 가입
	 * */
	void join(Member member);
	
	/**
	 * 로그인
	 * */
	//Member login(Member member);
	
	/**
	 * 마이페이지 수정
	 * */
	void updateMypage(Member member);
	
	/**
	 * 이메일 찾기
	 * */
	String searchEmail(Member member);
	
	/**
	 * 비밀번호 찾기
	 * */
	String searchPwd(Member member);
}
