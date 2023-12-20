package com.spring.farm.play.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.farm.play.DateData;
import com.spring.farm.play.HolidayService;
import com.spring.farm.play.HolidayVO;

@Service("holidayService")
public class HolidayServiceImpl implements HolidayService {
	
	@Autowired
	HolidayDAO dao;

	public List<HolidayVO> getHolidayList(DateData vo){
		return dao.getHolidayList(vo);
	}
	public List<HolidayVO> getHolidayAllList(DateData vo){
		return dao.getHolidayAllList(vo);
	}
}
