package kosta.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.mvc.domain.Member;
import kosta.mvc.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	/**
	 * 회원가입 폼
	 * */
	@RequestMapping("/joinForm")
	public void joinForm() {}
	
	/**
	 * 회원가입
	 * */
	@RequestMapping("/join")
	public String join(Member member) {
		memberService.join(member);
		
		return "redirect:/";
	}
	
	/**
	 * 로그인 폼
	 * */
	@RequestMapping("/loginForm")
	public void loginForm() {}
	
	/**
	 * 로그인
	 * */
	/* @RequestMapping("/login")
	public String login(Member member, Model model) {
		member = memberService.login(member);
		model.addAttribute("member", member);
		
		return "/";
	} */
}
