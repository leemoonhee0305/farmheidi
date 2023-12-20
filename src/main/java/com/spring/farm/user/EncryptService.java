package com.spring.farm.user;

public interface EncryptService {
	
	String encrypt (String user_pw);
	boolean isMatch(String user_pw, String hashed);
}
