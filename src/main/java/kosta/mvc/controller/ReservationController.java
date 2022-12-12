package kosta.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kosta.mvc.domain.Camp;
import kosta.mvc.domain.Member;
import kosta.mvc.domain.Reservation;
import kosta.mvc.domain.Residence;
import kosta.mvc.domain.Temporary;
import kosta.mvc.service.ReservationService;
import kosta.mvc.service.ResiService;
import kosta.mvc.service.TemporaryService;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private TemporaryService temporaryService;
	
	@Autowired
	private ResiService resiService;

	@RequestMapping("/reservationForm")
	public void reservationForm(Long resiNo, int resiPeople, String checkIn, String checkOut, Model model) {
		Residence residence = resiService.selectByResiNo(resiNo);
		Long teNo = temporaryService.insert(new Temporary(null, checkIn, checkOut, residence));
		model.addAttribute("resi", residence);
		model.addAttribute("resiPeople", resiPeople);
		model.addAttribute("checkIn", checkIn);
		model.addAttribute("checkOut", checkOut);
		model.addAttribute("teNo", teNo);
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public String insert(
			Authentication auth,
			String reservName,
			String reservPhone,
			String reservType,
			String reservPrice,
			String reservState,
			String reservPeople,
			String reservCheckin,
			String reservCheckout,
			String reservTotalPet,
			String reservInsuranceTotal,
			Residence residence,
			Long teNo) {
		
		Object object = auth.getPrincipal();
		Member member = null;
		if(object instanceof Member) {
			member = (Member)auth.getPrincipal();
		}
		
		int price = Integer.parseInt(reservPrice);
		int state = Integer.parseInt(reservState);
		int people = Integer.parseInt(reservPeople);
		int totalPet = Integer.parseInt(reservTotalPet);
		int insuranceTotal = Integer.parseInt(reservInsuranceTotal);
		

		Reservation reser = new Reservation(null, reservName, reservPhone, null, reservType, price, state, people, reservCheckin, reservCheckout, totalPet, insuranceTotal, member, residence, null);
		Long memberNo = (long) 1;
		reser.setMember(new Member(memberNo));
		reservationService.insert(reser);
		temporaryService.delete(teNo);
		return "결제완료";
	}
	
	@ResponseBody
	@RequestMapping("/test")
	public String test(Long resiNo, String checkIn, String checkOut) {
		String message = "입장";
		Reservation re = reservationService.selectBy(resiNo, checkIn, checkOut);
		Temporary te = temporaryService.selectBy(resiNo, checkIn, checkOut);
		if(re != null || te != null) message = "불입장";
		return message;
	}
	
	@ResponseBody
	@RequestMapping("/deleteTe")
	public void deleteTem(Long teNo) {
		temporaryService.delete(teNo);
	}
}
