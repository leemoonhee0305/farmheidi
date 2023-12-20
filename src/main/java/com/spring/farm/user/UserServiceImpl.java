package com.spring.farm.user;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.farm.util.MailHandler;
import com.spring.farm.util.TempKey;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	MailHandler sendMail;  
//	
//	@Autowired 
//	private MailHandler mailSender;

	@Override // 로그인
	public UserVO logUser(UserVO vo) {
		return userDAO.logUser(vo);
	}

	@Override // 회원 가입
	public int insertUser(UserVO vo) {
		System.out.println("회원가입 서비스");
		return userDAO.insertUser(vo);
	}

	@Override // 회원 정보 수정
	public void updateUser(UserVO vo) {
		System.out.println("회원정보수정 서비스");
		userDAO.updateUser(vo);
	}

	@Override // 회원 비번 수정
	public void updateUserpw(String user_id, String hashedPassword) {
		userDAO.updateUserpw(user_id, hashedPassword);
	}

	@Override // 비번 변경 유효화
	public String checkPw(UserVO vo) {
		return userDAO.checkPw(vo);
	}

	@Override // 회원 탈퇴 처리
	public void exitUser(UserVO vo) {
		userDAO.exitUser(vo);
	}

	@Override // 내 정보 보기 (마이페이지)
	public UserVO myinfoUser(UserVO vo) {
		System.out.println("내정보 보기 서비스 임플");
		return userDAO.myinfoUser(vo);
	}

	@Override // 아이디 중복 유효화
	public int idChk(UserVO vo) throws Exception {
		int result = userDAO.idChk(vo);
		return result;
	}

	@Override // 아이디 찾기 메일전송
	public UserVO findIdCheck(UserVO vo) throws Exception {
		String mail_key = new TempKey().getKey(6, false); // 랜덤키 길이 설정
		vo.setMail_key(mail_key);
		
		sendMail.setSubject("아이디 찾기");
		sendMail.setText("인증번호 "+mail_key);
		sendMail.setFrom("1025farm1124@gmail.com");
		sendMail.setTo(vo.getUser_mail());
		
		sendMail.send();
		System.out.println("발송체크");
		return userDAO.findIdCheck(vo);
	}
	
	@Override
	public void mailkeyUp(UserVO vo) {
			userDAO.mailkeyUp(vo);	
	}

	@Override
	public int keyChk(UserVO vo) {
		return userDAO.keyChk(vo);
	}

//	@Override // 아이디 찾기
	public UserVO findId(UserVO vo) {		
		return userDAO.findId(vo);
	}

	@Override
	public UserVO findPwChk(UserVO vo) throws Exception {
		String userKey = new TempKey().getKey(6,false);
		String up_pw = BCrypt.hashpw(userKey, BCrypt.gensalt());
		vo.setUser_pw(up_pw);
		
		sendMail.setSubject("비밀번호 찾기");
		sendMail.setText("임시 비밀번호 :: <h2>"+userKey+"</h2>"+"<br />로그인 후 비밀번호 변경을 해주세요.");
		sendMail.setFrom("1025farm1124@gmail.com");
		sendMail.setTo(vo.getUser_mail());
		
		sendMail.send();
		System.out.println("비번발송체크");
		return userDAO.findPwChk(vo);
	}

	@Override
	public void findPwRan(UserVO vo) {
		userDAO.findPwRan(vo);
	}
	
	@Override
	public UserVO findPw(UserVO vo) {
		return userDAO.findPw(vo);
	}

	@Override // 핸드폰 인증
	public String PhoneNumberCheck(String to) throws CoolsmsException {
		String api_key = "NCSCCIAFJJGMDJUQ";
		String api_secret = "TTHRZ6BXC7PVECLRGTP8AODKVA5MZAMA";
		Message coolsms = new Message(api_key, api_secret);
		System.out.println("폰인증 서비스 임플");
////		랜덤 인증번호
		Random rand = new Random();
		String numStr = "";
		for (int i = 0; i < 4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
			System.out.println("numStr: " + numStr);
		}

		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", to); // 수신전화번호 (ajax로 view 화면에서 받아온 값으로 넘김)
		params.put("from", "01027432630"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		params.put("type", "sms");
		params.put("text", "인증번호는 [" + numStr + "] 입니다.");
		params.put("app_version", "test app 1.2"); // application name and version

		coolsms.send(params); // 메시지 전송

		return numStr;

	}

	@Override // 네이버 api로 가입처리: NavKaoController에 있음
	public void navJoin(Map<String, String> userInfo) {
		userDAO.navJoin(userInfo);
	}

	@Override // 카카오 api로 가입처리: NavKaoController에 있음
	public void kaoJoin(Map<String, Object> userkInfo) {
		userDAO.kaoJoin(userkInfo);
	}




}
