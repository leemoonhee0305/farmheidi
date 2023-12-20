package com.spring.farm.product.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.farm.product.OPDVO;

@Repository
public class OPDDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 주문_opd테이블
	public void orderIntoOPD(OPDVO vo) {
		mybatis.insert("OPDDAO.orderIntoOPD", vo);
	}

	// 주문_opd테이블
	public List<OPDVO> orderWhat(String oif_id) {
		return mybatis.selectList("OPDDAO.orderWhat", oif_id);
	}
	
	// 주문 정보 디테일
	public List<OPDVO> orderDetail(OPDVO vo) {
		return mybatis.selectList("OPDDAO.orderDetail", vo);
	}
}
