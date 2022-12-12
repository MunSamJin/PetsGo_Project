package kosta.mvc.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.Camp;
import kosta.mvc.domain.Reservation;
import kosta.mvc.domain.Residence;
import kosta.mvc.service.CampService;
import kosta.mvc.service.ReservationService;
import kosta.mvc.service.ResiService;

@Controller
@RequestMapping("/owner")
public class OwnerController {
	
	@Autowired
	private CampService campService;
	
	@Autowired
	private ResiService resiService;
	
	@Autowired
	private ReservationService reservService;
	
	
	@RequestMapping("/campHome")
	public void ownerIndex(Model model) {
	}
	
	@RequestMapping("/camp/campSelect/{campNo}")
	public String campSelect(@PathVariable("campNo") Long campNo , Model model) {
		Camp camp = campService.selectBy(campNo);
		model.addAttribute("camp",camp);
		
		System.out.println("camp filename = " + camp.getCampFilename());
		
		return "owner/camp/campSelect";
	}
	
	
	/*@RequestMapping("/camp/campSelect")
	public void campSelect() {
	}*/
	
	
	@RequestMapping("/campInsert/campRegNoCheck")
	@ResponseBody
	public String campRegNoCheck(String campRegNo) {
		Camp camp = campService.selectBy(campRegNo);
		if(camp==null) return "success";
		else return "fail";
	}
	
	
	@RequestMapping("/campInsert/campInsertForm")
	public String campInsertForm() {
		return "owner/camp/campInsertForm";
	}
	
	
	@RequestMapping("/campInsert")
	@ResponseBody
	public String campInsert(Camp camp, HttpSession session, @RequestParam("files") List<MultipartFile> files) {
		
		String saveDir = session.getServletContext().getRealPath("/img/seryun/");
		String filenames = "";
		
		try {
			//upload.getFile().transferTo(new File(saveDir + "/" + originalFileName));
			
			for (int i = 0; i < files.size(); i++) {
				MultipartFile m = files.get(i);
				System.out.println("첨부파일이름 = " + m.getOriginalFilename());
				
				if (i == (files.size() - 1))
					filenames += m.getOriginalFilename();
				else
					filenames += m.getOriginalFilename() + ",";
				
				System.out.println("filenames = " + filenames);
				m.transferTo(new File(saveDir + "/" + m.getOriginalFilename()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		camp.setCampFilename(filenames);
		//String text = camp.getCampIntro().replace("\r\n","<br>");
		//camp.setCampIntro(text);
		
		campService.insert(camp);
		
		return "success";
	}
	
	
	
	@RequestMapping("/camp/campUpdateForm/{campNo}")
	public ModelAndView campUpdateForm(@PathVariable("campNo") Long campNo) {
		//FreeBoard board = campService.selectBy(bno, false); //조회수 증가 안 함
		Camp camp = campService.selectBy(campNo);
		return new ModelAndView("owner/camp/campUpdateForm","camp", camp);
	}
	
	
	/*
	 * @RequestMapping("/campUpdate") public String campUpdate(Camp camp) { 
	 * 	Camp dbCamp = campService.update(camp); 
	 * 	return "redirect:/owner/campSelect"; }
	 */
	
	
	@RequestMapping("/campUpdate")
	//@ResponseBody
	public String campUpdate(Camp camp, HttpSession session, @RequestParam("files") List<MultipartFile> files) {
		
		String saveDir = session.getServletContext().getRealPath("/img/seryun/");
		String filenames = "";
		
		try {
			
			for (int i = 0; i < files.size(); i++) {
				MultipartFile m = files.get(i);
				System.out.println("첨부파일이름 = " + m.getOriginalFilename());
				
				if (i == (files.size() - 1))
					filenames += m.getOriginalFilename();
				else
					filenames += m.getOriginalFilename() + ",";
				
				System.out.println("update filenames = " + filenames);
				m.transferTo(new File(saveDir + "/" + m.getOriginalFilename()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		if(filenames.equals("")) {
			Camp camp2 = campService.selectBy(camp.getCampNo());
			camp.setCampFilename(camp2.getCampFilename());
		} else {
			camp.setCampFilename(filenames);
		}
		
		//String text = camp.getCampIntro().replace("\r\n","<br>");
		//camp.setCampIntro(text);
		
		campService.update(camp);
		
		System.out.println("업데이트 완료!!! camp="+camp);
		
		//Authentication정보 수정
		/*Camp c=(Camp)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		c.setCampAddr(filenames)*/
		
		
		return "redirect:/owner/camp/campSelect/"+camp.getCampNo() ;
		//return "redirect:/owner/camp/campSelect";
	}
	
	
	@RequestMapping("/camp/campDeleteForm/{campNo}") 
	public String campDeleteForm(@PathVariable Long campNo) {
		return "/owner/camp/campDeleteForm";
	}
	
	
	@RequestMapping("/campStateUpdate/{campNo}/{campState}")
	public String campDeleteRequest(@PathVariable("campNo") Long campNo, @PathVariable("campState") int campState) {
		System.out.println("캠핑장 상태 변경!!!!!!!!!!!!");
		campService.campStateUpdate(campNo, campState);
		return "redirect:/owner/campHome";
	}
	
	
	@RequestMapping("/passwordCheck")
	@ResponseBody
	public String passwordCheck(String password, Long campNo) {
		Camp camp = campService.selectBy(campNo);
		String pwd = camp.getCampPassword();
		
		if(pwd.equals(password)) return "success";
		else return "fail";
	}
	
	
	
	@RequestMapping("/resi/resiSelect/{campNo}")
	public String resiSelect(@PathVariable("campNo") Long campNo , Model model) {
		/*List<Residence> resiList = resiService. selectAll(campNo);
		model.addAttribute("resiList", resiList);*/
		
		Camp camp = campService.selectBy(campNo);
		List<Residence> resiList = camp.getResidenceList();
		model.addAttribute("resiList", resiList);
		return "/owner/resi/resiSelect";
	}
	
	
	@RequestMapping("/resiInsert")
	public String risiInsert(Residence resi, String resiCount, HttpSession session, @RequestParam("files") List<MultipartFile> files) {
		
		String saveDir = session.getServletContext().getRealPath("/img/seryun/");
		String filenames = "";
		
		try {
			for (int i = 0; i < files.size(); i++) {
				MultipartFile m = files.get(i);
				System.out.println("첨부파일이름 = " + m.getOriginalFilename());
				
				if (i == (files.size() - 1))
					filenames += m.getOriginalFilename();
				else
					filenames += m.getOriginalFilename() + ",";
				
				System.out.println("filenames = " + filenames);
				m.transferTo(new File(saveDir + "/" + m.getOriginalFilename()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		resi.setResiFilename(filenames);
		
		System.out.println("resiCount = "+resiCount);
		resiService.insert(resi, resiCount);
		
		System.out.println(resi.getCamp().getCampNo());
		
		return "redirect:/owner/resi/resiSelect/"+resi.getCamp().getCampNo();
	}
	
	
	@RequestMapping("/resi/resiDetail/{resiNo}")
	public String resiDetail(@PathVariable("resiNo") Long resiNo, Model model) {
		Residence resi = resiService.selectByResiNo(resiNo);
		model.addAttribute("resi", resi);
		return "owner/resi/resiDetail";
	}
	
	@RequestMapping("/resi/resiUpdateForm/{resiNo}")
	public String resiUpdateForm(@PathVariable("resiNo") Long resiNo, Model model) {
		Residence resi = resiService.selectByResiNo(resiNo);
		model.addAttribute("resi", resi);
		return "owner/resi/resiUpdateForm";
	}
	
	
	@RequestMapping("/resiUpdate")
	public String resiUpdate(Residence resi, HttpSession session, @RequestParam("files") List<MultipartFile> files) {
		
		String saveDir = session.getServletContext().getRealPath("/img/seryun/");
		String filenames = "";
		
		try {
			
			for (int i = 0; i < files.size(); i++) {
				MultipartFile m = files.get(i);
				System.out.println("첨부파일이름 = " + m.getOriginalFilename());
				
				if (i == (files.size() - 1))
					filenames += m.getOriginalFilename();
				else
					filenames += m.getOriginalFilename() + ",";
				
				System.out.println("filenames = " + filenames);
				m.transferTo(new File(saveDir + "/" + m.getOriginalFilename()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		if(filenames.equals("")) {
			Residence resi2 = resiService.selectByResiNo(resi.getResiNo());
			resi.setResiFilename(resi2.getResiFilename());
		} else {
			resi.setResiFilename(filenames);
		}
		
		resiService.update(resi);
		
		//return new ModelAndView("owner/resi/resiDetail","resi",resi) ;
		return "redirect:/owner/resi/resiDetail/"+resi.getResiNo();
	}
	

	@RequestMapping("/reserv/reservManagement/{campNo}")
	public String reservManagement(@PathVariable("campNo") Long campNo, Model model) {
		System.out.println("컨트롤러진입");
		List<Reservation> reservList = reservService.selectByCampNo(campNo);
		model.addAttribute("reservList",reservList);
		return "owner/reserv/reservManagement";
	}
	
	
	/*@RequestMapping("/{url}")
	public void url1() {}
	
	@RequestMapping("/{url}/{url2}")
	public void url2(Model model) {
		Long campNo = (long) 2;
		List<Reservation> reservList = reservService.selectByCampNo(campNo);
		model.addAttribute("reservList",reservList);
	}*/
}
