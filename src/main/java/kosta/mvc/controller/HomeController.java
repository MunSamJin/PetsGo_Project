package kosta.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping("/index")
	public void index() {}
	
	@RequestMapping("/test1")
	public String test1() {
		return "/index";
	}
	
	@RequestMapping("/test2")
	public String test2() {
		return "/index";
	}
	
	@RequestMapping("/test3")
	public String test3() {
		return "/index";
	}
	
	@RequestMapping("/test4")
	public String test4() {
		return "/index";
	}
	
	@RequestMapping("/test5")
	public String test5() {
		return "/index";
	}
	
	@RequestMapping("/test6")
	public String test6() {
		return "/index";
	}
	
	@RequestMapping("/test7")
	public String test7() {
		return "/index";
	}

}
