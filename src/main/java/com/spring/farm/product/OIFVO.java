package com.spring.farm.product;

import java.sql.Date;

public class OIFVO {
	
	private String oif_id;
    private String user_id;
    private String user_name;
    private String user_mail;
    private String user_mail01;
    private String user_mail02;
    private String user_phone;
    private String oif_ordtel;
    private String oif_ordaddr1;
    private String oif_ordaddr2;
    private String oif_ordaddr3;
    private String oif_shipname;
    private String oif_shipmail;
    private String oif_shipphone;
    private String oif_shiptel;
    private String oif_shipaddr1;
    private String oif_shipaddr2;
    private String oif_shipaddr3;
    private String oif_shipmemo;
    private String oif_ordtype;
    private Date oif_date;
    private int oif_kindamount;
    private int oif_shipfee;
    private int oif_total;
    
	private String oif_shipstate;
    private String oif_canstate;
    private Date oif_candate;
	
    private String reduceCart;
    
    private String cart_ckid;
    
	private int start;
	private int listcnt;
	
	private String searchCondition;
	private String searchKeyword;
	private String searchDate1;
	private String searchDate2;
	private String searchOrderType;
	private String searchOrderState;
	
	
	
    
    
	
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchDate1() {
		return searchDate1;
	}
	public void setSearchDate1(String searchDate1) {
		this.searchDate1 = searchDate1;
	}
	public String getSearchDate2() {
		return searchDate2;
	}
	public void setSearchDate2(String searchDate2) {
		this.searchDate2 = searchDate2;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getSearchOrderType() {
		return searchOrderType;
	}
	public void setSearchOrderType(String searchOrderType) {
		this.searchOrderType = searchOrderType;
	}
	public String getSearchOrderState() {
		return searchOrderState;
	}
	public void setSearchOrderState(String searchOrderState) {
		this.searchOrderState = searchOrderState;
	}
	public String getCart_ckid() {
		return cart_ckid;
	}
	public void setCart_ckid(String cart_ckid) {
		this.cart_ckid = cart_ckid;
	}
	
    public String getUser_mail01() {
		return user_mail01;
	}
	public void setUser_mail01(String user_mail01) {
		this.user_mail01 = user_mail01;
	}
	public String getUser_mail02() {
		return user_mail02;
	}
	public void setUser_mail02(String user_mail02) {
		this.user_mail02 = user_mail02;
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
	public int getOif_shipfee() {
		return oif_shipfee;
	}
	public void setOif_shipfee(int oif_shipfee) {
		this.oif_shipfee = oif_shipfee;
	}
	
    
	public String getReduceCart() {
		return reduceCart;
	}
	public void setReduceCart(String reduceCart) {
		this.reduceCart = reduceCart;
	}
	public String getOif_id() {
		return oif_id;
	}
	public void setOif_id(String oif_id) {
		this.oif_id = oif_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_mail() {
		return user_mail;
	}
	public void setUser_mail(String user_mail) {
		this.user_mail = user_mail;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getOif_ordtel() {
		return oif_ordtel;
	}
	public void setOif_ordtel(String oif_ordtel) {
		this.oif_ordtel = oif_ordtel;
	}
	public String getOif_ordaddr1() {
		return oif_ordaddr1;
	}
	public void setOif_ordaddr1(String oif_ordaddr1) {
		this.oif_ordaddr1 = oif_ordaddr1;
	}
	public String getOif_ordaddr2() {
		return oif_ordaddr2;
	}
	public void setOif_ordaddr2(String oif_ordaddr2) {
		this.oif_ordaddr2 = oif_ordaddr2;
	}
	public String getOif_ordaddr3() {
		return oif_ordaddr3;
	}
	public void setOif_ordaddr3(String oif_ordaddr3) {
		this.oif_ordaddr3 = oif_ordaddr3;
	}
	public String getOif_shipname() {
		return oif_shipname;
	}
	public void setOif_shipname(String oif_shipname) {
		this.oif_shipname = oif_shipname;
	}
	public String getOif_shipmail() {
		return oif_shipmail;
	}
	public void setOif_shipmail(String oif_shipmail) {
		this.oif_shipmail = oif_shipmail;
	}
	public String getOif_shipphone() {
		return oif_shipphone;
	}
	public void setOif_shipphone(String oif_shipphone) {
		this.oif_shipphone = oif_shipphone;
	}
	public String getOif_shiptel() {
		return oif_shiptel;
	}
	public void setOif_shiptel(String oif_shiptel) {
		this.oif_shiptel = oif_shiptel;
	}
	public String getOif_shipaddr1() {
		return oif_shipaddr1;
	}
	public void setOif_shipaddr1(String oif_shipaddr1) {
		this.oif_shipaddr1 = oif_shipaddr1;
	}
	public String getOif_shipaddr2() {
		return oif_shipaddr2;
	}
	public void setOif_shipaddr2(String oif_shipaddr2) {
		this.oif_shipaddr2 = oif_shipaddr2;
	}
	public String getOif_shipaddr3() {
		return oif_shipaddr3;
	}
	public void setOif_shipaddr3(String oif_shipaddr3) {
		this.oif_shipaddr3 = oif_shipaddr3;
	}
	public String getOif_shipmemo() {
		return oif_shipmemo;
	}
	public void setOif_shipmemo(String oif_shipmemo) {
		this.oif_shipmemo = oif_shipmemo;
	}
	public String getOif_ordtype() {
		return oif_ordtype;
	}
	public void setOif_ordtype(String oif_ordtype) {
		this.oif_ordtype = oif_ordtype;
	}
	public Date getOif_date() {
		return oif_date;
	}
	public void setOif_date(Date oif_date) {
		this.oif_date = oif_date;
	}
	public int getOif_kindamount() {
		return oif_kindamount;
	}
	public void setOif_kindamount(int oif_kindamount) {
		this.oif_kindamount = oif_kindamount;
	}
	public int getOif_total() {
		return oif_total;
	}
	public void setOif_total(int oif_total) {
		this.oif_total = oif_total;
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
	public Date getOif_candate() {
		return oif_candate;
	}
	public void setOif_candate(Date oif_candate) {
		this.oif_candate = oif_candate;
	}
	@Override
	public String toString() {
		return "OIFVO [oif_id=" + oif_id + ", user_id=" + user_id + ", user_name=" + user_name + ", user_mail="
				+ user_mail + ", user_mail01=" + user_mail01 + ", user_mail02=" + user_mail02 + ", user_phone="
				+ user_phone + ", oif_ordtel=" + oif_ordtel + ", oif_ordaddr1=" + oif_ordaddr1 + ", oif_ordaddr2="
				+ oif_ordaddr2 + ", oif_ordaddr3=" + oif_ordaddr3 + ", oif_shipname=" + oif_shipname + ", oif_shipmail="
				+ oif_shipmail + ", oif_shipphone=" + oif_shipphone + ", oif_shiptel=" + oif_shiptel
				+ ", oif_shipaddr1=" + oif_shipaddr1 + ", oif_shipaddr2=" + oif_shipaddr2 + ", oif_shipaddr3="
				+ oif_shipaddr3 + ", oif_shipmemo=" + oif_shipmemo + ", oif_ordtype=" + oif_ordtype + ", oif_date="
				+ oif_date + ", oif_kindamount=" + oif_kindamount + ", oif_shipfee=" + oif_shipfee + ", oif_total="
				+ oif_total + ", oif_shipstate=" + oif_shipstate + ", oif_canstate=" + oif_canstate + ", oif_candate="
				+ oif_candate + ", reduceCart=" + reduceCart + ", cart_ckid=" + cart_ckid + ", start=" + start
				+ ", listcnt=" + listcnt + ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword
				+ ", searchDate1=" + searchDate1 + ", searchDate2=" + searchDate2 + ", searchOrderType="
				+ searchOrderType + ", searchOrderState=" + searchOrderState + "]";
	}
	
	
	
	
	
	
    
}
