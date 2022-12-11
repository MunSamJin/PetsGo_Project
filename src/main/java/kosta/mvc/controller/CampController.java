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
import kosta.mvc.service.CampUserViewService;

@Controller
@RequestMapping("/camp")
public class CampController {
	
	@Autowired
	private CampUserViewService campUserViewService;
	
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
	public List<Camp> select(int resiPeople, String campAddr, String checkIn, String checkOut, String price1, String price2, String aa) {
		System.out.println("왔뉘?");
		int resiPrice1 = Integer.parseInt(price1);
		int resiPrice2 = Integer.parseInt(price2);
		List<Camp> campList = campUserViewService.select(resiPeople, campAddr, checkIn, checkOut, resiPrice1, resiPrice2, aa);
		System.out.println(campList);
		return campList;
	}
	
	@RequestMapping("/detail")
	public void detail(Long campNo, Model model) {
		Camp camp = campUserViewService.selectByCampNo(campNo);
		model.addAttribute("camp", camp);
	}
	
	@RequestMapping("/list")
	public void detail(Model model) {
		List<Camp> campList = campUserViewService.findAll();
		model.addAttribute("campList", campList);
		model.addAttribute("resiPeople", 0);
		model.addAttribute("campAddr", 0);
		model.addAttribute("checkIn", 0);
		model.addAttribute("checkOut", 0);
	}
	
	
}
