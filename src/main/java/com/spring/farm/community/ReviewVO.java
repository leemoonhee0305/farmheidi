package com.spring.farm.community;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class ReviewVO {
	
	private int review_num;
	private String review_title;
	private String review_id;
	private String review_content;
	private Date review_date;
	private boolean review_secret;
	private String review_password;
	private String review_reply;
	private Date review_replydate;
	private String review_filename;
	private int review_cnt;
	
	private String searchCondition;
	private String searchKeyword;

	// 파일 업로드 관련
	private MultipartFile uploadFile;
	private String filename;
	
	private int start;
	private int listcnt;
	

	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_id() {
		return review_id;
	}
	public void setReview_id(String review_id) {
		this.review_id = review_id;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public boolean isReview_secret() {
		return review_secret;
	}
	public void setReview_secret(boolean review_secret) {
		this.review_secret = review_secret;
	}
	public String getReview_password() {
		return review_password;
	}
	public void setReview_password(String review_password) {
		this.review_password = review_password;
	}
	public String getReview_reply() {
		return review_reply;
	}
	public void setReview_reply(String review_reply) {
		this.review_reply = review_reply;
	}
	public Date getReview_replydate() {
		return review_replydate;
	}
	public void setReview_replydate(Date review_replydate) {
		this.review_replydate = review_replydate;
	}
	public String getReview_filename() {
		return review_filename;
	}
	public void setReview_filename(String review_filename) {
		this.review_filename = review_filename;
	}
	public int getReview_cnt() {
		return review_cnt;
	}
	public void setReview_cnt(int review_cnt) {
		this.review_cnt = review_cnt;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
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
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
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
		return "ReviewVO [review_num=" + review_num + ", review_title=" + review_title + ", review_id=" + review_id
				+ ", review_content=" + review_content + ", review_date=" + review_date + ", review_secret="
				+ review_secret + ", review_password=" + review_password + ", review_reply=" + review_reply
				+ ", review_replydate=" + review_replydate + ", review_filename=" + review_filename + ", review_cnt="
				+ review_cnt + "]";
	}
	
	
	
	
	
	
	

	
	
}
