package kosta.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/owner")
public class OwnerController {
	
	@RequestMapping("/campHome")
	public void ownerIndex() {
		
	}
	
	@RequestMapping("/{url}")
	public void test() {}
}
