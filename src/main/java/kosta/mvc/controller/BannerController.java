package kosta.mvc.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.BannerBoard;
import kosta.mvc.domain.CommunityBoard;
import kosta.mvc.service.BannerService;

@Controller
@RequestMapping("/banner")
public class BannerController {
	
	@Autowired
	private BannerService bannerService;
	
	/**
	 * 배너등록폼
	 */
	@RequestMapping("/banner_submit")
	public void submit() {}
	
	/**
	 * 등록하기 : 배너정보 + 배너이미지파일 등록
	 */
	public ModelAndView insert(BannerBoard bannerBoard, MultipartFile file, HttpSession session) {
		
		String saveDir = session.getServletContext().getRealPath("/img/bannerTest");
		
		String originalFileName = file.getOriginalFilename();
		
		/* bannerBoard.setBoardFileName(originalFileName); */
		
		try {
			file.transferTo(new File(saveDir + "/" + originalFileName));
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("saveDir", saveDir);
		mv.addObject("originalFileName", originalFileName);
		mv.addObject("fileSize", file.getSize());
		mv.setViewName("/admin/pages/banner/banner_list");
		
		return mv;
	}
	
	@RequestMapping("/insert")
	public String insert(BannerBoard bannerBoard, @RequestParam("files") List<MultipartFile> files,
			HttpSession session) {
		
		String saveDir2 = session.getServletContext().getRealPath("img/banner_test/");
		String imgNames = "";
		
		try {
			System.out.println("개수 = " + files.size());
			
			for (int i = 0; i < files.size(); i++) {
				MultipartFile m = files.get(i);
				System.out.println("첨부파일이름 = " + m.getOriginalFilename());
				
				if(i == (files.size() - 1))
					imgNames += m.getOriginalFilename();
				else
					imgNames += m.getOriginalFilename() + ",";
				
				System.out.println("imgNames = " + imgNames);
				
				m.transferTo(new File(saveDir2 + "/" + m.getOriginalFilename()));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		//BannerBoard.setBannerFileName(imgNames);
		
		bannerService.insert(bannerBoard);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("saveDir2", saveDir2);
		mv.addObject("originalFileName", imgNames);
		mv.addObject("fileSize", files.size());
		
		return "redirect:/admin/pages/banner/banner_list";
	}
	
	/**
	 * 등록 상세
	 */
	@RequestMapping("/banner_read/{boardNo}")
	public ModelAndView read(@PathVariable Long boardNo) {
		
		BannerBoard bannerBoard = bannerService.selectBy(boardNo);
		
		return new ModelAndView("banner/banner_read", "bannerBoard", bannerBoard );
	}
	
	/**
	 * 수정폼
	 */
	@RequestMapping("/banner_updateForm")
	public ModelAndView updateForm(Long boardNo) {
		BannerBoard board = bannerService.selectBy(boardNo);
		return new ModelAndView("banner/banner_updateForm", "board", board);
	}
	
	/**
	 *  수정완료하기
	 */
	@RequestMapping("/update")
	public ModelAndView update(BannerBoard board, @RequestParam("files") List<MultipartFile> files,
			HttpSession session) {
		
		Long boardNo = board.getBannerNo();
		System.out.println("board.getboardNo" + board.getBannerNo());
		
		String saveDir3 = session.getServletContext().getRealPath("/img/banner/");
		String imgNames = "";
		
		try {
			for (int i = 0; i < files.size(); i++) {
				MultipartFile m = files.get(i);
				System.out.println("첨부파일이름 = " + m.getOriginalFilename());
				
				if (i == (files.size() - 1))
					imgNames += m.getOriginalFilename();
				else
					imgNames += m.getOriginalFilename() + ",";
					
				System.out.println("imgNames = " + imgNames);
				m.transferTo(new File(saveDir3 + "/" + m.getOriginalFilename()));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		//수정할 때 사진파일을 첨부하지 않는다면!
		System.out.println("imgNames = " + imgNames );
		
		if(imgNames == null || imgNames.equals("") ) {
			BannerBoard board2 = bannerService.selectBy(boardNo);
			String dbFileName = board2.getBannerFileName();
			board.setBannerFileName(dbFileName);
		}else {
			board.setBannerFileName(imgNames);
		}
		
		
		BannerBoard dbBoard = bannerService.update(board);
		
		return new ModelAndView("banner/banner_read", "bannerBoard", dbBoard);
	}
	
	/**
	 *  삭제하기
	 */
	@RequestMapping("/delete")
	public String delete(Long boardNo) {
		bannerService.delete(boardNo);
		return "redirect:/banner/list";
	}

}
