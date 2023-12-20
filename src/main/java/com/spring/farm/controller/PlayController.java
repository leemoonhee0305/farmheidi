package com.spring.farm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.farm.play.DateData;
import com.spring.farm.play.HolidayService;
import com.spring.farm.play.HolidayVO;
import com.spring.farm.play.PlayListService;
import com.spring.farm.play.PlayListVO;
import com.spring.farm.play.ResvService;
import com.spring.farm.play.ResvVO;
import com.spring.farm.product.impl.IamportRest;
import com.spring.farm.user.UserService;
import com.spring.farm.user.UserVO;
import com.spring.farm.util.PagingVO;


@Controller
public class PlayController {
	
	@Autowired
	private PlayListService playListService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ResvService resvService;
	
	@Autowired
	private HolidayService holidayService;
	
	@Autowired
	private IamportRest iamportRest;
	// 체험 설명 페이지이자 메인페이지
	@RequestMapping("/playMain.do")
	public String showPlayList(PlayListVO vo, Model model){
		System.out.println("playMain.do : 전체 목록 보여주기");
		List<PlayListVO> playList = playListService.getPlayList();
		model.addAttribute("playList", playList);
		return "play/playMain";
	}
	
	
	// 체험 스케쥴 달력 컨트롤러
	@RequestMapping("/playSchedule.do")
	public String calendar(@RequestParam(value="clickCount", required=false) int clickCount, Model model, DateData dateData){
		System.out.println("playSchedule.do : 체험 일정 페이지로 이동");
		Calendar cal = Calendar.getInstance();
		DateData calendarData;
		
		//검색 날짜
		if(dateData.getDate().equals("")&&dateData.getMonth().equals("")){
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null);
		}
		DateData count = new DateData();
		count.setClickCount(clickCount);
		System.out.println(count.getClickCount());

		// 해당 년도의 휴일 가져오는것
		String initMonth = Integer.toString(Integer.valueOf(dateData.getMonth())+1);
		dateData.setMonth(initMonth);
		List<HolidayVO> holiday = holidayService.getHolidayList(dateData);

		initMonth = Integer.toString(Integer.valueOf(dateData.getMonth())-1);
		dateData.setMonth(initMonth);
		Map<String, Integer> today_info =  dateData.today_info(dateData);
		List<DateData> dateList = new ArrayList<DateData>();
		
		//실질적인 달력 데이터 리스트에 데이터 삽입 시작.
		//일단 시작 인덱스까지 아무것도 없는 데이터 삽입
		for(int i=1; i<today_info.get("start"); i++){
			calendarData= new DateData(null, null, null, null);
			dateList.add(calendarData);
		}
		
