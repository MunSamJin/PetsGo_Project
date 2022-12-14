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
import kosta.mvc.domain.CommunityBoard;
import kosta.mvc.domain.Residence;
import kosta.mvc.service.CampUserViewService;
import kosta.mvc.service.CommunityService;
import kosta.mvc.service.ResiService;

@Controller
@RequestMapping("/camp")
public class CampController {
	
	@Autowired
	private CampUserViewService campUserViewService;
	
	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private ResiService resiService;
	
	@RequestMapping("/selectAll")
	public String selectAll(int resiPeople, String campAddr, String checkIn, String checkOut, Model model) {
		List<Camp> campList = campUserViewService.selectAll(resiPeople, campAddr, checkIn, checkOut);
		System.out.println(campList);
		model.addAttribute("campList", campList);
		model.addAttribute("resiPeople", resiPeople);
		model.addAttribute("campAddr", campAddr);
		model.addAttribute("checkIn", checkIn);
		model.addAttribute("checkOut", checkOut);
		return "camp/list";
	}
	
	@RequestMapping("/select")
	@ResponseBody
	public List<Camp> select(int resiPeople, String campAddr, String checkIn, String checkOut, 
			String price1, String price2, String aa, String tag) {
		System.out.println("왔뉘?");
		int resiPrice1 = Integer.parseInt(price1);
		int resiPrice2 = Integer.parseInt(price2);
		List<Camp> campList = campUserViewService.select(resiPeople, campAddr, checkIn, checkOut, 
				resiPrice1, resiPrice2, aa, tag);
		System.out.println(campList);
		return campList;
	}
	
	@RequestMapping("/detail")
	public void detail(Long campNo, int resiPeople, String checkIn, String checkOut, Model model) {
		Camp camp = campUserViewService.selectByCampNo(campNo);
		List<CommunityBoard> boardList = communityService.selectByCampRe(camp.getCampName());
		model.addAttribute("camp", camp);
		model.addAttribute("resiPeople", resiPeople);
		model.addAttribute("checkIn", checkIn);
		model.addAttribute("checkOut", checkOut);
		model.addAttribute("boardList", boardList);
	}
	
	/**
	 * 숙소 상세 페이지 이미지 팝업창
	 */
	@RequestMapping("/resiDetail/{resiNo}")
	public String resiDetail(@PathVariable Long resiNo, Model model) {
		
		Residence resi = resiService.selectByResiNo(resiNo);
		model.addAttribute("resi", resi);
		
		return "camp/resiDetail";
	}
}
