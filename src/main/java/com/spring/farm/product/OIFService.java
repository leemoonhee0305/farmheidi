package com.spring.farm.product;

import java.util.List;

public interface OIFService {
	public void orderIntoOIF(OIFVO vo);
	public OIFVO getOrderInfo(String oifId);
	public List<OIFVO> getAllOrder(OIFVO vo);
	public int countOrderList();
	public Integer getOrderTotal();
	
	public int getOrderClearCount();
	public int getShipPrepareCount();
	public int getShipIngCount();
	public int getShipClearCount();
	public int getCancelCount();
	
	public int updateShipstate(OIFVO vo);
	public void updateShipInfo(OIFVO vo);
	public List<OIFVO> adoifMain();
}
