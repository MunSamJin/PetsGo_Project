package kosta.mvc.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.Camp;
import kosta.mvc.domain.Member;
import kosta.mvc.domain.QnaBoard;
import kosta.mvc.domain.Residence;
import kosta.mvc.mail.CampStateMail;
import kosta.mvc.service.CampService;
import kosta.mvc.service.MemberService;
import kosta.mvc.service.QnaService;


@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private CampService campService;
	
	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CampStateMail campStateMail;
	
	private final static int PAGE_COUNT = 10;
	private final static int BLOCK_COUNT = 3;

	//@RequestMapping("{url}")
	//public void url() {}
	
	@RequestMapping("/{main}/{pages}/{url}")
	public void url2() {}
	
	@RequestMapping("/main")
	public void main() {}
	
	/**
	 * 로그인 폼
	 * */
	@RequestMapping("/login")
	public void login() {}
	
	/**
	 * 전체 문의 답변 페이지
	 * */
	@RequestMapping("/pages/qna/qna_list")
	public void qnaList(Model model, @RequestParam(defaultValue = "1") int nowPage) {
		Pageable page = PageRequest.of((nowPage-1), PAGE_COUNT, Direction.DESC, "qnaNo");
		Page<QnaBoard> pageList = qnaService.selectAll(page);
		
		int temp = (nowPage-1) % BLOCK_COUNT;
		int startPage = nowPage - temp;
		
		model.addAttribute("pageList", pageList);
		model.addAttribute("blockCount", BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("nowPage", nowPage);
	}
	
	/**
	 * 문의 답변 등록하기
	 * */
	@RequestMapping("/pages/qna/replyInsert")
	public ModelAndView replyInsert(QnaBoard qna) {
		QnaBoard dbQna = qnaService.replyInsert(qna);

		return new ModelAndView("redirect:/admin/pages/qna/qna_list");
	}
	
	/**
	 * 문의 답변 삭제하기
	 * */
	@RequestMapping("/pages/qna/replyDelete")
	public ModelAndView replyDelete(QnaBoard qna) {		
		QnaBoard dbQna = qnaService.replyDelete(qna);
		
		return new ModelAndView("redirect:/admin/pages/qna/qna_list");
	}

	/**
	 * 캠핑장 전체 검색
	 */
	@RequestMapping("/pages/camp/campcheck")
	public void campCheckAll(Model model) {
		List<Camp> campList = campService.selectAll();
		System.out.println("campList="+campList);
		model.addAttribute("campList",campList);
	}
	
	
	/**
	 * 캠핑장 상태 확인
	 */
	/*@RequestMapping("/camp/campcheck")
	@ResponseBody
	public List<Camp> campCheck(int campState) {
		System.out.println("캠핑장 상태 확인 campState = "+campState);
		
		List<Camp> campList;
		if(campState==4) {
			campList = campService.selectAll();
		} else {
			campList = campService.select(campState);
		}
		
		//camp안에있는 다른객체 속성을 뷰로 전달해야 한다면...
		
		return campList;
	}*/
	
	@RequestMapping("/camp/campcheck")
	@ResponseBody
	public List<Camp> campCheck(int campState) {
		System.out.println("캠핑장 상태 확인 campState = "+campState);
		
		List<Camp> campList;
		if(campState==4) {
			campList = campService.selectAll();
		} else {
			campList = campService.select(campState);
		}
		
		//camp안에있는 다른객체 속성을 뷰로 전달해야 한다면...
		System.out.println("campList = " + campList);
		/*Map<String, Object> map = new HashMap<>();
		map.put("campList", campList);
		
		List<List<Residence>> residenceList = new ArrayList<List<Residence>>();
		for(Camp camp : campList) {
			System.out.println("camp.getResidenceList() = " + camp.getResidenceList());
			residenceList.add( camp.getResidenceList()) ;
		}
		map.put("residenceList", residenceList);*/
		
		return campList;
	}
	
	
	/**
	 * 캠핑장 정보 조회
	 */
	@RequestMapping("/camp/campcheckPage/{campNo}")
	public String campCheckPage(@PathVariable("campNo") Long campNo, Model model) {
		Camp camp = campService.selectBy(campNo);
		model.addAttribute("camp", camp);
		return "/admin/pages/camp/campcheckPage";
	}
	
	
	/**
	 * 캠핑장 상태 변경
	 */
	@RequestMapping("/camp/campStateUpdate")
	@ResponseBody
	public Camp campStateUpdate(Long campNo, int campState) {
		
		String campEmail = "";
		
		if(campState==5) {
			//campNo에 해당하는 camp를 찾아
			Camp camp = campService.selectBy(campNo);
			
			//camp의 이메일을 꺼내자
			campEmail = camp.getCampEmail();
		}
		Camp camp = campService.campStateUpdate(campNo, campState);
		
		//메일을 보내자
		//campStateMail.mailSend(camp, campEmail);
		
		return camp;
	}
	
	/**
	 * 회원관리
	 */
	@RequestMapping("/pages/user/user_list")
	public void userList(Model model) {
		List<Member> memberList = memberService.selectMemberAll();
		model.addAttribute("memberList", memberList);
	}
	
}
