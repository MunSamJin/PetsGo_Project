package kosta.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kosta.mvc.domain.Camp;
import kosta.mvc.domain.Member;
import kosta.mvc.domain.Reservation;
import kosta.mvc.domain.Residence;
import kosta.mvc.service.ReservationService;
import kosta.mvc.service.ResiService;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private ResiService resiService;

	@RequestMapping("/reservationForm")
	public void reservationForm(Long resiNo, Model model) {
		Residence residence = resiService.selectByResiNo(resiNo);
		model.addAttribute("resi", residence);
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public String insert(String reservName,
			String reservPhone,
			String reservType,
			String reservPrice,
			String reservState,
			String reservPeople,
			String reservCheckin,
			String reservCheckout,
			String reservTotalPet,
			String reservInsuranceTotal,
			Member member,
			Camp camp,
			Residence residence) {
		
		int price = Integer.parseInt(reservPrice);
		int state = Integer.parseInt(reservState);
		int people = Integer.parseInt(reservPeople);
		int totalPet = Integer.parseInt(reservTotalPet);
		int insuranceTotal = Integer.parseInt(reservInsuranceTotal);
		
		Reservation reser = new Reservation(null, reservName, reservPhone, null, reservType, price, state, people, reservCheckin, reservCheckout, totalPet, insuranceTotal, member, camp, residence);
		Long memberNo = (long) 1;
		reser.setMember(new Member(memberNo));
		reservationService.insert(reser);
		return "결제완료";
	}
	
	@RequestMapping("/test")
	public String test() {
		System.out.println("왔니?");
		return "왔니";
	}
}
