package com.spring.farm.product.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.farm.product.OIFVO;

@Repository
public class OIFDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 주문_oif테이블
	public void orderIntoOIF(OIFVO vo) {
		mybatis.insert("OIFDAO.orderIntoOIF", vo);
	}

	// 주문정보 가져오기
	public OIFVO getOrderInfo(String oifId) {
		return mybatis.selectOne("OIFDAO.getOrderInfo", oifId);
	}
	
	// 주문정보 리스트 가져오기
	public List<OIFVO> getAllOrder(OIFVO vo){
		return mybatis.selectList("OIFDAO.getAllOrder", vo);
	}

	//총 주문목록 갯수 가져오기
	public int countOrderList() {
		return mybatis.selectOne("OIFDAO.countOrderList");
	}
	
	//총 주문액 합계 가져오기
	public Integer getOrderTotal() {
		return mybatis.selectOne("OIFDAO.getOrderTotal");
	}
	
	public int getOrderClearCount() {
		return mybatis.selectOne("OIFDAO.getOrderClearCount");
	}
	public int getShipPrepareCount() {
		return mybatis.selectOne("OIFDAO.getShipPrepareCount");
	}
	public int getShipIngCount() {
		return mybatis.selectOne("OIFDAO.getShipIngCount");
	}
	public int getShipClearCount() {
		return mybatis.selectOne("OIFDAO.getShipClearCount");
	}
	public int getCancelCount() {
		return mybatis.selectOne("OIFDAO.getCancelCount");
	}
	
	//배송상태 업데이트
	public int updateShipstate(OIFVO vo) {
		return mybatis.update("OIFDAO.updateShipstate", vo);
	}
	
	
	//수령자 정보 업데이트
	public void updateShipInfo(OIFVO vo) {
		mybatis.update("OIFDAO.updateShipInfo", vo);
	}
	
	//관리자메인페이지 11.16
	public List<OIFVO> adoifMain() {
		return mybatis.selectList("OIFDAO.adoifMain");
	}
	
	
}
