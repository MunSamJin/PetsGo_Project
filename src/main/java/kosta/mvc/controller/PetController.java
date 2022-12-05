package kosta.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.mvc.domain.Member;
import kosta.mvc.domain.Pet;
import kosta.mvc.service.PetService;

@Controller
public class PetController {

	@Autowired
	private PetService petService;
	
	/**
	 * 반려견 등록 폼
	 * */
	@RequestMapping("addPetForm")
	public String addPetForm() {
		return "pet/addPetForm";
	}
	
	/**
	 * 반려견 등록
	 * */
	@RequestMapping("addPet")
	public String addPet(Pet pet, Long memberNo, Model model) {
		Member member = new Member(memberNo);
		pet.setMember(member);
		
		petService.addPet(pet);
		model.addAttribute("member",member);
		
		return "/member/myPet";
	}
}
