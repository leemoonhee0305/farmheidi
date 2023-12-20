package com.spring.farm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.spring.farm.product.CartService;
import com.spring.farm.product.CartVO;
import com.spring.farm.user.UserService;
import com.spring.farm.user.UserVO;



@Controller
public class CartContoller {

	@Autowired
	private CartService cartService;
	@Autowired
	private UserService userService;
	@Autowired
	private SqlSessionTemplate mybatis;

	// 장바구니에 담기
		@ResponseBody
		@RequestMapping("/cart/{type}")
		public String cartOneInsert(@PathVariable String type,
				@PathVariable(value = "pro_num", required = false) String pro_num,
				@PathVariable(value = "cart_amount", required = false) String order_amount,
				@PathVariable(value = "cart_totalp", required = false) String order_totalp, CartVO vo, HttpSession session,
				HttpServletRequest request, HttpServletResponse response) throws Exception {
			Cookie cookie = WebUtils.getCookie(request, "cartCookie");

			// 비회원장바구니 첫 클릭시 쿠키생성
			if (cookie == null && session.getAttribute("user_id") == null) {
				String ckid = RandomStringUtils.random(6, true, true);
				Cookie cartCookie = new Cookie("cartCookie", ckid);
				cartCookie.setPath("/");
				cartCookie.setMaxAge(60 * 60 * 24 * 1); //24시간
				response.addCookie(cartCookie);
				vo.setCart_ckid(ckid);
			} else if(cookie != null && session.getAttribute("user_id") == null){
				vo.setCart_ckid(cookie.getValue());
				vo.setUser_id(null);
			} else {
				String userID = (String) session.getAttribute("user_id");
				vo.setUser_id(userID);
				vo.setCart_ckid(null);
			}
				
			
			if(cartService.countCart(vo) <= 0) {
				cartService.cartOneInsert(vo);
			} else {
				CartVO inCartPre = mybatis.selectOne("CartDAO.inCartAmount", vo);
				
				int preCount = inCartPre.getCart_amount();
				int afterCount = vo.getCart_amount();
				int preTotalp = inCartPre.getCart_totalp();
				int afterTotalp = vo.getCart_totalp();
				
				if(type.equals("byList") || type.equals("byDetail")) {
					vo.setCart_amount(preCount + afterCount);
					vo.setCart_totalp(preTotalp + afterTotalp);
				} else if(type.equals("byCart")) {
					vo.setCart_amount(afterCount);
					vo.setCart_totalp(afterTotalp);
				}
				cartService.cartUpdate(vo);
			}
			return "redirect:/productList.do";
		}

		// 장바구니 목록 불러오기
		@RequestMapping("/inMyCart.do")
		public String getCartList(HttpSession session, Model model, CartVO vo, HttpServletRequest request, HttpServletResponse response) {
			String userID = (String) session.getAttribute("user_id");
			Cookie cookie = WebUtils.getCookie(request, "cartCookie");
			if(cookie == null && userID == null) {
				String ckid = RandomStringUtils.random(6, true, true);
				Cookie cartCookie = new Cookie("cartCookie", ckid);
				cartCookie.setPath("/");
				cartCookie.setMaxAge(60 * 60 * 24 * 1); //24시간
				response.addCookie(cartCookie);
				vo.setCart_ckid(ckid);
			} else if (cookie != null && userID == null) {
				String ckid = cookie.getValue();
				vo.setCart_ckid(ckid);
				vo.setUser_id(null);
			} else if(userID != null && cookie != null){
				String ckid = cookie.getValue();
				vo.setUser_id(userID);
				vo.setCart_ckid(ckid);
				cartService.fromCookieToUser(vo);
				
				List<CartVO> cookieProNum = cartService.inCookieCart(vo);
				for(CartVO i : cookieProNum) {
					i.setUser_id(userID);
					i.setCart_ckid(ckid);
					
					cartService.cartDoubleDelete(i);
					cartService.cartDoubleDeleteT(i);
				}
				vo.setCart_ckid(null);
			} else if(cookie == null && userID != null) {
				vo.setUser_id(userID);
				vo.setCart_ckid(null);
			}
			model.addAttribute("myCartList", cartService.inMyCartList(vo));
			return "user/inMyCart";
		}

	// 장바구니 개별 삭제
	@RequestMapping("/delete.do")
	public String inMyCartDel(CartVO vo, HttpSession session, HttpServletRequest request) {
		String userID = (String) session.getAttribute("user_id");
		Cookie cookie = WebUtils.getCookie(request, "cartCookie");
		if (cookie != null && userID == null) {
			String ckid = cookie.getValue();
			vo.setCart_ckid(ckid);
			vo.setUser_id(null);
		} else if(userID != null){
			vo.setUser_id(userID);
			vo.setCart_ckid(null);
		}
		cartService.delSelCart(vo);
		return "redirect:inMyCart.do";
	}

