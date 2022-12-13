package kosta.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.CommunityBoard;
import kosta.mvc.domain.Member;
import kosta.mvc.domain.QnaBoard;
import kosta.mvc.domain.Reservation;
import kosta.mvc.service.CommunityService;
import kosta.mvc.service.MemberService;

@Controller //ajax 처리할 메소드는 @Reponsebody를 붙여주면 됨
@RequestMapping("/member")
public class MemberController {

	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CommunityService communityService;
	

   /**
    * 마이페이지 내 스크랩북 이동
    * */
   @RequestMapping("/myScrap")
   public void myScrap() {}
   
   /**
    * 마이페이지 내 커뮤니티 이동
    * */
   @RequestMapping("/myCommunity")
   public void myCommunity() {}
   
   /**
    * 마이페이지 내 회원 정보 이동
    * */
   @RequestMapping("/myInfo")
   public void myInfo() {}
   
   /**
    * 회원 정보 수정하기
    * */
   @RequestMapping("/updateInfo")
   public ModelAndView updateInfo(Member member) {
      member = memberService.updateInfo(member);
      
      return new ModelAndView("member/myInfo", "member", member);
   }
   
	
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
		System.out.println("member컨트롤러 list = " + list);
		
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

	/**
	 * 마이페이지 내 문의 이동
	 * */
	@RequestMapping("/myQna")
	public void qnaList(Model model) {
		List<QnaBoard> qnaBoardList = memberService.qnaList();
		
		model.addAttribute("qnaBoardList", qnaBoardList);
	}
	
	/**
	 * 마이페이지 내 문의 등록하기
	 * */
	@RequestMapping("/qnaInsert")
	public String qnaInsert(QnaBoard qna) {		
		memberService.qnaInsert(qna);
		
		return "redirect:/member/myQna";
	}
	
	
	/**
	 * 마이페이지 내커뮤니티 조회
	 */
	@RequestMapping("/myCommunity")
	public void myCommunity(Model model, Authentication auth) {
		
		Object object = auth.getPrincipal();
		Member member = null;
		
		if(object instanceof Member) {
			member = (Member)auth.getPrincipal();
		}
		Long memberNo = member.getMemberNo();
		//System.out.println("member컨트롤러 memberNo = " + memberNo);
		
		List<CommunityBoard> list = memberService.selectCommunityAll(memberNo);
		System.out.println("member컨트롤러 list = " + list);
		
		model.addAttribute("myCommunity", list);
		
	}
	
	/**
	 * 마이페이지 내커뮤니티 게시글 삭제
	 */
	@RequestMapping("/delete/{boardNo}")
	public String delete(@PathVariable Long boardNo) {
		System.out.println("마이페이지컨트롤러 boardNo = " + boardNo);
		communityService.delete(boardNo);
		return "redirect:/member/myCommunity";
	}
	
 
   /**
    * 마이페이지 내 문의 삭제하기
    * */
   @RequestMapping("/qnaDelete/{qnaNo}")
   public String qnaDelete(@PathVariable Long qnaNo) {
      memberService.qnaDelete(qnaNo);
      
      return "redirect:/member/myQna";
   }

}

