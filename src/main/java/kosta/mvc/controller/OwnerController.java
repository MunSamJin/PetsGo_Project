package kosta.mvc.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
	
	
	/*
	 * @RequestMapping("/campUpdate") public String campUpdate(Camp camp) { 
	 * 	Camp dbCamp = campService.update(camp); 
	 * 	return "redirect:/owner/campSelect"; }
	 */
	
	
	@RequestMapping("/campInsert")
	public ModelAndView campInsert(Camp camp) {
		campService.insert(camp);
		
		return new ModelAndView("관리자 승인페이지");
	}
	
	
	@RequestMapping("/campUpdate")
	//@ResponseBody
	public String campUpdate(Camp camp, HttpSession session, @RequestParam("files") List<MultipartFile> files) {
		
		String saveDir = session.getServletContext().getRealPath("/img/seryun/");
		String filenames = "";
		
		//upload.setFileName(originalFileName);
		//upload.setFileSize(upload.getFile().getSize());
		
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
		
		if(filenames.equals("")) {
			Camp camp2 = campService.selectAll();
			camp.setCampFilename(camp2.getCampFilename());
		} else {
			camp.setCampFilename(filenames);
		}
		
		
		campService.update(camp);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("saveDir", saveDir);
		mv.addObject("originalFileName", filenames);
		mv.addObject("fileSize", files.size());
		mv.setViewName("owner/campSelect");
		
		return "redirect:/owner/campSelect";
	}
	
	
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