	// 장바구니 전체 삭제
	@RequestMapping("/delCart.do")
	public String deletCart(CartVO vo, HttpSession session, HttpServletRequest request) {
		String userID = (String) session.getAttribute("user_id");
		Cookie cookie = WebUtils.getCookie(request, "cartCookie");
		if (cookie != null && userID == null) {
			String ckid = cookie.getValue();
			vo.setCart_ckid(ckid);
			vo.setUser_id(null);
		} else if(userID != null){
			vo.setUser_id(userID);
			vo.setCart_ckid(null);
		}
		cartService.delCart(vo);
		return "redirect:inMyCart.do";
	}

	// 장바구니 선택 삭제
	@RequestMapping("/delSelCart.do")
	public String delSelCart(CartVO vo, HttpSession session, HttpServletRequest request) {
		String userID = (String) session.getAttribute("user_id");
		Cookie cookie = WebUtils.getCookie(request, "cartCookie");
		if (cookie != null && userID == null) {
			for (int i : vo.getIdList()) {
				CartVO cvo = new CartVO();
				String ckid = cookie.getValue();
				cvo.setCart_ckid(ckid);
				cvo.setUser_id(null);
				cvo.setUser_id((String)session.getAttribute("user_id"));
				cvo.setPro_num(i);
				cartService.delSelCart(cvo);
			}
			
		} else if(session.getAttribute("user_id") != null){
			for (int i : vo.getIdList()) {
				CartVO cvo = new CartVO();
				vo.setCart_ckid(null);
				vo.setUser_id(userID);
				cvo.setPro_num(i);
				cartService.delSelCart(cvo);
			}
		}
		
		return "redirect:/inMyCart.do";
	}

	// 카트내 상품 전체 구매
		@RequestMapping("/buyProd.do")
		public String getCartListForOrder(HttpServletRequest request, HttpSession session, Model model, UserVO vo, CartVO cvo) {

			String userID = (String) session.getAttribute("user_id");
			Cookie cookie = WebUtils.getCookie(request, "cartCookie");

			if (cookie != null && userID == null) {
				String ckid = cookie.getValue();
				cvo.setCart_ckid(ckid);
			} else if(userID != null) {
				cvo.setUser_id(userID);
				cvo.setCart_ckid(null);
				vo.setUser_id(userID);
			}
			model.addAttribute("userinfo", userService.myinfoUser(vo));
			model.addAttribute("allCartList", cartService.inMyCartList(cvo));
			return "product/productOrder";
		}

		// 장바구니내 상품 선택 구매
		@RequestMapping("/selBuy.do")
		public String selBuy(CartVO cvo, UserVO uvo, HttpSession session, HttpServletRequest request, Model model) {
			List<CartVO> selOrderList = new ArrayList<CartVO>();
			
			String userID = (String) session.getAttribute("user_id");
			Cookie cookie = WebUtils.getCookie(request, "cartCookie");

			if (cookie != null && userID == null) {
				for (int pn : cvo.getIdList()) {
					String ckid = cookie.getValue();
					cvo.setCart_ckid(ckid);
					cvo.setPro_num(pn);
					selOrderList.add(cartService.selBuy(cvo));
				}
			} else if(userID != null) {
				uvo.setUser_id(userID);
				for (int pn : cvo.getIdList()) {
					cvo.setUser_id(userID);
					cvo.setCart_ckid(null);
					cvo.setPro_num(pn);
					selOrderList.add(cartService.selBuy(cvo));
				}
			}
			
			model.addAttribute("selOrderList", selOrderList);
			model.addAttribute("userinfo", userService.myinfoUser(uvo));
			return "product/productOrder";
		}
	   
	   
	// 장바구니내 상품 확인
	   @ResponseBody
	   @RequestMapping("/countCart")
	   public int countCart(HttpSession session, CartVO vo, HttpServletRequest request, HttpServletResponse response) {
	      String userId = (String) session.getAttribute("user_id");
	      Cookie cookie = WebUtils.getCookie(request, "cartCookie");
	      int count = 0;
	      if(cookie != null && session.getAttribute("user_id") == null) {
	    	  String ckid = cookie.getValue();
	    	  vo.setCart_ckid(ckid);
	    	  count = cartService.countCart(vo);
	      } else if(session.getAttribute("user_id") != null) {
	    	  vo.setUser_id(userId);
	    	  vo.setCart_ckid(null);
	    	  count = cartService.countCart(vo);
	      }
	      
	      return count;
	   }
}
