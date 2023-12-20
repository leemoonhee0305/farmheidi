package com.spring.farm.product;

import java.sql.Date;
import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class ProductVO {
	private int pro_num;
	private String pro_name;
	private String pro_desc;
	private int pro_price;
	private int pro_stock;
	private String pro_file;
	private Date pro_date;
	private String stop;
	
	private MultipartFile uploadFile;
	
	private String searchKeyword;
	private int start;
	private int listcnt;
	
	private String search;
	private int[] idList;
	private String inUser;
	
	
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public Date getPro_date() {
		return pro_date;
	}
	public void setPro_date(Date pro_date) {
		this.pro_date = pro_date;
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
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public int getPro_num() {
		return pro_num;
	}
	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getPro_desc() {
		return pro_desc;
	}
	public void setPro_desc(String pro_desc) {
		this.pro_desc = pro_desc;
	}
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	public int getPro_stock() {
		return pro_stock;
	}
	public void setPro_stock(int pro_stock) {
		this.pro_stock = pro_stock;
	}
	public String getPro_file() {
		return pro_file;
	}
	public void setPro_file(String pro_file) {
		this.pro_file = pro_file;
	}
	public String getStop() {
		return stop;
	}
	public void setStop(String stop) {
		this.stop = stop;
	}
	public int[] getIdList() {
		return idList;
	}
	public void setIdList(int[] idList) {
		this.idList = idList;
	}
	public String getInUser() {
		return inUser;
	}
	public void setInUser(String inUser) {
		this.inUser = inUser;
	}
	@Override
	public String toString() {
		return "ProductVO [pro_num=" + pro_num + ", pro_name=" + pro_name + ", pro_desc=" + pro_desc + ", pro_price="
				+ pro_price + ", pro_stock=" + pro_stock + ", pro_file=" + pro_file + ", pro_date=" + pro_date
				+ ", stop=" + stop + ", uploadFile=" + uploadFile + ", searchKeyword=" + searchKeyword + ", start="
				+ start + ", listcnt=" + listcnt + ", search=" + search + ", idList=" + Arrays.toString(idList)
				+ ", inUser=" + inUser + "]";
	}

	
	
	

}
