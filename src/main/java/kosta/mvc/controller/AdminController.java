package kosta.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kosta.mvc.domain.QnaBoard;
import kosta.mvc.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
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
		Page<QnaBoard> pageList = adminService.selectAll(page);
		
		int temp = (nowPage-1) % BLOCK_COUNT;
		int startPage = nowPage - temp;
		
		model.addAttribute("pageList", pageList);
		model.addAttribute("blockCount", BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("nowPage", nowPage);
	}
	
	
	/*@RequestMapping("/reply") public void reply() {
	 
	}*/
	 
}






























