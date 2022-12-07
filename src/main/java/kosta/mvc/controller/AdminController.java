package kosta.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping("{url}")
	public void url() {
		
	}
	
	@RequestMapping("/{main}/{pages}/{url}")
	public void url2() {
		
	}
	
	
	/*@RequestMapping("/reply") public void reply() {
	 
	}*/
	 
}
