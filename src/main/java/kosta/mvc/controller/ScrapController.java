package kosta.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kosta.mvc.domain.Camp;
import kosta.mvc.domain.Member;
import kosta.mvc.service.ScrapService;

@Controller
@RequestMapping("/scrap")
public class ScrapController {

	@Autowired
	private ScrapService scrapService;
	
	@RequestMapping("/scrap")
	@ResponseBody
	public String scrap(Member memver, Camp camp) {
		String message = scrapService.scrap(memver, camp);
		return message;
	}
}
