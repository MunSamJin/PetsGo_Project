package kosta.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.Camp;
import kosta.mvc.service.CampUserViewService;

@Controller
@RequestMapping("/camp")
public class CampController {
	
	@Autowired
	private CampUserViewService campUserViewService;
	
	@RequestMapping("/select")
	public ModelAndView selectAll() {
		 List<Camp> campList = campUserViewService.selectAll();
		return new ModelAndView("/camp/list", "campList", campList);
	}
	
	@RequestMapping("/detail")
	public void detail(Long campNo, Model model) {
		Camp camp = campUserViewService.selectByCampNo(campNo);
		model.addAttribute("camp", camp);
	}
}
