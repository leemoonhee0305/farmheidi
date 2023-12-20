package com.spring.farm.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.spring.farm.product.CartService;
import com.spring.farm.product.CartVO;
import com.spring.farm.product.OIFService;
import com.spring.farm.product.OIFVO;
import com.spring.farm.product.OPDService;
import com.spring.farm.product.OPDVO;
import com.spring.farm.util.PagingVO;
import com.spring.farm.product.impl.IamportRest;

@Controller
public class OIFController {
	@Autowired
	private OIFService oIFService;
	@Autowired
	private OPDService oPDService;
	@Autowired
	private CartService cartService;
	@Autowired
	private IamportRest iamportRest;
	
	
//	url요청이 들어올 때마다 객체가 생성됨
	@ModelAttribute("shipStateMap")
	public Map<String, String> shipStateMap(){
		Map<String, String> stateMap = new HashMap<String, String>();
		stateMap.put("입금완료", "입금완료");
		stateMap.put("배송준비", "배송준비");
		stateMap.put("배송중", "배송중");
		stateMap.put("배송완료", "배송완료");
		return stateMap;		
	}
	
//	url요청이 들어올 때마다 객체가 생성됨
	@ModelAttribute("canStateMap")
	public Map<String, String> canStateMap(){
		Map<String, String> canStateMap = new HashMap<String, String>();
		canStateMap.put("정상주문", "정상주문");
		canStateMap.put("주문취소", "주문취소");
		return canStateMap;		
	}
	

	// 주문_OIF테이블에 주문자정보 INSERT
	@RequestMapping("/orderIntoOIF.do")
	public String orderIntoOIF(HttpServletRequest request, OIFVO ifvo, HttpSession session, @RequestParam(value="orderList")List<String> orderList, Model model) {

		// OIF, OPD 테이블에 데이터 INSERT
		String oifId = ifvo.getOif_id();
		System.out.println("주문번호 : "+oifId);
		
		
		String userID = (String) session.getAttribute("user_id");
		Cookie cookie = WebUtils.getCookie(request, "cartCookie");
		if (cookie != null && session.getAttribute("user_id") == null) {
			String ckid = cookie.getValue();
			ifvo.setCart_ckid(ckid);
			ifvo.setUser_id(null);
		} else if(session.getAttribute("user_id") != null){
			ifvo.setUser_id(userID);
			ifvo.setCart_ckid(null);
		}
		oIFService.orderIntoOIF(ifvo);

		List<String> orderData = new ArrayList<String>();
		for (String proList : orderList) {
			orderData.add(proList.replace("\"", "").replace("[", "").replace("]", ""));
		}

		List<OPDVO> pdlist = new ArrayList<OPDVO>();
		for (int i = 0; i < orderData.size() / 3; i++) {
			OPDVO pdvo = new OPDVO();
			pdvo.setOif_id(oifId);
			if(ifvo.getUser_id() != null) {
				pdvo.setUser_id(userID);
			} else {
				pdvo.setCart_ckid(ifvo.getCart_ckid());
			}

			int count = i * 3;
			pdvo.setPro_num(Integer.parseInt(orderData.get(count)));
			pdvo.setCart_amount(Integer.parseInt(orderData.get(count + 1)));
			pdvo.setCart_totalp(Integer.parseInt(orderData.get(count + 2)));
			pdlist.add(pdvo);
		}

		for (int i = 0; i < pdlist.size(); i++) {
			oPDService.orderIntoOPD(pdlist.get(i));
		}
		// -------------------------------------------

		// 구매한 상품 CART에서 데이터 삭제 : 장바구니에서 주문한 경우가 아닐 때의 조건 기술 해야함
		if (ifvo.getReduceCart() == null) {
			for (int i = 0; i < pdlist.size(); i++) {
				CartVO cvo = new CartVO();
				if(ifvo.getUser_id() != null) {
					cvo.setUser_id(userID);
				} else {
					cvo.setCart_ckid(ifvo.getCart_ckid());
				}
				cvo.setPro_num(pdlist.get(i).getPro_num());
				cartService.delSelCart(cvo);
			}
		}
		
		return "redirect:/orderInfoClear.do?oifID="+oifId;
	}
	
