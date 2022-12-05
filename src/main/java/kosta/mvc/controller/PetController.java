package kosta.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.Member;
import kosta.mvc.domain.Pet;
import kosta.mvc.service.PetService;

@Controller
@RequestMapping("/pet")
public class PetController {

	@Autowired
	private PetService petService;
	
	/**
	 * 반려견 등록 폼
	 * */
	/* @RequestMapping("addPetForm")
	public String addPetForm() {
		return "pet/addPetForm";
	} */
	
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

	/* 1차 수정 후 시도한 방식
	@RequestMapping("addPet")
	public String addPet(Pet pet, Long memberNo, Model model) {
		Member member = new Member(memberNo);
		pet.setMember(member);
		
		petService.addPet(pet);
		model.addAttribute("member",member);
		
		return "/member/myPet";
	} */
	
	
	
//////////////////////////////////

	/* 시도해보고 싶은 것!!!!!
	@RequestMapping("addPet")
	public ModelAndView addPet(Pet pet, Long memberNo) {
		Member member = new Member(memberNo);
		pet.setMember(member);
		System.out.println("pet controller에서 memberNo = " + memberNo);
		System.out.println("pet controller에서 member = " + member);
		System.out.println("pet controller에서 pet = " + pet);
		
		petService.addPet(pet);

		
		return new ModelAndView("/member/myPet", "pet", pet);
	} */
	 
	/* @RequestMapping("updateInfo")
	public ModelAndView updateInfo(Member member) {
		member = memberService.updateInfo(member);
		
		return new ModelAndView("member/myInfo", "member", member);
	} */
	
	@RequestMapping("{url}")
	public void url() {}
}
