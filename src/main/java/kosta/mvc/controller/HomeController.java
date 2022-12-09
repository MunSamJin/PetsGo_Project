package kosta.mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kosta.mvc.domain.Camp;
import kosta.mvc.domain.Member;
import kosta.mvc.service.MemberService;

@Controller
public class HomeController {

	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/")
	public String index() {
		return "main";
	}
	
	@RequestMapping("/{url}")
	public void url() {}
	
	@RequestMapping("/campRequest/campInsertForm")
	public void url2() {}
	
	/**
	 * 회원/사업자에 따라 로그인 후 이동할 기본 페이지
	 * */
	@RequestMapping("/default")
	public String defaultAfterLogin(Authentication auth) throws AuthenticationException {		
		
		Object object = auth.getPrincipal();
		if(object instanceof Member) {
			Member  m = (Member)auth.getPrincipal();
			return "redirect:/main";
		}else {
			Camp  c = (Camp)auth.getPrincipal();
			return "redirect:/owner/campHome";
		}
	}
	
	/**
	 * 회원 가입
	 * */
	@RequestMapping("/register")
	public String register(Member member, HttpSession session) {
		memberService.register(member);
		
		session.setAttribute("member", member);

		return "redirect:/main";
	}	
	
	/**
	 * 로그아웃
	 * */
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/main";
	}	
	
	@RequestMapping("/test5")
	public String test5() {
		return "/index";
	}
	
	@RequestMapping("/samjinTest")
	public void samjinTest() {
	}
	
}
