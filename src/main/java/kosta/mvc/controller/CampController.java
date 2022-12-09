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
	public String selectAll(Model model) {
		 List<Camp> campList = campUserViewService.selectAll();
		 model.addAttribute("campList", campList);
		return "/camp/list";
	}
	
	@RequestMapping("/select")
	@ResponseBody
	public List<Camp> select(String price1, String price2, String aa) {
		int resiPrice1 = Integer.parseInt(price1);
		int resiPrice2 = Integer.parseInt(price2);
		List<Camp> campList = campUserViewService.selectAll(resiPrice1, resiPrice2, aa);
		return campList;
	}
	
	@RequestMapping("/detail")
	public void detail(Long campNo, Model model) {
		Camp camp = campUserViewService.selectByCampNo(campNo);
		model.addAttribute("camp", camp);
	}
}