	// 주문완료 시점에 데이터 가져오기
		@RequestMapping("/orderInfoClear.do")
		public String getOrderInfoClear(@RequestParam(value = "oifID", required = false) String oifId, Model model) {
			model.addAttribute("orderCom", getOrderInfo(oifId));
			model.addAttribute("orderWhat", oPDService.orderWhat(oifId));
			System.out.println("주문정보 oifId: "+oifId);
			return "/product/orderComplete";
		}

	// 주문완료 데이터 가져오기
	@RequestMapping("/orderInfo.do")
	public OIFVO getOrderInfo(String oif_id) {
		return oIFService.getOrderInfo(oif_id);
	}
	
	//주문목록 전체 리스트 가져오기
	@RequestMapping("/getAllOrder.do")
	public String getAllOrder(PagingVO pv, Model model, @RequestParam(value = "page", required = false) String nowPage, OIFVO vo){
		String now = LocalDate.now().toString();
		if(vo.getSearchDate1()!=null && vo.getSearchDate2().equals("")) {
			vo.setSearchDate2(now);
		} else if(vo.getSearchDate1()==null && vo.getSearchDate2()!=null) {
			vo.setSearchDate1("2000-01-01");
		}
		
		int cntPerPage = 10;
		int total = oIFService.countOrderList();
		if (nowPage == null) {
			nowPage = "1";
		}
		pv = new PagingVO(total, Integer.parseInt(nowPage), cntPerPage);
		vo.setStart(pv.getStart());
		vo.setListcnt(cntPerPage);
		
		
		model.addAttribute("paging", pv);
		model.addAttribute("allOrderCount", oIFService.countOrderList());
		
		Integer orderTotal = oIFService.getOrderTotal();
		if(orderTotal == null) {
			orderTotal = 0;
		}
		model.addAttribute("allOrderTotal", orderTotal);
		
		model.addAttribute("getOrderClearCount", oIFService.getOrderClearCount());
		model.addAttribute("getShipPrepareCount", oIFService.getShipPrepareCount());
		model.addAttribute("getShipIngCount", oIFService.getShipIngCount());
		model.addAttribute("getShipClearCount", oIFService.getShipClearCount());
		model.addAttribute("getCancelCount", oIFService.getCancelCount());
		
		model.addAttribute("allOrderList", oIFService.getAllOrder(vo));
		return "/admin/adminOrderList";
	}
	
	//주문정보 디테일 가져오기
	@RequestMapping("/orderWhat.do")
	public String orderWhat(OPDVO vo, Model model) {
		model.addAttribute("orderAboutInfo", oIFService.getOrderInfo(vo.getOif_id()));
		model.addAttribute("orderProductInfo", oPDService.orderWhat(vo.getOif_id()));
		return "/admin/adminOrderDetail";
	}
	
	//주문내역 주문취소 상태 업데이트 및 주문취소 진행
	@RequestMapping("/upOrderState.do")
	@ResponseBody
	public int upOrderState(OIFVO vo) {
		if(vo.getOif_canstate().equals("주문취소")) {
			iamportRest.cancelPayment(vo.getOif_id());
		}
		return oIFService.updateShipstate(vo);
	}
	
	//주문내역 수령자정보 업데이트
	@RequestMapping("/updateShipInfo.do")
	public String updateShipInfo(OIFVO fvo, OPDVO pvo) {
		oIFService.updateShipInfo(fvo);
		return "redirect:/orderWhat.do";
	}
	
	// 마이페이지 상품 주문 취소 
	@RequestMapping("/myOrderCan.do")
	@ResponseBody
	public String myOrderCan(OIFVO vo, HttpSession session ) {
		String user_id = (String)session.getAttribute("user_id");
		
		System.out.println("can chk con : "+ vo);
		
		if(vo.getOif_canstate().equals("주문취소")) {
			iamportRest.cancelPayment(vo.getOif_id());
		}
		oIFService.updateShipstate(vo);
		return "/user/myOrderList.do";
	}
	
	// 마이페이지 주문 상세 확인 
//		@RequestMapping("/myOrderInfo.do")
//		public OIFVO getmyOrderInfo(String oif_id) {
//			return oIFService.getOrderInfo(oif_id);
//		}
	
}
