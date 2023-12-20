package com.spring.farm.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {

		@Autowired
		private SqlSessionTemplate usermybatis;
		@Autowired
		private EncryptServiceImpl encServImpl;
		
		// 로그인
		public UserVO logUser(UserVO vo) {
			return (UserVO) usermybatis.selectOne("UserDAO.logUser", vo);
		}
		
		// 회원가입
		public int insertUser(UserVO vo) {
			System.out.println("회원가입다오 + 비번암호화");
			String encPw = encServImpl.encrypt(vo.getUser_pw()); 
			System.out.println("회원가입 dao : "+ encPw);
			vo.setUser_pw(encPw);
			return usermybatis.insert("UserDAO.insertUser", vo);
	      }		
		
		// 내 정보 수정 
		public void updateUser(UserVO vo) {
			usermybatis.update("UserDAO.updateUser", vo);
			System.out.println("회원정보 수정 dao 실행 ");
			System.out.println("업뎃확인 : "+ vo.toString());
		}
		
		// 내 정보 수정 비밀번호(암호화)
		public void updateUserpw(String user_id, String hashedPassword) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("user_id", user_id);
			map.put("hashedPassword", hashedPassword);
			usermybatis.update("UserDAO.updateUserpw", map);
			System.out.println("회원정보 비번 수정 dao");
		}
		
		// 내 정보 수정 비번 유효성 체크 
		public String checkPw(UserVO vo) {
			return usermybatis.selectOne("UserDAO.checkPw", vo);
		}
		
		// 회원 탈퇴 
		public void exitUser(UserVO vo) {
			usermybatis.update("UserDAO.exitUser", vo);
		}
		
		// 마이페이지 내정보 조회
		public UserVO myinfoUser(UserVO vo) { 
			System.out.println("myinfoUser dao 실행 ");
			return usermybatis.selectOne("UserDAO.myinfoUser", vo);
			
		}	
		
		//아이디 체크
		public int idChk(UserVO vo) throws Exception{
			int result = usermybatis.selectOne("UserDAO.idChk", vo);
			return result;
		}
		
		// 아이디찾기
		public UserVO findIdCheck(UserVO vo) throws Exception {
			return usermybatis.selectOne("UserDAO.findIdCheck", vo);
		}
		
		public void mailkeyUp(UserVO vo) {
			System.out.println("메일키업뎃 "+vo);
			System.out.println("mail_key : "+vo.getMail_key());
			usermybatis.update("UserDAO.mailkeyUp", vo);
		}
		
		public int keyChk(UserVO vo) {
			int cnt = usermybatis.selectOne("UserDAO.keyChk", vo);
			return cnt;
		}
		
		public UserVO findId(UserVO vo){
			return usermybatis.selectOne("UserDAO.findId", vo);
		}		
				
		// 비번 찾기 
		public UserVO findPwChk(UserVO vo) throws Exception {
			return usermybatis.selectOne("UserDAO.findPwChk", vo);
		}
		
		public void findPwRan(UserVO vo) {
			System.out.println("비번 업뎃 : "+vo);
			System.out.println("임시비번 : "+vo.getUser_pw());
			usermybatis.update("UserDAO.findPwRan", vo);
		}
		
		public UserVO findPw(UserVO vo) {
			return usermybatis.selectOne("UserDAO.findPw", vo);
		}
	
		
		// 네이버로 가입
		public void navJoin(Map<String, String> userInfo) {
			usermybatis.insert("UserDAO.navJoin", userInfo);
		}
		
		// 카카오로 가입
		public void kaoJoin(Map<String, Object> userkInfo) {
			usermybatis.insert("UserDAO.kaoJoin", userkInfo);
		}
				
}

