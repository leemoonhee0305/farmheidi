package com.spring.farm.play;

import org.springframework.web.multipart.MultipartFile;

public class PlayListVO {
	//체험상품코득번호
	private int pla_num;
	//체험상품이름
	private String pla_name;
	//체험상품 내용
	private String pla_content;
	//체험 상품 이미지
	private String pla_img;
	//체험 상품 가격(패키지 처리)
	private int pla_price;
	
	

	public int getPla_num() {
		return pla_num;
	}

	public void setPla_num(int pla_num) {
		this.pla_num = pla_num;
	}

	public String getPla_name() {
		return pla_name;
	}

	public void setPla_name(String pla_name) {
		this.pla_name = pla_name;
	}

	public String getPla_content() {
		return pla_content;
	}

	public void setPla_content(String pla_content) {
		this.pla_content = pla_content;
	}

	public String getPla_img() {
		return pla_img;
	}
	
	public void setPla_img(String pla_img) {
		this.pla_img = pla_img;
	}

	public int getPla_price() {
		return pla_price;
	}

	public void setPla_price(int pla_price) {
		this.pla_price = pla_price;
	}

	@Override
	public String toString() {
		return "PlayListVO [pla_num=" + pla_num + ", pla_name=" + pla_name + ", pla_content=" + pla_content
				+ ", pla_img=" + pla_img + ", pla_price=" + pla_price + "]";
	}
	
	

}
