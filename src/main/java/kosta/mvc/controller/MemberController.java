package kosta.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.Member;
import kosta.mvc.domain.QnaBoard;
import kosta.mvc.domain.Reservation;
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
	public void myReservation(Model model, Authentication auth) {
		
		Object object = auth.getPrincipal();
		Member member = null;
		
		if(object instanceof Member) {
			member = (Member)auth.getPrincipal();
		}
		Long memberNo = member.getMemberNo();
		//System.out.println("member컨트롤러 memberNo = " + memberNo);
		
		List<Reservation> list = memberService.selectAll(memberNo);
		//System.out.println("member컨트롤러 list = " + list);
		
		model.addAttribute("reservation", list);
	}
	
	/**
	 *  결제취소요청하기
	 */
	@RequestMapping("/cancelPay")
	@ResponseBody
	public int cancelPay(Long reservationNo, Authentication auth) {
		System.out.println("member컨트롤러 결제취소요청하러 왔니?");
		System.out.println("member컨트롤러 예약번호 reservationNo = " + reservationNo);
		
		Object object = auth.getPrincipal();
		Member member = null;
		
		if(object instanceof Member) {
			member = (Member)auth.getPrincipal();
		}
		Long memberNo = member.getMemberNo();
		System.out.println("member컨트롤러 memberNo = " + memberNo);
		
		int dbReservState = memberService.updateReservState(memberNo, reservationNo);
		
		return dbReservState;
	}
}























