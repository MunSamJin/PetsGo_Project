package kosta.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping("/")
	public void index() {}
	
	@RequestMapping("{url}")
	public void url() {}
	
	
	
	@RequestMapping("/test5")
	public String test5() {
		return "/index";
	}
	
	@RequestMapping("/samjinTest")
	public void samjinTest() {
	}
	
	
}
