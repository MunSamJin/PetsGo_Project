package kosta.mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.mvc.domain.Member;
import kosta.mvc.service.MemberService;

@Controller
public class HomeController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/index")
	public void index() {}
	
	@RequestMapping("{url}")
	public void url() {}
	
	/**
	 * 회원 가입
	 * */
	@RequestMapping("/register")
	public String register(Member member, HttpSession session) {
		System.out.println("controller 회원가입 member = " + member);
		
		memberService.register(member);
		
		System.out.println("service 갔다 온 회원가입~");
		
		session.setAttribute("member", member);

		return "redirect:/member/main";
	}	
	
	/**
	 * 로그아웃
	 * */
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/main";
	}
	
	
	
	@RequestMapping("/test2")
	public String test2() {
		return "/index";
	}
	
	@RequestMapping("/test3")
	public String test3() {
		return "/index";
	}
	
	@RequestMapping("/test4")
	public String test4() {
		return "/index";
	}
	
	@RequestMapping("/test5")
	public String test5() {
		return "/index";
	}
	
	@RequestMapping("/test6")
	public String test6() {
		return "/index";
	}
	
	@RequestMapping("/test7")
	public String test7() {
		return "/index";
	}
}
