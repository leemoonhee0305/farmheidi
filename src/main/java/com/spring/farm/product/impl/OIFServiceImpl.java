package com.spring.farm.product.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.farm.product.OIFService;
import com.spring.farm.product.OIFVO;

@Service("OIFService")
public class OIFServiceImpl implements OIFService{
	
	@Autowired
	private OIFDAOMybatis OIFDAO;

	@Override
	public void orderIntoOIF(OIFVO vo) {
		OIFDAO.orderIntoOIF(vo);
	}

	@Override
	public OIFVO getOrderInfo(String oifId) {
		return OIFDAO.getOrderInfo(oifId);
	}
	
	@Override
	public List<OIFVO> getAllOrder(OIFVO vo) {
		return OIFDAO.getAllOrder(vo);
	}

	@Override
	public int countOrderList() {
		return OIFDAO.countOrderList();
	}
	
	@Override
	public Integer getOrderTotal() {
		return OIFDAO.getOrderTotal();
	}

	@Override
	public int getOrderClearCount() {
		return OIFDAO.getOrderClearCount();
	}

	@Override
	public int getShipPrepareCount() {
		return OIFDAO.getShipPrepareCount();
	}

	@Override
	public int getShipIngCount() {
		return OIFDAO.getShipIngCount();
	}

	@Override
	public int getShipClearCount() {
		return OIFDAO.getShipClearCount();
	}

	@Override
	public int getCancelCount() {
		return OIFDAO.getCancelCount();
	}
	
	@Override
	public int updateShipstate(OIFVO vo) {
		return OIFDAO.updateShipstate(vo);
	}

	@Override
	public void updateShipInfo(OIFVO vo) {
		OIFDAO.updateShipInfo(vo);
	}

	@Override
	public List<OIFVO> adoifMain() {
		return OIFDAO.adoifMain();
	}
}
