package com.spring.farm.product;

import java.sql.Date;
import java.util.Arrays;
import java.util.List;

public class CartVO {
	private int cart_num;
	private int pro_num;
	private int cart_amount;
	private int cart_totalp;
	private String user_id;
	private Date cart_date;
	
	private String pro_name;
	private int pro_price;
	private String pro_desc;
	private String pro_file;
	
	private int[] idList;
	private List<CartVO> cartVOList;
	
	private Date cart_cklimit;
	private String cart_ckid;
	
	
	
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	public Date getCart_cklimit() {
		return cart_cklimit;
	}
	public void setCart_cklimit(Date cart_cklimit) {
		this.cart_cklimit = cart_cklimit;
	}
	public String getCart_ckid() {
		return cart_ckid;
	}
	public void setCart_ckid(String cart_ckid) {
		this.cart_ckid = cart_ckid;
	}
	public List<CartVO> getCartVOList() {
		return cartVOList;
	}
	public void setCartVOList(List<CartVO> cartVOList) {
		this.cartVOList = cartVOList;
	}
	public int getCart_amount() {
		return cart_amount;
	}
	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
	}
	public int getCart_totalp() {
		return cart_totalp;
	}
	public void setCart_totalp(int cart_totalp) {
		this.cart_totalp = cart_totalp;
	}
	
	public int getCart_num() {
		return cart_num;
	}
	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
	}
	public Date getCart_date() {
		return cart_date;
	}
	public void setCart_date(Date cart_date) {
		this.cart_date = cart_date;
	}
	public int[] getIdList() {
		return idList;
	}
	public void setIdList(int[] idList) {
		this.idList = idList;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	public String getPro_file() {
		return pro_file;
	}
	public void setPro_file(String pro_file) {
		this.pro_file = pro_file;
	}
	public int getPro_num() {
		return pro_num;
	}
	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
	}
	@Override
	public String toString() {
		return "CartVO [cart_num=" + cart_num + ", pro_num=" + pro_num + ", cart_amount=" + cart_amount
				+ ", cart_totalp=" + cart_totalp + ", user_id=" + user_id + ", cart_date=" + cart_date + ", pro_name="
				+ pro_name + ", pro_desc=" + pro_desc + ", pro_file=" + pro_file + ", idList=" + Arrays.toString(idList)
				+ ", cartVOList=" + cartVOList + ", cart_cklimit=" + cart_cklimit + ", cart_ckid=" + cart_ckid + "]";
	}

	
	
}
