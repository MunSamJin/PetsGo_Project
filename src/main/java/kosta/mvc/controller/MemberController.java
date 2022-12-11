package kosta.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.Member;
import kosta.mvc.domain.QnaBoard;
import kosta.mvc.service.MemberService;

@Controller //ajax 처리할 메소드는 @Reponsebody를 붙여주면 됨
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	/**
	 * 이메일 중복 확인
	 * */
	@RequestMapping("/emailCheck")
	@ResponseBody
	public String emailCheck(HttpServletRequest request) {
		return memberService.emailCheck(request.getParameter("memberEmail"));
	}
	
	/**
	 * 닉네임 중복 확인
	 * */
	@RequestMapping("/nicknameCheck")
	@ResponseBody
	public String nicknameCheck(HttpServletRequest request) {
		return memberService.nicknameCheck(request.getParameter("memberNickname"));
	}
	
	/**
	 * 회원 가입
	 * */
	/* @RequestMapping("/register")
	public String register(Member member, HttpSession session) {
		System.out.println("controller 회원가입 member = " + member);
		
		memberService.register(member);
		
		System.out.println("service 갔다 온 회원가입~");
		
		session.setAttribute("member", member);

		return "redirect:/member/main";
	} */

	/**
	 * 회원 정보 수정하기
	 * */
	@RequestMapping("/updateInfo")
	public ModelAndView updateInfo(Member member) {
		member = memberService.updateInfo(member);
		
		return new ModelAndView("member/myInfo", "member", member);
	}
	
	/**
	 * 마이페이지 내 반려견 정보(회원정보-반려견 정보) 이동
	 * */
	/* @RequestMapping("myPet")
	public String myPet() {
		return "member/myPet";
	} */
	
	@RequestMapping("{url}")
	public void url() {}
	
	/**
	 *  예약내역 조회
	 */
	@RequestMapping("/myReservation")
	public void myReservation() {}
}























