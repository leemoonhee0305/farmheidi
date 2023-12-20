package com.spring.farm.user;

import org.mindrot.jbcrypt.BCrypt;

public class UserVO {

	private int user_num, mail_auth;
	private String user_id, user_pw, user_name, user_phone, user_mail, join_date, user_exit, mail_key;
	
	private String searchCondition, searchKeyword;
	private int start, cntPerPage;

	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_mail() {
		return user_mail;
	}
	public void setUser_mail(String user_mail) {
		this.user_mail = user_mail;
	}
	public String getJoin_date() {
		return join_date;
	}
	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}
	public String getUser_exit() {
		return user_exit;
	}
	public void setUser_exit(String user_exit) {
		this.user_exit = user_exit;
	}
	
	
	public int getMail_auth() {
		return mail_auth;
	}
	public void setMail_auth(int mail_auth) {
		this.mail_auth = mail_auth;
	}
	public String getMail_key() {
		return mail_key;
	}
	public void setMail_key(String mail_key) {
		this.mail_key = mail_key;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	
	
	public int getCntPerPage() {
		return cntPerPage;
	}
	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}
	
		
	private String hashPassword(String user_pw) {
		return BCrypt.hashpw(user_pw, BCrypt.gensalt());
	}
	
	private void checkPass(String user_pw, String hashedPassword) {
		if(BCrypt.checkpw(user_pw, hashedPassword)) {
			System.out.println("pw암호화 chk");
		}
	}
	@Override
	public String toString() {
		return "UserVO [user_num=" + user_num + ", mail_auth=" + mail_auth + ", user_id=" + user_id + ", user_pw="
				+ user_pw + ", user_name=" + user_name + ", user_phone=" + user_phone + ", user_mail=" + user_mail
				+ ", join_date=" + join_date + ", user_exit=" + user_exit + ", mail_key=" + mail_key + "]";
	}		
	
	
}
