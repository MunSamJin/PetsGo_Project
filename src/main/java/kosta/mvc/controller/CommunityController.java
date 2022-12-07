package kosta.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.CommunityBoard;
import kosta.mvc.service.CommunityService;
import lombok.NonNull;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
	@Autowired
	private CommunityService communityService;
	
	private final static int PAGE_COUNT=10;

	/**
	 *  커뮤니티 전체 검색
	 */
	@RequestMapping("/list")
	public void list(Model model, @RequestParam(defaultValue = "1")int nowPage) {
		List<CommunityBoard> communityBoardList = communityService.selectAll();
		model.addAttribute("communityBoardList", communityBoardList);
		
	}
	
	
	/**
	 *  등록폼
	 */
	@RequestMapping("/write")
	public void write() {}
	
	
	/**
	 *  등록하기 : 글 + 파일 동시에 등록
	 */
	//@RequestMapping("/insert")
	//public String insert(CommunityBoard communityBoard, HttpSession session) {//1번째 시도 - 실패	
	public ModelAndView insert(CommunityBoard communityBoard, MultipartFile file, HttpSession session) { //2번째 시도 - 성공 (파일1개 업로드)
	//public String insert(CommunityBoard communityBoard, MultipartHttpServletRequest multiRequest, HttpSession session) { //3번째 시도 - 실패
		
		String saveDir = session.getServletContext().getRealPath("/img/samjin");
		
		/*1번째 시도
		 * String originalName = communityBoard.getBoardFile().getOriginalFilename();
		 * communityBoard.setBoardFileName(originalName);
		 * communityBoard.setFileSize(communityBoard.getBoardFile().getSize());
		 * 
		 * try{ communityBoard.getBoardFile().transferTo(new File(originalName)); }catch
		 * (Exception e) { e.printStackTrace(); }
		 * 
		 * communityService.insert(communityBoard);
		 */
		
		// 2번째 시도

		System.out.println("boardTag" + communityBoard.getBoardTag());

		String originalFileName = file.getOriginalFilename();

		// System.out.println("originalFileName = " + originalFileName);

		communityBoard.setBoardFileName(originalFileName);

		try {
			file.transferTo(new File(saveDir + "/" + originalFileName));

		} catch (Exception e) {
			e.printStackTrace();
		}

		//communityService.insert(communityBoard);

		ModelAndView mv = new ModelAndView();
		mv.addObject("saveDir", saveDir);
		mv.addObject("originalFileName", originalFileName);
		mv.addObject("fileSize", file.getSize());
		mv.setViewName("community/list");
		 
		 //System.out.println("mv = " + mv);
		
		//3번째시도
		/*
		 List<MultipartFile> fileList = multiRequest.getFiles("communityBoard");
		 
		 // 업로드한 파일이 없으면 실행되지 않음 
		 if (fileList != null) { // 파일이 저장될 경로 설정 
			 File dir = new File(saveDir); 
			 if (!dir.isDirectory()) { 
				 dir.mkdirs(); 
			}
		 
			 if (!fileList.isEmpty()) { // 넘어온 파일을 리스트로 저장 
				 for (int i = 0; i <fileList.size(); i++) { // 파일 중복명 처리 
					 String random = UUID.randomUUID().toString(); // 원래 파일명 
					 String originalfilename = fileList.get(i).getOriginalFilename(); // 저장되는 파일이름 
					 String saveFileName = random + "_" + originalfilename; // 저장될 파일 경로 
					 String savePath = saveDir + saveFileName; // 파일사이즈 
					 int fileSize = (int) fileList.get(i).getSize();
		 
					 communityBoard.setBoardFileName(originalfilename);
					 
					 // 파일 저장 
					 try { 
						 fileList.get(i).transferTo(new File(savePath)); 
					 } catch(IllegalStateException e) { 
						 e.printStackTrace(); 
					 } catch (IOException e) {
						 e.printStackTrace(); 
					 } 
				 } 
			} 
		}*/
		 
		
		//return "redirect:/community/list"; //1번째 시도
		return mv; //2번째 시도
		//return "redirect:/community/list"; //3번째 시도
	}
	
	
	@RequestMapping("/insert")
	// public String uploadMultipartFile(@RequestParam("files") MultipartFile[] files,
	// Model modal, HttpSession session) {//4번째 시도 - 실패
	public String insert(CommunityBoard communityBoard, @RequestParam("files") List<MultipartFile> files,
			HttpSession session) {//5번째 시도 - 성공 (다중 파일 업로드)
		// String saveDir2 =
		// session.getServletContext().getRealPath("WEB-INF/save/samjin");
		String saveDir2 = session.getServletContext().getRealPath("/img/samjin/");
		String imgNames = "";
		
		//System.out.println("memberNo = " + communityBoard.getMember().getMemberNo());
		
		//Long mno = communityBoard.getMember().getMemberNo();

		try {
			// Declare empty list for collect the files data
			// which will come from UI
			// List<CommunityFiles> fileList = new ArrayList<CommunityFiles>();
			System.out.println("개수 = " + files.size());
			
			
			

			// for (MultipartFile file : files) {
			for (int i = 0; i < files.size(); i++) {
				MultipartFile m = files.get(i);
				System.out.println("첨부파일이름 = " + m.getOriginalFilename());
				
				if (i == (files.size() - 1))
					imgNames += m.getOriginalFilename();
				else
					imgNames += m.getOriginalFilename() + ",";

				//////////////////////////////////////////////
				System.out.println("imgNames = " + imgNames);

				m.transferTo(new File(saveDir2 + "/" + m.getOriginalFilename()));
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		communityBoard.setBoardFileName(imgNames);
		
		communityService.insert(communityBoard);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("saveDir2", saveDir2);
		mv.addObject("originalFileName", imgNames);
		mv.addObject("fileSize", files.size());
		//mv.setViewName("community/list");
		
		//return mv;
		return "redirect:/community/list";
	}
	
	
	/**
	 *  상세보기
	 */
	@RequestMapping("/read/{boardNo}")
	public ModelAndView read(@PathVariable Long boardNo) {
		
		CommunityBoard communityBoard = communityService.selectBy(boardNo);
		
		return new ModelAndView("community/read", "communityBoard", communityBoard);
	}
	
	/**
	 *  수정폼
	 */
	@RequestMapping("/updateForm")
	public ModelAndView updateForm(Long boardNo) {
		CommunityBoard board = communityService.selectBy(boardNo);
		return new ModelAndView("community/updateForm", "board", board);
	}
	
	/**
	 *  수정완료하기
	 */
	@RequestMapping("/update")
	public ModelAndView update(CommunityBoard board, @RequestParam("files") List<MultipartFile> files,
			HttpSession session) {
		
		Long boardNo = board.getBoardNo();
		System.out.println("board.getboardNo" + board.getBoardNo());
		
		String saveDir3 = session.getServletContext().getRealPath("/img/samjin/");
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
			CommunityBoard board2 = communityService.selectBy(boardNo);
			String dbFileName = board2.getBoardFileName();
			board.setBoardFileName(dbFileName);
		}else {
			board.setBoardFileName(imgNames);
		}
		
		
		CommunityBoard dbBoard = communityService.update(board);
		
		return new ModelAndView("community/read", "communityBoard", dbBoard);
	}
	
	/**
	 *  삭제하기
	 */
	@RequestMapping("/delete")
	public String delete(Long boardNo) {
		communityService.delete(boardNo);
		return "redirect:/community/list";
	}
	
	
}
