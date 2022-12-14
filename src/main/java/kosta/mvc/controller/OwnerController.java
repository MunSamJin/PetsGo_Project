package kosta.mvc.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.Camp;
import kosta.mvc.domain.CommunityBoard;
import kosta.mvc.domain.Member;
import kosta.mvc.domain.QnaBoard;
import kosta.mvc.domain.Reservation;
import kosta.mvc.domain.Residence;
import kosta.mvc.service.CampService;
import kosta.mvc.service.CommunityService;
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
	
	@Autowired
	private CommunityService commService;
	
	@Autowired
	private PasswordEncoder passwordEncoder; 
	
	private final static int PAGE_COUNT = 10;
	private final static int BLOCK_COUNT = 3;
	
	
	@RequestMapping("/campHome")
	public void ownerIndex(Model model) {
	}
	
	
	/*@RequestMapping("/camp/campSelect/{campNo}")
	public String campSelect(@PathVariable("campNo") Long campNo , Model model) {
		Camp camp = campService.selectBy(campNo);
		model.addAttribute("camp",camp);
		
		System.out.println("camp filename = " + camp.getCampFilename());
		
		return "owner/camp/campSelect";
	}*/
	
	
	@RequestMapping("/camp/campSelect")
	public void campSelect() {
		System.out.println("campSelect");
	}
	
	
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
		campService.insert(camp);
		
		return "success";
	}
	
	
	
	/*@RequestMapping("/camp/campUpdateForm/{campNo}")
	public ModelAndView campUpdateForm(@PathVariable("campNo") Long campNo) {
		//FreeBoard board = campService.selectBy(bno, false); //조회수 증가 안 함
		Camp camp = campService.selectBy(campNo);
		return new ModelAndView("owner/camp/campUpdateForm","camp", camp);
	}*/
	
	@RequestMapping("/camp/campUpdateForm")
	public ModelAndView campUpdateForm() {
		return new ModelAndView("owner/camp/campUpdateForm");
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
					
					if(m.getSize() > 0) {
						
						System.out.println("첨부파일이름 = " + m.getOriginalFilename());
						
						if (i == (files.size() - 1))
							filenames += m.getOriginalFilename();
						else
							filenames += m.getOriginalFilename() + ",";
						
						System.out.println("update filenames = " + filenames);
						m.transferTo(new File(saveDir + "/" + m.getOriginalFilename()));
						camp.setCampFilename(filenames);
					}
				}
				
				System.out.println("filenames : " +filenames);
				if(filenames.equals("")) {
					Camp camp2 = campService.selectBy(camp.getCampNo());
					camp.setCampFilename(camp2.getCampFilename());
					System.out.println("없으면 dbFilenames " + camp.getCampFilename());
				}
				
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		/*if(filenames.equals("")) {
			Camp camp2 = campService.selectBy(camp.getCampNo());
			camp.setCampFilename(camp2.getCampFilename());
		} else {
			camp.setCampFilename(filenames);
		}*/
		
		campService.update(camp);
		System.out.println("업데이트 완료!!! camp="+camp);
		
		//Authentication정보 수정
		Camp updateCamp = (Camp)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		updateCamp.setCampAddr(camp.getCampAddr());
		updateCamp.setCampCheckin(camp.getCampCheckin());
		updateCamp.setCampCheckout(camp.getCampCheckout());
		updateCamp.setCampEmail(camp.getCampEmail());
		updateCamp.setCampFacility(camp.getCampFacility());
		updateCamp.setCampFilename(camp.getCampFilename());
		updateCamp.setCampIntro(camp.getCampIntro());
		updateCamp.setCampName(camp.getCampName());
		updateCamp.setCampNotify(camp.getCampNotify());
		updateCamp.setCampPassword(camp.getCampPassword());
		updateCamp.setCampPhone(camp.getCampPhone());
		updateCamp.setCampPost(camp.getCampPost());
		
		return "redirect:/owner/camp/campSelect";
		//return "redirect:/owner/camp/campSelect";
	}
	
	
	@RequestMapping("/camp/campDeleteForm") 
	public void campDeleteForm() {
		
	}
	
	
	@RequestMapping("/campStateUpdate/{campNo}/{campState}")
	public String campDeleteRequest(@PathVariable("campNo") Long campNo, @PathVariable("campState") int campState) {
		System.out.println("캠핑장 상태 변경!!!!!!!!!!!!");
		campService.campStateUpdate(campNo, campState);
		return "redirect:/owner/campHome";
	}
	
	
	@RequestMapping("/passwordCheck")
	@ResponseBody
	public String passwordCheck(String password, Long campNo, Authentication auth) {
		//auth는 내가 폼에 입력한 정보(여기선 pw)
		//String pwd = (String)auth.getCredentials();
		Camp camp = campService.selectBy(campNo);
		System.out.println("입력한 pwd:/" + password+"/");
		System.out.println("기존 pwd : " + camp.getCampPassword());
		System.out.println("auth pwd : " + camp.getCampPassword());
		
		if( !passwordEncoder.matches( password,camp.getCampPassword() )  ) {
			return "fail";
		} else 
			return "success";
	}
	
	
	
	@RequestMapping("/resi/resiSelect/{campNo}")
	public String resiSelect(@PathVariable("campNo") Long campNo , Model model) {		
		Camp camp = campService.selectBy(campNo);
		List<Residence> resiList = camp.getResidenceList();
		System.out.println("resiList =" + resiList);
		model.addAttribute("resiList", resiList);
		return "/owner/resi/resiSelect";
	}
	
	/*@RequestMapping("/resi/resiSelect")
	public void resiSelect() {
	}*/
	
	
	@RequestMapping("/resi/resiInsertForm")
	public String resiInsertForm() {
		
		return "owner/resi/resiInsertForm";
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
	
	
	@RequestMapping("/reserv/reservCheck/{campNo}")
	public String reservCheck(@PathVariable("campNo") Long campNo, Model model) {
		List<Reservation> reservList =  reservService.selectByCampNo(campNo);
		
		for(Reservation r : reservList) {
			Member member=r.getMember();
			r.setMember(member);
			System.out.println("reserv = " + r);
		}
		
		model.addAttribute("reservList",reservList);
		return "owner/reserv/reservCheck";
	}
	

	@RequestMapping("/reserv/reservCheckAjax/{campNo}")
	@ResponseBody
	public Map<String, Object> reservCheckAjax(@PathVariable("campNo") Long campNo, int reservState) {
		System.out.println("아작스");
		
		List<Reservation> reservList = null;
		if(reservState==5) {
			reservList = reservService.selectByCampNo(campNo);
		} else {
			reservList = reservService.selectByReservState(campNo, reservState);
		}
		
		//model.addAttribute("reservList",reservList);
		Map<String, Object> map = new HashMap<>();
		
		List<String> memberList = new ArrayList<String>();
		List<String> resiList = new ArrayList<String>();
		
		if(reservList.size() > 0) {
			for(Reservation r : reservList) {
				Member member = r.getMember();
				Residence resi = r.getResidence();
				memberList.add(member.getMemberNickname());
				resiList.add(resi.getResiName());
			}
		}
		
		System.out.println("memberList = "+memberList);
		
		map.put("reservList", reservList);
		map.put("memberList", memberList);
		map.put("resiList", resiList);
		
		return map;
	}
	
	
	@RequestMapping("/reserv/reservDetail/{reservNo}")
	public String reservDetail(@PathVariable("reservNo") Long reservNo, Model model) {
		Reservation reserv = reservService.selectByReservNo(reservNo);
		model.addAttribute("reserv",reserv);
		return "owner/reserv/reservDetail";
	}
	
	
	@RequestMapping("/reserv/reservStateUpdate")
	@ResponseBody
	public String reservStateUpdate(Long reservNo, int reservState) {
		reservService.updateState(reservNo, reservState);
		return "success";
	}
	
	
	@RequestMapping("/review/campReview/{campNo}")
	public String campReview(@PathVariable("campNo") Long campNo, Model model, @RequestParam(defaultValue = "1") int nowPage) {
		Pageable page = PageRequest.of((nowPage-1), PAGE_COUNT, Direction.DESC, "boardNo");
		Camp camp = campService.selectBy(campNo);
		Page<CommunityBoard> commList = commService.selectByCampTag(camp.getCampName(), page);
		
		int temp = (nowPage-1) % BLOCK_COUNT;
		int startPage = nowPage - temp;
		
		model.addAttribute("commList", commList);
		model.addAttribute("blockCount", BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("nowPage", nowPage);
		
		return "owner/review/campReview";
	}

	
	
	@RequestMapping("/reserv/reservChart")
	@ResponseBody
	public List<Residence> campChart(Long campNo) {
		Camp camp = campService.selectBy(campNo);
		return camp.getResidenceList();
	}
	
	
	
	@RequestMapping("/info/campInfo")
	public void campInfo() {
		
	}
	
	@RequestMapping("/info/campInfoUpdateForm")
	public void campInfoUpdateForm() {
		
	}
	
	@RequestMapping("/info/campInfoUpdate")
	public String campInfoUpdate(Camp camp) {
		Camp dbCamp = campService.selectBy(camp.getCampNo());
		
		dbCamp.setCampEmail(camp.getCampEmail());
		dbCamp.setCampPassword(camp.getCampPassword());
		dbCamp.setCampPhone(camp.getCampPhone());
		campService.update(dbCamp);
		
		//Authentication정보 수정
		Camp updateCamp = (Camp)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		updateCamp.setCampEmail(camp.getCampEmail());
		updateCamp.setCampPassword(camp.getCampPassword());
		updateCamp.setCampPhone(camp.getCampPhone());
		
		return "/owner/info/campInfo";
	}
}
