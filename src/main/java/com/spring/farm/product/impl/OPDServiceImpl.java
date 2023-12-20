package com.spring.farm.product.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.farm.product.OPDService;
import com.spring.farm.product.OPDVO;

@Service("OPDService")
public class OPDServiceImpl implements OPDService{

	@Autowired
	private OPDDAOMybatis OPDDAO;
	
	@Override
	public void orderIntoOPD(OPDVO vo) {
		OPDDAO.orderIntoOPD(vo);
	}

	@Override
	public List<OPDVO> orderWhat(String oif_id) {
		return OPDDAO.orderWhat(oif_id);
	}

	@Override
	public List<OPDVO> orderDetail(OPDVO vo) {
		return OPDDAO.orderDetail(vo);
	}

}
