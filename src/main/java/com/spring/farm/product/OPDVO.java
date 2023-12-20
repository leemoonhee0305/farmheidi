package com.spring.farm.product;

public class OPDVO {
	private int opd_num;
    private String oif_id;
    private int pro_num;
    private int cart_amount;
    private int cart_totalp;
    private String user_id;
    private String cart_ckid;
    
    private String pro_name;
    private int pro_price;
    private String pro_file;
    
    
    
    
	public String getCart_ckid() {
		return cart_ckid;
	}
	public void setCart_ckid(String cart_ckid) {
		this.cart_ckid = cart_ckid;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	public String getPro_file() {
		return pro_file;
	}
	public void setPro_file(String pro_file) {
		this.pro_file = pro_file;
	}
	public int getOpd_num() {
		return opd_num;
	}
	public void setOpd_num(int opd_num) {
		this.opd_num = opd_num;
	}

	public String getOif_id() {
		return oif_id;
	}
	public void setOif_id(String oif_id) {
		this.oif_id = oif_id;
	}
	public int getPro_num() {
		return pro_num;
	}
	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
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
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	@Override
	public String toString() {
		return "OPDVO [opd_num=" + opd_num + ", oif_id=" + oif_id + ", pro_num=" + pro_num + ", cart_amount="
				+ cart_amount + ", cart_totalp=" + cart_totalp + ", user_id=" + user_id + ", cart_ckid=" + cart_ckid
				+ ", pro_name=" + pro_name + ", pro_price=" + pro_price + ", pro_file=" + pro_file + "]";
	}

	
    
}
