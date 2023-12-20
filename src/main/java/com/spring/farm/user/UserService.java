package com.spring.farm.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.nurigo.java_sdk.exceptions.CoolsmsException;

public interface UserService {

	UserVO logUser(UserVO vo);
	int insertUser(UserVO vo);
	void updateUser(UserVO vo);
	void updateUserpw(String user_id, String hashedPassword);
	void exitUser(UserVO vo);

	int idChk(UserVO vo) throws Exception;
	String checkPw(UserVO vo);
	
	UserVO myinfoUser(UserVO vo);
	
	String PhoneNumberCheck(String to)throws CoolsmsException;
	
	UserVO findIdCheck(UserVO vo) throws Exception;
	void mailkeyUp(UserVO vo);
	int keyChk(UserVO vo);
	UserVO findId(UserVO vo);	
	
	UserVO findPwChk(UserVO vo) throws Exception; 
	public void findPwRan(UserVO vo);
	UserVO findPw(UserVO vo);
	
	void navJoin(Map<String, String> userInfo);
	void kaoJoin(Map<String, Object> userkInfo);
	
}
