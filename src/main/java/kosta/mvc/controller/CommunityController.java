package kosta.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community")
public class CommunityController {

	/**
	 *  커뮤니티 전체 검색
	 */
	@RequestMapping("/list")
	public void list() {}
	
	/**
	 *  등록폼
	 */
	@RequestMapping("/write")
	public void write() {}
	
	/**
	 *  등록하기
	 */
}
