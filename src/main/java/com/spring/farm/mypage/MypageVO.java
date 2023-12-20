package com.spring.farm.mypage;

import java.sql.Date;

public class MypageVO {

	private String user_id;
	private int resv_num, resv_totalprice, resv_headcount, resv_pnum; 
	private Date resv_date;
	private String resv_name, resv_status, resv_userid;
	
	private String oif_id, oif_num, oif_total, oif_shipstate, oif_canstate;
	private Date oif_date;
	
	private int qna_num;
	private String qna_title, qna_id, qna_reply, qna_content;
	private Date qna_date;
	
	private String searchCondition;
	private String searchKeyword;
	
	private int start;
	private int cntPerPage, Listcnt;
	
	public String getSearchCondition() {
		return searchCondition;
	}
	public int getListcnt() {
		return Listcnt;
	}
	public void setListcnt(int listcnt) {
		Listcnt = listcnt;
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
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getResv_num() {
		return resv_num;
	}
	public void setResv_num(int resv_num) {
		this.resv_num = resv_num;
	}
	public Date getResv_date() {
		return resv_date;
	}
	public void setResv_date(Date resv_date) {
		this.resv_date = resv_date;
	}
	public int getResv_totalprice() {
		return resv_totalprice;
	}
	public void setResv_totalprice(int resv_totalprice) {
		this.resv_totalprice = resv_totalprice;
	}
	public int getResv_headcount() {
		return resv_headcount;
	}
	public void setResv_headcount(int resv_headcount) {
		this.resv_headcount = resv_headcount;
	}
	public String getResv_name() {
		return resv_name;
	}
	public void setResv_name(String resv_name) {
		this.resv_name = resv_name;
	}
	public int getResv_pnum() {
		return resv_pnum;
	}
	public void setResv_pnum(int resv_pnum) {
		this.resv_pnum = resv_pnum;
	}
	public String getResv_status() {
		return resv_status;
	}
	public void setResv_status(String resv_status) {
		this.resv_status = resv_status;
	}
		
	public String getResv_userid() {
		return resv_userid;
	}
	public void setResv_userid(String resv_userid) {
		this.resv_userid = resv_userid;
	}	
	public String getOif_id() {
		return oif_id;
	}
	public void setOif_id(String oif_id) {
		this.oif_id = oif_id;
	}
	public String getOif_num() {
		return oif_num;
	}
	public void setOif_num(String oif_num) {
		this.oif_num = oif_num;
	}
	public String getOif_total() {
		return oif_total;
	}
	public void setOif_total(String oif_total) {
		this.oif_total = oif_total;
	}
	public Date getOif_date() {
		return oif_date;
	}
	public void setOif_date(Date oif_date) {
		this.oif_date = oif_date;
	}
	public String getOif_shipstate() {
		return oif_shipstate;
	}
	public void setOif_shipstate(String oif_shipstate) {
		this.oif_shipstate = oif_shipstate;
	}
	public String getOif_canstate() {
		return oif_canstate;
	}
	public void setOif_canstate(String oif_canstate) {
		this.oif_canstate = oif_canstate;
	}
	
	
	
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
	public Date getQna_date() {
		return qna_date;
	}
	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}
	public String getQna_reply() {
		return qna_reply;
	}
	public void setQna_reply(String qna_reply) {
		this.qna_reply = qna_reply;
	}
	
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
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
	@Override
	public String toString() {
		return "MypageVO [oif_id=" + oif_id + ", oif_num=" + oif_num + ", oif_total=" + oif_total + ", oif_shipstate="
				+ oif_shipstate + ", oif_canstate=" + oif_canstate + ", oif_date=" + oif_date + "]";
	}
	
	
	
	
}
