package com.spring.farm.community;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class QNAVO {
	
	private int qna_num;
	private String qna_title;
	private String qna_id;
	private String qna_content;
	private Date qna_date;
	private boolean qna_secret;
	private String qna_password;
	private String qna_reply;
	private Date qna_replydate;
	private int qna_cnt;
	private String qna_filename;
	
	private String searchCondition;
	private String searchKeyword;
	
	private MultipartFile uploadFile;
	private int totalPage;
	
	private int start;
	private int listcnt;	
	

	public int getQna_num() {
		return qna_num;
	}
	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_id() {
		return qna_id;
	}
	public void setQna_id(String qna_id) {
		this.qna_id = qna_id;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public Date getQna_date() {
		return qna_date;
	}
	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}
	public boolean isQna_secret() {
		return qna_secret;
	}
	public void setQna_secret(boolean qna_secret) {
		this.qna_secret = qna_secret;
	}
	public String getQna_password() {
		return qna_password;
	}
	public void setQna_password(String qna_password) {
		this.qna_password = qna_password;
	}
	public String getQna_reply() {
		return qna_reply;
	}
	public void setQna_reply(String qna_reply) {
		this.qna_reply = qna_reply;
	}
	public Date getQna_replydate() {
		return qna_replydate;
	}
	public void setQna_replydate(Date qna_replydate) {
		this.qna_replydate = qna_replydate;
	}
	public int getQna_cnt() {
		return qna_cnt;
	}
	public void setQna_cnt(int qna_cnt) {
		this.qna_cnt = qna_cnt;
	}
	public String getQna_filename() {
		return qna_filename;
	}
	public void setQna_filename(String qna_filename) {
		this.qna_filename = qna_filename;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getListcnt() {
		return listcnt;
	}
	public void setListcnt(int listcnt) {
		this.listcnt = listcnt;
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
	@Override
	public String toString() {
		return "QNAVO [qna_num=" + qna_num + ", qna_title=" + qna_title + ", qna_id=" + qna_id + ", qna_content="
				+ qna_content + ", qna_date=" + qna_date + ", qna_secret=" + qna_secret + ", qna_password="
				+ qna_password + ", qna_reply=" + qna_reply + ", qna_replydate=" + qna_replydate + ", qna_cnt="
				+ qna_cnt + ", qna_filename=" + qna_filename + "]";
	}

	
	
	
	
	
	
}
