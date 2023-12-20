package com.spring.farm.controller;

import javax.servlet.http.HttpSession;

import java.util.*;


import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.farm.product.CartService;
import com.spring.farm.user.EncryptService;
import com.spring.farm.user.UserService;
import com.spring.farm.user.UserVO;
import com.spring.farm.util.MailHandler;

import net.nurigo.java_sdk.exceptions.CoolsmsException;


@Controller

@SessionAttributes("user")
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private CartService cartService;
	
	@Autowired
	private EncryptService encServ;

//	회원가입 메소드
	@RequestMapping(value = "/logUser.do", method = RequestMethod.POST)
	public String insertUser(UserVO vo, Model model) throws Exception {
		model.addAttribute("result", 1);
		int result = userService.idChk(vo);
		try {
			if (result == 1) {
				return "user/joinForm";
			} else if (result == 0) {
				userService.logUser(vo);
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		userService.insertUser(vo);
		return "user/login";
	}

// 회원 가입 페이지 들어가기
	@RequestMapping(value = "/joinForm.do")
	public String logUser(UserVO vo) {
		userService.logUser(vo);
		return "user/joinForm";
	}

//  로그인 메소드
  @RequestMapping(value = "/login.do", method = RequestMethod.POST)
  public String login(UserVO vo, HttpSession session, Model model) {
     System.out.println("입력한 아이디 : " + vo.getUser_id() + "입력한 비번 : " + vo.getUser_pw());
     
     //일주일 전 장바구니 수량가져오기 
     int cnt= cartService.cntWeekCart();
     //장바구니 수량 있는경우만 삭제하도록 
     if(cnt>0) { cartService.delWeekCart(); }            
           
     UserVO uvo = userService.myinfoUser(vo);
     String inputPassword = uvo != null ? uvo.getUser_pw() : null;

     UserVO loginUser = userService.logUser(vo);
     System.out.println("user : " + loginUser);
     
     if (loginUser != null) {
        if (encServ.isMatch(vo.getUser_pw(), inputPassword)) {
           
           if(loginUser.getUser_exit() != null){
              System.out.println("getUser_exit not null: ");
              model.addAttribute("exitUmsg", 1);
              return "user/login";   
           }else {
              System.out.println("getUser_exit null: ");
              
              session.setAttribute("user_id", loginUser.getUser_id());
              session.setAttribute("user_name", loginUser.getUser_name());
//              model.addAttribute("user_name", vo.getUser_name());
              System.out.println("확인용 :: "+vo);
              
              if(loginUser.getUser_id().equals("farmadmin")) {
                 System.out.println("its admin : ");
              }                        
              return "redirect:/main.jsp";
           }
           
        } else {
           System.out.println("id x pw불일치 ");
           model.addAttribute("error", 1);
           return "user/login";
        }

     } else {
        System.out.println("not user: ");
        model.addAttribute("error", 1);
        return "user/login";
     }
  }

	// 로그 아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main.jsp";
	}

	// 내 정보 보기
	@RequestMapping(value = "/mypage.do")
	public String myinfoUser(UserVO vo, Model model) {
		System.out.println("내 정보 보기 페이지");
		model.addAttribute("user", userService.myinfoUser(vo));
		return "user/mypage";
	}

	// 회원정보 수정 메소드
	@RequestMapping(value = "/updateUser.do")
	public String updateUser(@ModelAttribute("user") UserVO vo, HttpSession session) {
		userService.updateUser(vo);
		System.out.println("id값: " + vo.getUser_id());
		System.out.println("회원정보변경 실행");
		return "user/mypage";
	}
	
	// 회원정보 비번 변경 페이지 접근
	@RequestMapping(value = "/updatePw.do")
	public String updatePw() {
		return "user/updatePw";
	}

	// 회원정보 암호화 비번 변경 메소드
	@RequestMapping(value = "/updateUserpw.do")
	public String updateUserpw(@RequestParam String user_id, @RequestParam String upPw, HttpSession session) {
		String hashedPw = BCrypt.hashpw(upPw, BCrypt.gensalt());
		userService.updateUserpw(user_id, hashedPw);
		System.out.println("비번 변경 완료 ");
		return "user/mypage";
	}

	// 회원정보 비번 유효성 체크
	@RequestMapping(value = "/checkPw.do")
	@ResponseBody
	public int checkPw(UserVO vo) {
		String user_pw = userService.checkPw(vo);
		if (vo == null || !BCrypt.checkpw(vo.getUser_pw(), user_pw));
		{ return 0;	}
	}

//	 회원 탈퇴 메소드 
	@RequestMapping(value = "/exitUser.do")
	public String exitUser(UserVO vo, HttpSession session) {
		userService.exitUser(vo);
		session.invalidate();
		System.out.println("회원탈퇴 up완료");
		return "redirect:/main.jsp";
	}
	

	@GetMapping(value = "/login.do")
	public String logView(UserVO vo) {
		vo.setUser_id("farmadmin");
		vo.setUser_pw("admin1025");
		return "user/login";
	}

	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/idChk.do", method = RequestMethod.POST)
	public int idChk(UserVO vo) throws Exception {
		System.out.println("컨트롤러입니다: " + vo.getUser_id());
		int result = userService.idChk(vo);
		return result;
	}

	@RequestMapping(value = "/findIdView", method = RequestMethod.GET)
	public String findIdView() throws Exception {
		return "user/findIdView";
	}
	
	@RequestMapping(value="/idmailSend")
	public String idmailsend(UserVO vo, Model model, HttpSession session) throws Exception {
		model.addAttribute("user_mail", vo.getUser_mail());
		userService.findIdCheck(vo);
		System.out.println("메일 전송 성공 con");
		userService.mailkeyUp(vo);
		System.out.println("메일키 update 데이터: " + vo);
		System.out.println("메일 키 update 성공");
		
		int cnt = userService.keyChk(vo);
		System.out.println("업뎃 체크 : "+cnt);
		if (cnt != 0) {
			 session.setAttribute("mail_key", vo.getMail_key());
		 }
		return "user/idmailsend";
	}

	@RequestMapping(value = "/findId")
	public String findIdmail(UserVO vo, Model model, HttpSession session) {
		model.addAttribute("mail_key", vo.getMail_key());		
		
		UserVO fvo = userService.findId(vo); 
		session.setAttribute("user_id", fvo.getUser_id());
		System.out.println(fvo.getUser_id());
		return "user/findId";
	}

	// 비밀번호 찾기 
	@RequestMapping(value ="/findPwView")
	public String findPwView() throws Exception {
		return "user/findPwView";
	}
	
	@RequestMapping(value="/pwmailSend")
	public String pwmailsend(UserVO vo, Model model, HttpSession session) throws Exception {
		model.addAttribute("user_mail", vo.getUser_mail());
		userService.findPwChk(vo);
		System.out.println("비번 메일 전송 성공 con");
		userService.findPwRan(vo);
		System.out.println("비번 update 데이터: " + vo);
		System.out.println("비번 update 성공");		
				
		return "user/findPw";
	}


	// coolSMS 테스트 화면
	@GetMapping("/sms")
	public String mySms() {
		return "order/sms";
		}
		    
	// coolSMS 구현 로직 연결  
	@GetMapping("/check/sendSMS.do")
	public @ResponseBody String sendSMS(@RequestParam(value="user_phone") String to) throws CoolsmsException {  	
		return userService.PhoneNumberCheck(to);
	}	
	
	
	// 회원정보 수정 메소드(관리자영역) -월요일에 작업할 것
//	@RequestMapping(value = "/adminUserUpdate.do")
//	public String adminUserUpdate(@ModelAttribute("user") UserVO vo) {
//		userService.updateUser(vo);
//		System.out.println("회원정보변경 실행");
//		return "redirect:adminUserInfo.do";
//	}
	

	
	
}
