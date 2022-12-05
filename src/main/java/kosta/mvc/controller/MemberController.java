package kosta.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.Member;
import kosta.mvc.service.MemberService;

@Controller //ajax 처리할 메소드는 @Reponsebody를 붙여주면 됨
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	/**
	 * 테스트용 인덱스
	 * */
	@RequestMapping("/member/index")
	public void index() {}

	/**
	 * 회원 가입 폼
	 * */
	@RequestMapping("registerForm")
	public String registerForm() {
		return "member/registerForm";
	}
	
	/**
	 * 이메일 중복 확인
	 * */
	@RequestMapping("emailCheck")
	@ResponseBody
	public String emailCheck(HttpServletRequest request) {
		return memberService.emailCheck(request.getParameter("memberEmail"));
	}
	
	/**
	 * 닉네임 중복 확인
	 * */
	@RequestMapping("nicknameCheck")
	@ResponseBody
	public String nicknameCheck(HttpServletRequest request) {
		return memberService.nicknameCheck(request.getParameter("memberNickname"));
	}
	
	/**
	 * 회원 가입
	 * */
	@RequestMapping("register")
	public String register(Member member) {
		memberService.register(member);

		return "redirect:/member/index";
	}	
	
	/**
	 * 로그인 폼
	 * */
	@RequestMapping("loginForm")
	public String loginForm() {
		return "member/loginForm";
	}
	
	/**
	 * 로그인
	 * */
	@RequestMapping("/member/login")
	public String login(Member member, HttpSession session) {
		member = memberService.login(member);
		
		session.setAttribute("member", member);
		
		return "redirect:/member/index";
	}
	
	/**
	 * 로그아웃
	 * */
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/member/index";
	}
	
	/**
	 * 마이페이지 이동(예약내역-예약목록이 바로 뜸)
	 * */
	@RequestMapping("myPage")
	public String myPage() {
		return "member/myReservation";
	}
	
	/**
	 * 마이페이지 내 스크랩북 이동
	 * */
	@RequestMapping("myScrap")
	public String myScrap() {
		return "member/myScrap";
	}
	
	/**
	 * 마이페이지 내 커뮤니티 이동
	 * */
	@RequestMapping("myCommunity")
	public String myCommunity() {
		return "member/myCommunity";
	}
	
	/**
	 * 마이페이지 내 문의사항 이동
	 * */
	@RequestMapping("myQna")
	public String myQna() {
		return "member/myQna";
	}
	
	/**
	 * 마이페이지 내 회원 정보(회원정보-회원 정보) 이동
	 * */
	@RequestMapping("myInfo")
	public String myInfo() {
		return "member/myInfo";
	}
	
	/**
	 * 회원 정보 수정 전 비밀번호 일치 여부 확인
	 * */
	@RequestMapping("passwordCheck")
	public String passwordCheck() {
		return "member/passwordCheck";
	}
	
	/**
	 * 회원 정보 수정 폼
	 * */
	@RequestMapping("updateForm")
	public String updateForm() {
		return "member/updateForm";
	}
	
	/**
	 * 회원 정보 수정하기
	 * */
	@RequestMapping("updateInfo")
	public ModelAndView updateInfo(Member member) {
		member = memberService.updateInfo(member);
		
		return new ModelAndView("member/myInfo", "member", member);
	}
	
	/**
	 * 마이페이지 내 반려견 정보(회원정보-반려견 정보) 이동
	 * */
	@RequestMapping("myPet")
	public String myPet() {
		return "member/myPet";
	}
}























