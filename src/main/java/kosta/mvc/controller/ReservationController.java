package kosta.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.mvc.domain.Residence;
import kosta.mvc.service.ResiService;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	@Autowired
	private ResiService resiService;

	@RequestMapping("/reservationForm")
	public void reservationForm(Long resiNo, Model model) {
		Residence residence = resiService.selectByResiNo(resiNo);
		model.addAttribute("resi", residence);
	}
	
	@RequestMapping("/insert")
	public String insert() {
		
		return "";
	}
	
	@RequestMapping("/test")
	public String test() {
		System.out.println("왔니?");
		return "왔니";
	}
}
