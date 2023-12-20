package com.spring.farm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.farm.community.NoticeService;
import com.spring.farm.community.NoticeVO;
import com.spring.farm.product.ProductService;
import com.spring.farm.product.ProductVO;

@Controller
public class MainController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/main.do")
	public String goMain(ProductVO pvo, NoticeVO nvo , Model model) {
		System.out.println("main.do 탔음");
		List<ProductVO> product = productService.getProductListDESC();
		model.addAttribute("product" , product);
		
		nvo.setListcnt(100);
		List<NoticeVO> notice = noticeService.getNoticeList(nvo);
		model.addAttribute("notice", notice);
		
		return "includeMain";
	}
	
//	@RequestMapping("/introduce.do")
//	public String goIntro(){
//		return "introduce";
//	}

}
