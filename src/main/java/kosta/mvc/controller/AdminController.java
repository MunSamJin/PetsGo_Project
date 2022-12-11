package kosta.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.Camp;
import kosta.mvc.service.CampService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private CampService campService;
	

	@RequestMapping("{url}")
	public void url() {
		
	}
	
	@RequestMapping("/{main}/{pages}/{url}")
	public void url2() {
		
	}
	
	
	/**
	 * 캠핑장 전체 검색
	 */
	@RequestMapping("/pages/camp/campcheck")
	public String campCheckAll(Model model) {
		List<Camp> campList = campService.selectAll();
		System.out.println("campList="+campList);
		model.addAttribute("campList",campList);
		return "/admin/pages/camp/campcheck";
	}
	
	
	/**
	 * 캠핑장 상태 확인
	 */
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
		Camp camp = campService.campStateUpdate(campNo, campState);
		
		return camp;
	}
	
}
