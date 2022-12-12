package kosta.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.mvc.domain.QnaBoard;
import kosta.mvc.service.QnaService;

@Controller
public class QnaController {
	
	@Autowired
	private QnaService qnaService;

	/**
	 * 반려견 등록
	 * */
	/* 원래 시도했던 방식
	@RequestMapping("/addPet")
	public String addPet(Pet pet, Long memberNo) {
		Member member = new Member(memberNo);
		pet.setMember(member);
		
		petService.addPet(pet);
		
		return "redirect:/member/myPet";
	} */
	
	/**
	 * 문의 등록
	 * */
	/* @RequestMapping("/qnaInsert")
	public String qnaInsert(QnaBoard qnaBoard) {
		
		return null;
	} */
}
