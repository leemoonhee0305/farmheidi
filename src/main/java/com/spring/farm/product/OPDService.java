package com.spring.farm.product;

import java.util.List;

public interface OPDService {
	public void orderIntoOPD(OPDVO vo);
	public List<OPDVO> orderWhat(String oif_id);
	public List<OPDVO> orderDetail(OPDVO vo);
}
