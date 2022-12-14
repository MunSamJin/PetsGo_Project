package kosta.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
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
import kosta.mvc.domain.LikeBoardArrange;
import kosta.mvc.domain.Member;
import kosta.mvc.domain.Reservation;
import kosta.mvc.service.CommunityService;
import kosta.mvc.service.MemberService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/community")
@RequiredArgsConstructor
public class CommunityController {
	
	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private MemberService memberService;
	
	private final static int PAGE_COUNT=6;
	
	private final static int BLOCK_COUNT=3;

	/**
	 *  ???????????? ?????? ??????
	 */
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void list(String tag, Model model, @RequestParam(defaultValue = "1")int nowPage) {
		
		PageRequest page = PageRequest.of( (nowPage)-1, PAGE_COUNT, Direction.DESC, "boardNo");
		Page<CommunityBoard> pageList = null;
		int temp = (nowPage-1) % BLOCK_COUNT;
		int startPage = nowPage-temp;
		
		System.out.println("tag = " + tag);
		
		//????????? ???????????? + ???????????? + ????????? ??????
		if(tag != null) {
			if(tag.equals("?????????")) {
				page = PageRequest.of( (nowPage)-1, PAGE_COUNT, Direction.DESC, "likecount");
				Page<LikeBoardArrange> likeList = communityService.selectLikeBoardArrange(page);
				System.out.println("likeList = " + likeList);
				
				model.addAttribute("likeList", likeList.getContent());	
				model.addAttribute("blockCount", BLOCK_COUNT);
				model.addAttribute("startPage", startPage);
				model.addAttribute("nowPage", nowPage);
				model.addAttribute("totalPages", likeList.getTotalPages());
				
			}else {
				pageList = communityService.selectByTag(tag,page);
				System.out.println("pageList = " + pageList);
				
				model.addAttribute("communityBoardList", pageList.getContent());
				model.addAttribute("blockCount", BLOCK_COUNT);
				model.addAttribute("startPage", startPage);
				model.addAttribute("nowPage", nowPage);
				model.addAttribute("totalPages", pageList.getTotalPages());
			}
			
		} else {
			pageList = communityService.selectAll(page);
			System.out.println("pageList = " + pageList);
			
			model.addAttribute("communityBoardList", pageList.getContent());//communityBoardList
			model.addAttribute("blockCount", BLOCK_COUNT);
			model.addAttribute("startPage", startPage);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("totalPages", pageList.getTotalPages());
		}
		
		
	}
	
	
	
	/**
	 *  ?????????
	 */
	@RequestMapping("/write")
	public void write(Model model, Authentication auth) {
		System.out.println("???????????? ????????? ??????????????");
		
		Object object = auth.getPrincipal();
		Member member = null;
		
		if(object instanceof Member) {
			member = (Member)auth.getPrincipal();
		}
		Long memberNo = member.getMemberNo();
		//System.out.println("member???????????? memberNo = " + memberNo);
		
		List<Reservation> list = memberService.selectAll(memberNo);
		//System.out.println("member???????????? list = " + list);
		
		model.addAttribute("reservation", list);
	}
	
	
	/**
	 *  ???????????? : ??? + ?????? ????????? ??????
	 */
	@RequestMapping("/insert")
	public String insert(CommunityBoard communityBoard, @RequestParam("files") List<MultipartFile> files, 
			HttpSession session, Authentication auth) {
		System.out.println("???????????? ???????????? ???????");
		
		String saveDir2 = session.getServletContext().getRealPath("/img/samjin/");
		String imgNames = "";
		
		Object object = auth.getPrincipal();
		Member member = null;
		if(object instanceof Member) {
			member = (Member)auth.getPrincipal();
		}
		
		
		try {
			
			System.out.println("?????? = " + files.size());
			
			// for (MultipartFile file : files) {
			for (int i = 0; i < files.size(); i++) {
				MultipartFile m = files.get(i);
				//System.out.println("?????????????????? = " + m.getOriginalFilename());
				
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

		return "redirect:/community/list";
	}
	
	
	/**
	 *  ????????????
	 */
	@RequestMapping("/read/{boardNo}")
	public String read(@PathVariable Long boardNo, Model model) {

		CommunityBoard communityBoard = communityService.selectBy(boardNo);
		
		Member member =(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    Long memberNo = member.getMemberNo();
	    
		LikeBoard likeBoard = communityService.selectLikeNo(memberNo, boardNo);
		
		model.addAttribute("communityBoard", communityBoard); //${communityBoard}
		model.addAttribute("likeBoard", likeBoard); //${likeBoard}
		
	
		return "community/read";
	}
	
	/**
	 *  ?????????
	 */
	@RequestMapping("/updateForm")
	public void updateForm(Long boardNo, Model model) {
		CommunityBoard board = communityService.selectBy(boardNo);
		model.addAttribute("board", board);
		
		Member member =(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Long memberNo = member.getMemberNo();
		List<Reservation> list = memberService.selectAll(memberNo);
		//System.out.println("member???????????? list = " + list);
		
		model.addAttribute("reservation", list);
	}
	
	/**
	 *  ??????????????????
	 */
	@RequestMapping("/update")
	public String update(CommunityBoard board, @RequestParam("files") List<MultipartFile> files,
			HttpSession session) {
		
		Long boardNo = board.getBoardNo();
		System.out.println("board.getboardNo" + board.getBoardNo());
		
		String saveDir3 = session.getServletContext().getRealPath("/img/samjin/");
		String imgNames = "";
		
		try {
			for (int i = 0; i < files.size(); i++) {
				MultipartFile m = files.get(i);
				System.out.println("?????????????????? = " + m.getOriginalFilename());
				
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
		
		//????????? ??? ??????????????? ???????????? ????????????!
		System.out.println("imgNames = " + imgNames );
		
		if(imgNames == null || imgNames.equals("") ) {
			CommunityBoard board2 = communityService.selectBy(boardNo);
			String dbFileName = board2.getBoardFileName();
			board.setBoardFileName(dbFileName);
		}else {
			board.setBoardFileName(imgNames);
		}
		
		
		System.out.println("???????????? ????????? ???????????????");
		CommunityBoard dbBoard = communityService.update(board);
		
		
		return "redirect:/community/read/"+boardNo;
	}
	
	/**
	 *  ????????????
	 */
	@RequestMapping("/delete")
	public String delete(Long boardNo) {
		communityService.delete(boardNo);
		return "redirect:/community/list";
	}

	
	/**
	 *  ????????? ??????
	 */
	@RequestMapping("/likeHeart/{boardNo}")
	@ResponseBody
	public int likeHeart(@PathVariable Long boardNo) {
		System.out.println("???????????? ??????????????? ??????????????"); //ok
		
		// ????????? ???????????? ????????? ?????? ??????.
		System.out.println("????????? ????????? boardNo = " + boardNo); //ok
		
		// ?????? ????????????????? ????????? ????????????. ?????? --> security
		//Spring Security ?????? ??????????????? ???????????????
	      Member member =(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	      Long memberNo = member.getMemberNo();
	      System.out.println("????????????????????? member = " + member); //ok

	      
		//????????? ??????
	    int likeBoard = communityService.selectAll(memberNo,boardNo);
	    System.out.println("???????????? ????????? ?????? = " + likeBoard);
		
		return likeBoard;
		
	}
	

	
}