		//날짜 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			if(i==today_info.get("today")){
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "today");
			}else{
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "normal_date");
			}                                                            
			dateList.add(calendarData);
		}
		
		//달력 빈곳 빈 데이터로 삽입
		int index = 7-dateList.size()%7;
		
		if(dateList.size()%7!=0){
			
			for (int i = 0; i < index; i++) {
				calendarData= new DateData(null, null, null, null);
				dateList.add(calendarData);
			}
		}
		System.out.println(dateList);
		System.out.println("holiday : " + holiday);
		//배열에 담음
		model.addAttribute("dateList", dateList);		//날짜 데이터 배열
		model.addAttribute("today_info", today_info);
		model.addAttribute("count", count);
		model.addAttribute("holiday", holiday);
		return "play/playSchedule";
	}
	
	// 자주 묻는 질문 페이지
	@RequestMapping("/playQNA.do")
	public String showQNA() {
		System.out.println("playQNA.do : 자주묻는 질문 페이지로 이동");
		return "play/playQNA";
	}
	

	   // 체험 예약 메인 페이지
	   @RequestMapping("/resvMain.do")
	   public String goResMain(HttpSession session, HttpServletRequest request, HttpServletResponse response, PlayListVO vo, ResvVO rvo, Model model) throws IOException{
	      System.out.println("ResvMain.do : 예약 페이지로 이동(WEB-INF)");
	      
	      try {
	         String user_id = (String)session.getAttribute("user_id");
	         System.out.println("user_id : " + user_id);
	         int totalprice = 0;
	         if(user_id != null) {
	            PlayListVO playPackOne = playListService.getPlayPackageOne(vo);      
	            playPackOne = playListService.getPlayPackageOne(vo);
	            model.addAttribute("play", playPackOne);
	           	            
	            List<PlayListVO> playList = playListService.getPlayList();
	            
	            for(int i =0; i< playList.size(); i++) {
	               totalprice += playList.get(i).getPla_price();
	            }
	            int personSumPrice = totalprice - 15000;
	            int youthSumPrice = totalprice - 30000;
	            
	            
	            model.addAttribute("personSumPrice", personSumPrice);
	            model.addAttribute("youthSumPrice", youthSumPrice);
	            
	            model.addAttribute("playList", playList);
	            return "play/resvMain";
	         }else {
	            response.setContentType("text/html; charset=utf-8");
	            PrintWriter out = response.getWriter();
	           
	            out.println("<script>");
	            out.println("alert('로그인 후 이용해주세요');");
	            out.println("</script>");
	            System.out.println("로그인 후 이용");
	            
	            return "redirect:login.do";
	         }
	      }catch(Exception e){
	         e.printStackTrace();
	      }
	      System.out.println("아무것도 못타서 main으로 돌아가버림");
	      return "main";
	   }
	
	// 체험 예약 내역 페이지
	@RequestMapping("/resvCheck.do")
	public String showResvList(HttpSession session, HttpServletRequest request, ResvVO vo, Model model) {
		System.out.println("ResvVO.do : 예약내역 보여주기");
		
		String user_id = (String)session.getAttribute("user_id");
		System.out.println("user_id : " + user_id);
		
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
		List<ResvVO> resvList = resvService.getUserResvList(vo);
		model.addAttribute("resvList", resvList);
		
		model.addAttribute("total", resvList.size());
	
		return "play/resvCheck";
	}
	
	// 체험 예약 내역 <취소> 페이지
	 @RequestMapping("/resvCancel.do")
	   public String cancelResv(HttpSession session, HttpServletRequest request, ResvVO vo, Model model) {

	      String user_id = (String)session.getAttribute("user_id");

	      vo.setResv_userId(user_id);

	      
	      model.addAttribute("resv_userId", user_id);
	      vo.setResv_userId(user_id);
	      
	      model.addAttribute("resv_num", request.getParameter("num"));
	      vo.setResv_num(request.getParameter("num"));
	      
	      ResvVO resv = resvService.getResv(vo);
	      
	      resvService.cancelResv(resv);
	      iamportRest.cancelPayment(resv.getResv_num());
	      
	      
	      List<ResvVO> resvList = resvService.getUserResvList(vo);
	      model.addAttribute("resvList", resvList);
	      
	      model.addAttribute("total", resvList.size());

	      return "play/resvCheck";
	   }

	
	// 체험 예약 페이지
	@RequestMapping("/resvReq.do")
	public String showResvReq(HttpSession session, HttpServletRequest request, PlayListVO vo, ResvVO rvo, UserVO uvo, Model model, DateData dateData) {
		System.out.println("resvReq.do : 체험 예약하는 페이지로");

		PlayListVO playPackOne = playListService.getPlayPackageOne(vo);
		playPackOne = playListService.getPlayPackageOne(vo);
		model.addAttribute("play", playPackOne);

		List<PlayListVO> playList = playListService.getPlayList();
		model.addAttribute("playList", playList);
		
		int sumPrice = 0; //상품별가격합계
		int personPrice = 0; //인당가격
		String packPName = "패키지상품(건초+우유+소+치즈+쿠킹)";
		for(int i=0; i<playList.size(); i++) {
			sumPrice += playList.get(i).getPla_price();
		}
		if(sumPrice > 0) {
			personPrice = (sumPrice/playList.size());
		}
		System.out.println("sumPrice : "+sumPrice);
		System.out.println("personPrice : "+personPrice);
		model.addAttribute("personPrice", personPrice);		
		model.addAttribute("packPName", packPName);

		String user_id = (String)session.getAttribute("user_id");
		System.out.println("user_id : " + user_id);
		
		if(user_id != null) {
			uvo.setUser_id(user_id);
			UserVO luvo = userService.myinfoUser(uvo);
			System.out.println("getUser_id() : "+luvo.getUser_id());			
			System.out.println("getUser_name() : "+luvo.getUser_name());
			model.addAttribute("resv_name", luvo.getUser_name());
			model.addAttribute("user_name", luvo.getUser_name());
			model.addAttribute("user_id", luvo.getUser_id());
			model.addAttribute("user_mail", luvo.getUser_mail());
			model.addAttribute("user_phone", luvo.getUser_phone());
			
		}

		
		// 기존 예약일 날짜 문자열 설정
		System.out.println("getHolidayList : 공휴일 목록 리스트");
		List<HolidayVO> holidayList = holidayService.getHolidayAllList(dateData); // 전체 공휴일 목록
		System.out.println("holidayList : " + holidayList);
		
		String holidayStrs = ""; //디비 공휴일 문자열
		for(int i=0; i<holidayList.size(); i++) {
			String hdYear = holidayList.get(i).getHoliday_year();
			String hdMonth = holidayList.get(i).getHoliday_month();
			String hdDay = holidayList.get(i).getHoliday_day();
			if(holidayStrs == "") {
				holidayStrs = hdYear+"-"+hdMonth+"-"+hdDay;				
			} else {
				holidayStrs += ","+hdYear+"-"+hdMonth+"-"+hdDay; //구분자(,)로 결합
			}
		}
		System.out.println("holidayStrs : " + holidayStrs);
		model.addAttribute("holidayStrs", holidayStrs);
		
		model.addAttribute("resv_userId", user_id);
		rvo.setResv_userId(user_id);
		System.out.println("resv_userId :> " + user_id);
		
		List<ResvVO> resvList = resvService.getUserResvList(rvo);
		String resvDateStrs = ""; //기존 예약일 문자열
		String strDate = ""; //건별 기존 예약일
		for(int i=0; i<resvList.size(); i++) {
			if(resvList.get(i).getResv_status().equals("n")) { //(취소안된 예약날짜만 확인, y:취소완료)
				strDate = resvList.get(i).getResv_date().toString();
				//System.out.println(i+" = 취소여부 : " + resvList.get(i).getResv_status());

				if(resvDateStrs == "") {
					resvDateStrs = strDate;
				} else {
					if(resvDateStrs.contains(strDate)) {
					} else {
						resvDateStrs += ","+strDate; //구분자(,)로 결합
					}
				}
			}
		}
		model.addAttribute("resvDateStrs", resvDateStrs);
		
		return "play/resvReq";
	}
	
	// 체험 예약 액션
	   @RequestMapping("/resv.do")
	   public String doReserve(HttpSession session, HttpServletRequest request, PlayListVO pvo, ResvVO rvo, Model model) throws IOException {
	      System.out.println("resv.do : 실행");      
	      try {
	         System.out.println("resv_name : "+(String)request.getParameter("resv_name"));
	         List<PlayListVO> playList = playListService.getPlayList();
	         model.addAttribute("playList", playList);
	// 여기부터 가격         
	         int totalprice = 0; //예약 최종적용금액
	         int sumPrice = 0; //상품별가격합계
	         int personSumPrice = 0; //가격합계(성인)
	         int youthSumPrice = 0; //가격합계(청소년)
	         
	         // 가격 합
	         for(int i=0; i<playList.size(); i++) {
	            sumPrice += playList.get(i).getPla_price();
	         }
	         
	         // 성인/청소년/총 가격
	         if(sumPrice > 0) {
	            if(request.getParameter("resv_headcount") != null) {
	               System.out.println("resv_headcount : "+Integer.parseInt(request.getParameter("resv_headcount")));
	               personSumPrice = (sumPrice - 15000); //성인가격(15000원 할인)
	               personSumPrice = (personSumPrice*Integer.parseInt(request.getParameter("resv_headcount"))); //성인가격 * 인원수               
	            }
	            if(request.getParameter("resv_youthheadcount") != null) {
	               System.out.println("resv_youthheadcount : "+Integer.parseInt(request.getParameter("resv_youthheadcount")));
	               youthSumPrice = (sumPrice - 30000); //청소년가격(30000원 할인)
	               youthSumPrice = (youthSumPrice*Integer.parseInt(request.getParameter("resv_youthheadcount"))); //청소년가격   * 인원수            
	            }
	            totalprice = (personSumPrice + youthSumPrice); //최종적용금액
	         }
	         
	         
	         System.out.println("sumPrice(상품가격합) : "+sumPrice);         
	         System.out.println("personSumPrice : "+personSumPrice);
	         System.out.println("youthSumPrice : "+youthSumPrice);
	         System.out.println("totalprice : "+totalprice);
	// 여기까지
	         
	// 여기부터 date         
	         
	         String reqDate = (String)request.getParameter("resv_date"); //(년-월-일) 폼 전송값..
	         String[] reqDateArr = reqDate.split("-"); //구분자(-)로 분리         
	         
	         //년도는 1900 차감, 월은 1을 차감..
	         java.util.Date rDate = new java.util.Date((Integer.parseInt(reqDateArr[0])-1900), (Integer.parseInt(reqDateArr[1])-1), Integer.parseInt(reqDateArr[2]), 0, 0, 0);
	         java.sql.Date sDate = new java.sql.Date(rDate.getTime());

	         System.out.println("java.sql.Date sDate : "+sDate);

	// 여기까지
	         rvo.setResv_pnum(1);
	         rvo.setResv_totalprice(totalprice);
	         rvo.setResv_status("n");
	         rvo.setResv_compay("y");
	         resvService.insertResv(rvo);
	         
	         String user_id = (String)session.getAttribute("user_id");
	         System.out.println("user_id : " + user_id);
	            
	         model.addAttribute("resv_userId", user_id);
	         rvo.setResv_userId(user_id);
	            
	         List<ResvVO> resvList = resvService.getUserResvList(rvo);
	         model.addAttribute("resvList", resvList);
	         
	         return "redirect:/resvCheck.do";
	         
	      }catch(Exception e){
	         e.printStackTrace();
	      }
	      return "redirect:/resvCheck.do";
	   }

	
	
	// 관리자 - 체험 예약현황 목록
	@RequestMapping("/adminResvList.do")
	public String showAdminResvList(HttpSession session, HttpServletRequest request, ResvVO vo, Model model, PagingVO pv, @RequestParam(value = "page", required = false) String nowPage) {
		System.out.println("adminResvList.do : 관리자 체험 예약현황 페이지로 이동");
		
		int cntPerPage = 10; //페이지당 10개 출력
		if (vo.getSearchKeyword() == null) {
			vo.setSearchKeyword("");
		}
		if (nowPage == null) {
			nowPage = "1";
		}
		if(vo.getCntPerPage() < 1) {
			vo.setCntPerPage(cntPerPage);
		}		
		
		String user_id = (String)session.getAttribute("user_id");
		System.out.println("user_id : " + user_id);
		
		model.addAttribute("resv_userId", user_id);
		vo.setResv_userId(user_id);
		
		if(request.getParameter("searchKeyword") != null) {
			System.out.println("searchKeyword : " + request.getParameter("searchKeyword"));
			model.addAttribute("searchKeyword", request.getParameter("searchKeyword"));
			vo.setSearchKeyword(request.getParameter("searchKeyword"));
		}
		
		if(request.getParameter("searchYear") != null && request.getParameter("searchMonth") != null) {
			
			System.out.println("searchYear : " + request.getParameter("searchYear"));
			System.out.println("searchMonth : " + request.getParameter("searchMonth"));
			model.addAttribute("searchYear", request.getParameter("searchYear"));
			model.addAttribute("searchMonth", request.getParameter("searchMonth"));

			String resvSdate = request.getParameter("searchYear")+"-"+request.getParameter("searchMonth")+"-01";
			String resvEdate = request.getParameter("searchYear")+"-"+request.getParameter("searchMonth")+"-31";
			model.addAttribute("searchSdate", resvSdate);
			model.addAttribute("searchEdate", resvEdate);
			vo.setSearchSdate(resvSdate);
			vo.setSearchEdate(resvEdate);
			System.out.println("searchSdate : " + resvSdate);
			System.out.println("searchEdate : " + resvEdate);
		} else {
			LocalDate l = LocalDate.now();
			String s = l.toString();
			String resvSdate = s.split("-")[0]+"-"+s.split("-")[1]+"-01";
			String resvEdate = s.split("-")[0]+"-"+s.split("-")[1]+"-31";
			model.addAttribute("searchSdate", resvSdate);
			model.addAttribute("searchEdate", resvEdate);
			//관리자페이지-년월 검색 사용안함.(:년,월 VO값 설정안함.)
		}

		int total = resvService.countAllResv(vo);
		pv = new PagingVO(total, Integer.parseInt(nowPage), cntPerPage);
		model.addAttribute("total", total);
		
		model.addAttribute("paging", pv);
		vo.setStart(pv.getStart());
		vo.setCntPerPage(cntPerPage);
		
		List<ResvVO> resvList = resvService.getadminResvList(vo);
		model.addAttribute("resvList", resvList);
		
		return "admin/adminResvList";
	}
	
	// 관리자 - 체험 예약 내역 <취소> 페이지
	@RequestMapping("/adminResvCancel.do")
	public String adminCancelResv(HttpSession session, HttpServletRequest request, ResvVO vo, Model model, PagingVO pv, @RequestParam(value = "page", required = false) String nowPage) {
		
		int cntPerPage = 10; //페이지당 10개 출력
		if (vo.getSearchKeyword() == null) {
			vo.setSearchKeyword("");
		}
		if (nowPage == null) {
			nowPage = "1";
		}
		if(vo.getCntPerPage() < 1) {
			vo.setCntPerPage(cntPerPage);
		}		
		
		String user_id = (String)session.getAttribute("user_id");
		
		model.addAttribute("resv_num", request.getParameter("num"));
		vo.setResv_num(request.getParameter("num"));
		resvService.cancelResv(vo);

		int total = resvService.countAllResv(vo);
		pv = new PagingVO(total, Integer.parseInt(nowPage), cntPerPage);
		model.addAttribute("total", total);
		
		model.addAttribute("paging", pv);
		vo.setStart(pv.getStart());
		vo.setCntPerPage(cntPerPage);
		
		List<ResvVO> resvList = resvService.getadminResvList(vo);
		model.addAttribute("resvList", resvList);
		
		return "admin/adminResvList";
	}
	
}

