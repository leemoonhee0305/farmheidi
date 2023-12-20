package com.spring.farm.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.farm.product.ProductService;
import com.spring.farm.product.ProductVO;
import com.spring.farm.user.UserService;
import com.spring.farm.user.UserVO;
import com.spring.farm.util.PagingVO;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	@Autowired
	private UserService userService;

	@RequestMapping("/productList.do")
	public String getProductList(PagingVO pv, ProductVO vo, Model model,
			@RequestParam(value = "page", required = false) String nowPage) {
		int cntPerPage = 8;
		if (vo.getSearch() == null) {
			vo.setSearch("");
		}

		if (vo.getSearchKeyword() == null) {
			vo.setSearchKeyword("");
		}

		if (nowPage == null) {
			nowPage = "1";
		}

		vo.setInUser("inUser");
		int total = productService.countProduct(vo);

		pv = new PagingVO(total, Integer.parseInt(nowPage), cntPerPage);

		model.addAttribute("paging", pv);
		vo.setStart(pv.getStart());
		vo.setListcnt(cntPerPage);
		
		model.addAttribute("productList", productService.getProductList(vo));
		return "product/productMain";
	}
	
	

	// 상품 상세 페이지로 넘어가기
	@RequestMapping("/productDetail.do")
	public String getProduct(ProductVO vo, Model model) {
		model.addAttribute("productDetail", productService.getProductDetail(vo));
		return "product/productDetail";
	}


	// 상품 상세 -> 구매 페이지로 넘어가기
	@RequestMapping("/orderProduct.do")
	public String proDetOrd(ProductVO vo, Model model, @RequestParam String amount, @RequestParam String price,
			UserVO uvo, HttpSession session, HttpServletRequest request) {
		int orderamount = Integer.parseInt(amount);
		int orderprice = Integer.parseInt(price);
		
		String userID = (String) session.getAttribute("user_id");

	    if(session.getAttribute("user_id") != null) {
	    	uvo.setUser_id(userID);
	    }
		
		model.addAttribute("orderProduct", productService.getProductDetail(vo));
		model.addAttribute("orderAmount", orderamount);
		model.addAttribute("orderPrice", orderprice);
		model.addAttribute("userinfo", userService.myinfoUser(uvo));
		model.addAttribute("notReduce", "notReduce");

		return "product/productOrder";
	}
	
	
	// 관리자 메뉴 컨트롤러
	
	// 관리자 상품관리
		@RequestMapping("/adminProduct.do")
		public String ordPrdList(PagingVO pv, ProductVO vo, Model model,
				@RequestParam(value = "page", required = false) String nowPage) {
			int cntPerPage = 10;
			if (vo.getSearch() == null) {
				vo.setSearch("");
			}

			if (vo.getSearchKeyword() == null) {
				vo.setSearchKeyword("");
			}

			if (nowPage == null) {
				nowPage = "1";
			}

			int total = productService.countProduct(vo);

			pv = new PagingVO(total, Integer.parseInt(nowPage), cntPerPage);

			model.addAttribute("paging", pv);
			vo.setStart(pv.getStart());
			vo.setListcnt(cntPerPage);

			model.addAttribute("admProList", productService.getProductList(vo));
			return "/admin/adminProduct";
		}
		
		
		// 상품 선택 삭제
		@RequestMapping("/delSelProd.do")
		public String delSelProd(ProductVO vo) {
			for (int i : vo.getIdList()) {
				int pvo = productService.orderHistoryCnt(i);
				vo.setPro_num(i);
				if(pvo == 0 ) {
					productService.delSelProd(vo);
				}
			}
			
			return "redirect:/adminProduct.do";
		}

		//판매 중지 변경
		@RequestMapping("/stop.do")
		public String stop(ProductVO vo) {
			productService.stop(vo);
			return "redirect:/adminProduct.do";
		}
		
		
		// 보완 상품 등록 수정
		@RequestMapping(value = "/inup.do", method = RequestMethod.GET)
		public String inup(ProductVO vo, Model model,@RequestParam String fn) {
					
			if(fn.equals("i")) {
				model.addAttribute("uri", "/inup.do?fn=i");
			} else {
				model.addAttribute("uri", "/inup.do?fn=u");
				model.addAttribute("pvo", productService.upProdsel(vo));
			}
					
			return "admin/adminAddProduct";
		}
				
		@RequestMapping(value = "/inup.do", method = RequestMethod.POST)
		public String inup(MultipartHttpServletRequest request, HttpServletResponse response,ProductVO vo, @RequestParam String fn) throws IllegalStateException, IOException{
			
			if(productService.getProductDetail(vo)!=null && fn.equals("i")) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter writer = response.getWriter();
				writer.println("<script>");
				writer.println("alert('이미 존재하는 상품코드입니다.');");
				writer.println("history.back();");
				writer.println("</script>");
				writer.flush();
				return "";
			}
				
			MultipartFile uploadFile = vo.getUploadFile();
			String realPath = request.getSession().getServletContext().getRealPath("/resources/img/productPicture/");
					
			//상대 경로 추가 시 realPath 추가
			File f = new File(realPath);
			if(!f.exists()) {f.mkdirs();}
			
			String fileName = uploadFile.getOriginalFilename();
			
			
			if(!uploadFile.isEmpty()) {
				vo.setPro_file(fileName);
				//파일업로드가 되는 시점 ↓
				uploadFile.transferTo(new File(realPath+fileName));
			} else if(fn.equals("u") && uploadFile.isEmpty()){
				ProductVO pvo = productService.getFileName(vo);
				String preFile = pvo.getPro_file();
				if(preFile != null) {
					vo.setPro_file(preFile);
				}
			}
					
			if(fn.equals("i")) {
				productService.insertProd(vo);
			}else {
				productService.updateProd(vo);
			}
			return "redirect:/adminProduct.do";
		}		
				
		//관리자 상품 개별 삭제
				@ResponseBody
				@RequestMapping("/delAdmProd.do")
				public int delAdmProd(ProductVO vo) {
					int a = 0;
					int i = vo.getPro_num();
					System.out.println(i);
					int pvo = productService.orderHistoryCnt(i);
					System.out.println(pvo);
					// pvo = 배송중인 상품 수량
					if(pvo == 0) {//배송중인게 없을경우 삭제, a=1이 됨
						System.out.println("a"+a);
						a = productService.delSelProd(vo);
					}
					System.out.println("a"+a);
					//배송중일경우 a=0 배송중아니면 a=1
					return a;
				}			

}
