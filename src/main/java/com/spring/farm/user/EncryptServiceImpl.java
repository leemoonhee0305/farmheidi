package com.spring.farm.user;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Component;

@Component
public class EncryptServiceImpl implements EncryptService {
	
	@Override
	public String encrypt(String user_pw) {
		return BCrypt.hashpw(user_pw, BCrypt.gensalt());
	}	
	@Override
	public boolean isMatch(String user_pw, String hashed) {
		return BCrypt.checkpw(user_pw, hashed);
	}

}
