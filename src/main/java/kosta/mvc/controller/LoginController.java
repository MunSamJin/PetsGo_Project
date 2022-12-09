package kosta.mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.mvc.domain.Camp;
import kosta.mvc.domain.Member;
import kosta.mvc.service.CampService;
import kosta.mvc.service.MemberService;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CampService campService;
	
	/**
	 * 회원 로그인
	 * */
	@RequestMapping("/member")
	public String login(Member member, HttpSession session) {
		System.out.println("controller login member = " + member);
		
		member = memberService.login(member);
		
		System.out.println("service login 갔다 옴~");
		
		session.setAttribute("member", member);
		session.setAttribute("memberNo", member.getMemberNo());
		
	    // 세션 유지시간 설정(초단위)
	    // 60 * 30 = 30분
	    // session.setMaxInactiveInterval(30*60);

	    // 세션 시간을 무한대로 설정
		session.setMaxInactiveInterval(-1);
		
		return "redirect:/member/main";
	}

	/**
	 * 사업자 로그인
	 * */
	/* @RequestMapping("/camp")
	public String login(Camp camp, HttpSession session) {
		camp = campService.login(camp);
		
		session.setAttribute("camp", camp);
		
		return "redirect:/owner/campHome";
	} */
	
	/**
	 * 관리자 로그인
	 * */
	/* @RequestMapping("/admin")
	public String login(Member member, HttpSession session) {
		member = memberService.login(member);
		
		session.setAttribute("member", member);
		
		return "redirect:/member/main";
	} */
}
