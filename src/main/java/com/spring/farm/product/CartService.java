package com.spring.farm.product;

import java.util.List;

public interface CartService {
	
	public int countCart(CartVO vo);
	public void cartOneInsert(CartVO vo);
	public void cartUpdate(CartVO vo);
	
	public List<CartVO> inMyCartList(CartVO vo);
	
	public void delCart(CartVO vo);
	public void delSelCart(CartVO vo);
	
	public CartVO selBuy(CartVO vo);
	
	public void delWeekCart();
	public int cntWeekCart();
	
	public void fromCookieToUser(CartVO vo);
	public void cartDoubleDelete(CartVO vo);
	public void cartDoubleDeleteT(CartVO vo);
	
	public List<CartVO> inCookieCart(CartVO vo);
}
