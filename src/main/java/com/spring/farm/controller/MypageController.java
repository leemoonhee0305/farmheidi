package com.spring.farm.controller;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.farm.community.QNAService;
import com.spring.farm.mypage.MypageService;
import com.spring.farm.mypage.MypageVO;
import com.spring.farm.play.ResvService;
import com.spring.farm.play.ResvVO;
import com.spring.farm.product.OIFService;
import com.spring.farm.product.OIFVO;
import com.spring.farm.product.ProductService;
import com.spring.farm.product.ProductVO;
import com.spring.farm.user.UserVO;
import com.spring.farm.util.PagingVO;

@Controller
public class MypageController {

	@Autowired
	private MypageService mypageService;
	@Autowired
	private ResvService resvService;
	@Autowired
	private OIFService oifService;
	@Autowired
	private QNAService qnaService;
	
	@RequestMapping("/myinfoUser.do")	
	public String myinfoUser(MypageVO vo, Model model) {
		model.addAttribute("mypage", mypageService.myinfoUser(vo));		
		return "user/mypage";
	}
	
	@RequestMapping("/myOrderList.do")
	   public String myOrderList(PagingVO pv, MypageVO vo, Model model, HttpSession session,
	         @RequestParam(value = "nowPage", required = false) String nowPage) {
	      String user_id = (String)session.getAttribute("user_id");
	      String cntPerPage = "5";
	      
	      int total = oifService.countOrderList();
	      if (nowPage == null) {
	         nowPage = "1";
	      }
	      pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
	      model.addAttribute("paging", pv);
	      vo.setStart(pv.getStart());
	      vo.setListcnt(Integer.parseInt(cntPerPage));
	      vo.setUser_id(user_id);
	      model.addAttribute("myOrderList", mypageService.myOrderList(vo));
	      return "/user/myOrderList";
	   }	
	
	@RequestMapping("/myResvList.do")
	public String myResvList(HttpSession session, HttpServletRequest request, ResvVO vo, Model model) {
		String user_id = (String)session.getAttribute("user_id");
		
		model.addAttribute("resv_userId", user_id);
		vo.setResv_userId(user_id);
		
		if(request.getParameter("searchYear") != null && request.getParameter("searchMonth") != null) {
			
			model.addAttribute("searchYear", request.getParameter("searchYear"));
			model.addAttribute("searchMonth", request.getParameter("searchMonth"));

			String resvSdate = request.getParameter("searchYear")+"-"+request.getParameter("searchMonth")+"-01";
			String resvEdate = request.getParameter("searchYear")+"-"+request.getParameter("searchMonth")+"-31";
			model.addAttribute("searchSdate", resvSdate);
			model.addAttribute("searchEdate", resvEdate);
			vo.setSearchSdate(resvSdate);
			vo.setSearchEdate(resvEdate);
		} 

		model.addAttribute("resvList", resvService.getUserResvList(vo));
		return "user/myResvList";
	}
	
	@RequestMapping("/myQnaList.do")
	public String myQnaList(PagingVO pv, MypageVO vo, Model model, HttpSession session, @RequestParam(value="nowPage", required = false) String nowPage) {
		String user_id = (String)session.getAttribute("user_id");
		String cntPerPage = "5";
				
		int total = mypageService.countMyqna();
		if (nowPage == null) {
			nowPage ="1";
		}
		pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pv);
		vo.setStart(pv.getStart());
		vo.setListcnt(Integer.parseInt(cntPerPage));
		vo.setUser_id(user_id);
		model.addAttribute("myQnaList", mypageService.myQnaList(vo));
				
		return "user/myQnaList";
	}
	
	@RequestMapping("/myresvCan.do")
	public String myresvCan(MypageVO vo, HttpSession session) {
		mypageService.myresvCan(vo);
		return "redirect:/myResvList";
	}
	
}
