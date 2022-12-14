package kosta.mvc.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kosta.mvc.domain.Camp;
import kosta.mvc.domain.CommunityBoard;
import kosta.mvc.domain.Member;
import kosta.mvc.service.CampService;
import kosta.mvc.service.CommunityService;
import kosta.mvc.service.MemberService;

@Controller
public class HomeController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CommunityService communityService;
	
	@RequestMapping("/")
	public String index() {
		return "main";
	}
	
	@RequestMapping("/main")
	public void main() {};

	/**
	 * 회원 로그인 폼
	 * */
	@RequestMapping("/loginForm") 
	public void loginForm() {}
	
	/**
	 * 관리자 로그인 폼
	 * */
	@RequestMapping("/login") 
	public void login() {}

	/**
	 * 회원/사업자에 따라 로그인 후 이동할 기본 페이지
	 * */
	@RequestMapping("/default")
	public String defaultAfterLogin(Authentication auth) throws AuthenticationException {				
		Object object = auth.getPrincipal();
		
		if(object instanceof Member) {
			Member  m = (Member)auth.getPrincipal();
			return "redirect:/";
		} else {
			Camp  c = (Camp)auth.getPrincipal();
			return "redirect:/owner/campHome";
		} 
	}
	
	/**
	 * 회원 가입 폼
	 * */
	@RequestMapping("/registerForm") 
	public void registerForm() {}
	
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
	 * 로그아웃
	 * */
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
}
