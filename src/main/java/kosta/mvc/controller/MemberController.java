package kosta.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.Camp;
import kosta.mvc.domain.CommunityBoard;
import kosta.mvc.domain.LikeBoard;
import kosta.mvc.domain.Member;
import kosta.mvc.domain.Pet;
import kosta.mvc.domain.QnaBoard;
import kosta.mvc.domain.Reservation;
import kosta.mvc.domain.Scrap;
import kosta.mvc.service.CampService;
import kosta.mvc.service.CommunityService;
import kosta.mvc.service.MemberService;
import kosta.mvc.service.ScrapService;

@Controller //ajax 처리할 메소드는 @Reponsebody를 붙여주면 됨
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private ScrapService scrapService;
  
	@Autowired
	private MemberService memberService;
   
	@Autowired
	private CommunityService communityService;

	@Autowired
	private CampService campService;

 
   /*
	* 비밀번호 암호화를 위한 객체를 주입받는다 
	*/
	@Autowired
	private PasswordEncoder passwordEncoder;    

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
	 * 마이페이지 내 회원 정보 이동
	 * */
	@RequestMapping("/myInfo")
	public void myInfo(Model model, Authentication auth) {
		Object obj = auth.getPrincipal();
		Member member = null;
		
		if(obj instanceof Member) {
			member = (Member)auth.getPrincipal();
		}
		
		Long memberNo = member.getMemberNo();
		
		List<Pet> petList = memberService.petList(memberNo);
		
		model.addAttribute("petList", petList);
	}
	
	
	/*
	 * 마이페이지 내 스크랩북 이동
	 * */
	@RequestMapping("/myScrap")
	public void myScrap(Authentication auth, Model model) {
		Object object = auth.getPrincipal();
		Member member = null;

		
		if(object instanceof Member) {
			member = (Member)auth.getPrincipal();
		}
		
		Long memberNo = member.getMemberNo();
		
		List<Scrap> scrapList = scrapService.selectByMember(memberNo);
		List<Camp> campList = new ArrayList<Camp>();
		
		for(Scrap s : scrapList) {
			campList.add(campService.selectBy(s.getCamp().getCampNo()));
		}
		
		model.addAttribute("campList", campList);
		
		//int likeTotal = communityService.selectLikeTotal(memberNo);
		//System.out.println("likeTotal??? " + likeTotal);
		//model.addAttribute("likeTotal", likeTotal);
	}
	
	/**
	 * 회원 정보 수정 전 비밀번호 확인 폼
	 * */
	@RequestMapping("/passwordCheckForm")
	public void passwordCheckForm() {}

	/**
	 * 회원 정보 수정 전 비밀번호 확인
	 * */
	@RequestMapping("/passwordCheck")
	@ResponseBody	
	public String passwordCheck(HttpServletRequest request, Authentication auth) {
		String password = request.getParameter("memberPassword");
		
		Member member = (Member)auth.getPrincipal();
		
		if(!passwordEncoder.matches(password, member.getMemberPassword())) return "fail";
		else return "ok";
	}
	
	/**
	 * 회원 정보 수정 폼
	 * */
	@RequestMapping("/updateForm")
	public void updateForm() {}
	
	/**
	 * 회원 정보 수정하기
	 * */
	@RequestMapping("/updateInfo")
	public ModelAndView updateInfo(Member member) {		
		//비밀번호 암호화
		String encodedPassword = passwordEncoder.encode(member.getMemberPassword());
		member.setMemberPassword(encodedPassword);
		
		memberService.updateInfo(member);
		
		//Authentication 정보 수정		
		Member dbMember = (Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		dbMember.setMemberProfile(member.getMemberProfile());
		dbMember.setMemberPassword(encodedPassword);
		dbMember.setMemberNickname(member.getMemberNickname());
		dbMember.setMemberPhone(member.getMemberPhone());
		dbMember.setMemberBirthDate(member.getMemberBirthDate());
		
		return new ModelAndView("redirect:/member/myInfo");
	}
	
	/**
	 * 회원 탈퇴하기
	 * */
	@RequestMapping("/deleteInfo")
	public String deleteInfo(Authentication auth) {		
		Object obj = auth.getPrincipal();
		Member member = null;
		
		if(obj instanceof Member) {
			member = (Member)auth.getPrincipal();
		}
		
		String memberEmail = member.getMemberEmail();
	
		if(memberService.deleteInfo(memberEmail) == 1)	return "redirect:/logout";
		else return "redirect:/member/myInfo";	
	} 
	
	/**
	 * 반려견 등록 폼
	 * */
	@RequestMapping("/addPetForm")
	public void addPetForm() {}
	
	/**
	 * 반려견 등록
	 * */
	@RequestMapping("/addPet")
	public String addPet(Pet pet, Long memberNo) {
		Member member = memberService.selectByMemberNo(memberNo);
		pet.setMember(member);

		memberService.addPet(pet);
		
		return "redirect:/member/myInfo";
	}

	/**
	 * 마이페이지 내 문의 이동
	 * */
	@RequestMapping("/myQna")
	public void myQna(Model model, Authentication auth) {
		Object obj = auth.getPrincipal();
		Member member = null;
		
		if(obj instanceof Member) {
			member = (Member)auth.getPrincipal();
		}
		
	 	Long memberNo = member.getMemberNo();		
		
		List<QnaBoard> qnaBoardList = memberService.myQna(memberNo);
		
		model.addAttribute("myQna", qnaBoardList);
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
	/*@RequestMapping("/delete/{boardNo}")
	public String delete(@PathVariable Long boardNo) {
		System.out.println("마이페이지컨트롤러 boardNo = " + boardNo);
		communityService.delete(boardNo);
		return "redirect:/member/myCommunity";
	}*/

   /**
    * 마이페이지 내 문의 삭제하기
    * */
   @RequestMapping("/qnaDelete/{qnaNo}")
   public String qnaDelete(@PathVariable Long qnaNo) {
      memberService.qnaDelete(qnaNo);
      
      return "redirect:/member/myQna";
   }
   
   /**
	 * 닉네임 중복 확인
	 * */
	@RequestMapping("/nicknameCheck")
	@ResponseBody
	public String nicknameCheck(HttpServletRequest request) {
		return memberService.nicknameCheck(request.getParameter("memberNickname"));
	}
}

