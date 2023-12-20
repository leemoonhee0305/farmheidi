package com.spring.farm.product.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.farm.product.CartService;
import com.spring.farm.product.CartVO;

@Service("cartService")
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDAOMybatis cartDAO;

	@Override
	public int countCart(CartVO vo) {
		return cartDAO.countCart(vo);
	}

	@Override
	public void cartOneInsert(CartVO vo) {
		cartDAO.cartOneInsert(vo);
	}

	@Override
	public void cartUpdate(CartVO vo) {
		cartDAO.cartUpdate(vo);
	}

	@Override
	public List<CartVO> inMyCartList(CartVO vo) {
		return cartDAO.inMyCartList(vo);
	}

	@Override
	public void delCart(CartVO vo) {
		cartDAO.delCart(vo);
	}

	@Override
	public void delSelCart(CartVO vo) {
		cartDAO.delSelCart(vo);
	}

	@Override
	public CartVO selBuy(CartVO vo) {
		return cartDAO.selBuy(vo);
	}

	@Override
	public void delWeekCart() {
		cartDAO.delWeekCart();
	}

	@Override
	public int cntWeekCart() {
		return cartDAO.cntWeekCart();
	}

	@Override
	public void fromCookieToUser(CartVO vo) {
		cartDAO.fromCookieToUser(vo);
	}
	
	@Override
	public void cartDoubleDelete(CartVO vo) {
		cartDAO.cartDoubleDelete(vo);
	}
	@Override
	public void cartDoubleDeleteT(CartVO vo) {
		cartDAO.cartDoubleDeleteT(vo);
	}

	@Override
	public List<CartVO> inCookieCart(CartVO vo) {
		return cartDAO.inCookieCart(vo);
	}

}
