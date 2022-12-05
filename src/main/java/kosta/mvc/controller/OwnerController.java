package kosta.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.Camp;
import kosta.mvc.domain.Residence;
import kosta.mvc.service.CampService;
import kosta.mvc.service.ResiService;

@Controller
@RequestMapping("/owner")
public class OwnerController {
	
	@Autowired
	private CampService campService;
	
	@Autowired
	private ResiService resiService;
	
	
	@RequestMapping("/campHome")
	public void ownerIndex(Model model) {
	}
	
	@RequestMapping("/campSelect")
	public void campSelect(Model model) {
		Camp camp = campService.selectAll();
		model.addAttribute("camp",camp);
	}
	
	
	@RequestMapping("/campUpdateForm")
	public ModelAndView campUpdateForm() {
		//FreeBoard board = campService.selectBy(bno, false); //조회수 증가 안 함
		Camp camp = campService.selectAll();
		return new ModelAndView("owner/campUpdate","camp", camp);
	}
	
	
	@RequestMapping("/campUpdate")
	public String campUpdate(Camp camp) {
		Camp dbCamp = campService.update(camp);
		return "redirect:/owner/campSelect";
	}
	
	
	/*@RequestMapping("/upload")
	//@ResponseBody
	public String upload( HttpSession session, @RequestParam("files") List<MultipartFile> files) {
		
		String saveDir = session.getServletContext().getRealPath("/WEB-INF/save/seryun");
		//String originalFileName = upload.getFile().getOriginalFilename();
		String filenames = "";
		
		//upload.setFileName(originalFileName);
		//upload.setFileSize(upload.getFile().getSize());
		
		try {
			upload.getFile().transferTo(new File(saveDir + "/" + originalFileName));
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return "";
	}*/
	
	
	@RequestMapping("/delete")
	public String campDelete() {
		
		return "";
	}
	
	
	
	
	@RequestMapping("/resiSelect")
	public void resiSelect(Model model) {
		List<Residence> resiList = resiService.selectAll();
		model.addAttribute("resiList", resiList);
	}
	
	
	@RequestMapping("/{url}")
	public void test() {}
}
