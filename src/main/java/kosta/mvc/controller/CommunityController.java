package kosta.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.mail.Session;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.CommunityBoard;
import kosta.mvc.domain.LikeBoard;
import kosta.mvc.domain.Member;
import kosta.mvc.service.CommunityService;
import lombok.NonNull;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
	@Autowired
	private CommunityService communityService;
	
	private final static int PAGE_COUNT=10;

	
	
	
	/**
	 *  등록폼
	 */
	@RequestMapping("/write")
	public void write() {
		System.out.println("컨트롤러 등록폼 들어왔니??");
	}
	
	
	/**
	 *  등록하기 : 글 + 파일 동시에 등록
	 */
	@RequestMapping("/insert")
	public String insert(CommunityBoard communityBoard, @RequestParam("files") List<MultipartFile> files, 
			HttpSession session, Authentication auth) {
		System.out.println("컨트롤러 등록하러 왔니?");
		
		String saveDir2 = session.getServletContext().getRealPath("/img/samjin/");
		String imgNames = "";
		
		Object object = auth.getPrincipal();
		Member member = null;
		if(object instanceof Member) {
			member = (Member)auth.getPrincipal();
		}
		
		
		try {
			
			System.out.println("개수 = " + files.size());
			
			// for (MultipartFile file : files) {
			for (int i = 0; i < files.size(); i++) {
				MultipartFile m = files.get(i);
				//System.out.println("첨부파일이름 = " + m.getOriginalFilename());
				
				if (i == (files.size() - 1))
					imgNames += m.getOriginalFilename();
				else
					imgNames += m.getOriginalFilename() + ",";
				
				//System.out.println("imgNames = " + imgNames);

				m.transferTo(new File(saveDir2 + "/" + m.getOriginalFilename()));
					
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		communityBoard.setBoardFileName(imgNames);
		communityBoard.setMember(member);
		communityService.insert(communityBoard);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("saveDir2", saveDir2);
		mv.addObject("originalFileName", imgNames);
		mv.addObject("fileSize", files.size());

		return "redirect:/list";
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
		return "redirect:/list";
	}
	
	/**
	 * 태그 검색하기
	 */
//	@RequestMapping(value="/tagSelect", method=RequestMethod.GET)
//	//@ResponseBody
//	public String tagSelect(String tag, Model model){
//	//public void tagSelect(String tag){
//		
//		System.out.println("태그 왔니?" +tag);
//		
//		 List<CommunityBoard> list = communityService.selectByTag(tag);
//		// System.out.println("컨트롤러 list = " + list);
//		 model.addAttribute("communityBoardList", list);
//		
//		 return "/community/list";
//		 
//	}
	
	/**
	 *  좋아요 기능
	 */
	@RequestMapping("/likeHeart/{boardNo}")
	public String likeHeart(@PathVariable Long boardNo) {
		System.out.println("컨트롤러 좋아요기능 들어오니??"); //ok
		
		// 뷰에서 넘어오는 게시글 번호 받음.
		System.out.println("컨트롤 좋아요 boardNo = " + boardNo); //ok
		
		// 누가 클릭했는지?? 정보를 꺼내야함. 회원 --> security
		//Spring Security 세션 회원정보를 반환받는다
	      Member member =(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	      Long memberNo = member.getMemberNo();
	      //System.out.println("좋아요컨트롤러 member = " + member); //ok

	      
		//서비스 호출
	    int likeBoard = communityService.selectAll(memberNo,boardNo);
	    System.out.println("컨트롤러 좋아요 결과 = " + likeBoard);
		
		return "redirect:/list";
		
	}
	

	
}
