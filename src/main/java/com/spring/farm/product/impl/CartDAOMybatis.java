package com.spring.farm.product.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.farm.product.CartVO;

@Repository
public class CartDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 장바구니에 이미 있는 상품인지 확인
	public int countCart(CartVO vo) {
		return mybatis.selectOne("CartDAO.countCart", vo);
	}

	// 장바구니 넣기
	public void cartOneInsert(CartVO vo) {
		mybatis.insert("CartDAO.cartOneInsert", vo);
	}

	public void cartUpdate(CartVO vo) {
		mybatis.update("CartDAO.cartUpdate", vo);
	}

	public List<CartVO> inMyCartList(CartVO vo) {
		return mybatis.selectList("CartDAO.inMyCart", vo);
	}

	// 전체삭제
	public void delCart(CartVO vo) {
		mybatis.delete("CartDAO.delCart", vo);
	}

	// 선택 삭제
	public void delSelCart(CartVO vo) {
			mybatis.delete("CartDAO.delSelCart", vo);
	}

	public CartVO selBuy(CartVO vo) {
		return mybatis.selectOne("CartDAO.selBuy", vo);
	}
	
	// 일주일전 장바구니 데이터 제거 
	public int delWeekCart() {
		return mybatis.delete("CartDAO.delWeekCart");
	}
		
	// 일주일전 장바구니 데이터갯수 확인하기
	public int cntWeekCart() {
		return mybatis.selectOne("CartDAO.cntWeekCart");
	}
	
	public void fromCookieToUser(CartVO vo) {
		mybatis.update("CartDAO.fromCookieToUser", vo);
	}
	
	public void cartDoubleDelete(CartVO vo) {
		mybatis.update("CartDAO.cartDoubleDelete", vo);
	}
	public void cartDoubleDeleteT(CartVO vo) {
		mybatis.update("CartDAO.cartDoubleDeleteT", vo);
	}
	
	// 쿠키회원 카트내 상품번호 불러오기
	public List<CartVO> inCookieCart(CartVO vo) {
		return mybatis.selectList("CartDAO.inCookieCart", vo);
	}
}
