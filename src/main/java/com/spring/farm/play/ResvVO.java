package com.spring.farm.play;

import java.sql.Date;

public class ResvVO {

   private String resv_num; //예약완료번호
   private Date resv_date; //예약한날짜
   private int resv_totalprice; //인원수 * 가격
   private int resv_headcount; //예약한 인원수(성인)
   private int resv_youthheadcount; //예약한 인원수(청소년)
   private String resv_name; //예약자이름 (usertable 에서 나중에 끌고올것!)
   private int resv_pnum;  //체험상품코드번호
   private String resv_status; //취소여부(y:예약, n:취소)
   private String resv_userId; //예약자아이디 (usertable 에서 나중에 끌고올것!)
   private String resv_req;
   private String resv_compay;
   private String resv_tel;
   private String resv_sptel;

   private int searchYear; //검색연도
   private int searchMonth; //검색월
   private String searchSdate; //검색 시작일
   private String searchEdate; //검색 종료일

	private String searchKeyword; //검색어
	private int start; //select limit 시작인덱스
	private int cntPerPage; //페이지당 뷰수
	
	public String getResv_num() {
		return resv_num;
	}
	public void setResv_num(String resv_num) {
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
	public int getResv_youthheadcount() {
		return resv_youthheadcount;
	}
	public void setResv_youthheadcount(int resv_youthheadcount) {
		this.resv_youthheadcount = resv_youthheadcount;
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
	public String getResv_userId() {
		return resv_userId;
	}
	public void setResv_userId(String resv_userId) {
		this.resv_userId = resv_userId;
	}
	public String getResv_req() {
		return resv_req;
	}
	public void setResv_req(String resv_req) {
		this.resv_req = resv_req;
	}
	public String getResv_compay() {
		return resv_compay;
	}
	public void setResv_compay(String resv_compay) {
		this.resv_compay = resv_compay;
	}
	public String getResv_tel() {
		return resv_tel;
	}
	public void setResv_tel(String resv_tel) {
		this.resv_tel = resv_tel;
	}
	public String getResv_sptel() {
		return resv_sptel;
	}
	public void setResv_sptel(String resv_sptel) {
		this.resv_sptel = resv_sptel;
	}
	public int getSearchYear() {
		return searchYear;
	}
	public void setSearchYear(int searchYear) {
		this.searchYear = searchYear;
	}
	public int getSearchMonth() {
		return searchMonth;
	}
	public void setSearchMonth(int searchMonth) {
		this.searchMonth = searchMonth;
	}
	public String getSearchSdate() {
		return searchSdate;
	}
	public void setSearchSdate(String searchSdate) {
		this.searchSdate = searchSdate;
	}
	public String getSearchEdate() {
		return searchEdate;
	}
	public void setSearchEdate(String searchEdate) {
		this.searchEdate = searchEdate;
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
	
	@Override
	public String toString() {
		return "ResvVO [resv_num=" + resv_num + ", resv_date=" + resv_date + ", resv_totalprice=" + resv_totalprice
				+ ", resv_headcount=" + resv_headcount + ", resv_youthheadcount=" + resv_youthheadcount + ", resv_name="
				+ resv_name + ", resv_pnum=" + resv_pnum + ", resv_status=" + resv_status + ", resv_userId="
				+ resv_userId + ", resv_req=" + resv_req + ", resv_compay=" + resv_compay + ", resv_tel=" + resv_tel
				+ ", resv_sptel=" + resv_sptel + ", searchYear=" + searchYear + ", searchMonth=" + searchMonth
				+ ", searchSdate=" + searchSdate + ", searchEdate=" + searchEdate + ", searchKeyword=" + searchKeyword
				+ ", start=" + start + ", cntPerPage=" + cntPerPage + "]";
	}

   
}
