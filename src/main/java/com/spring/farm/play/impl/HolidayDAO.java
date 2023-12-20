package com.spring.farm.play.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.farm.play.DateData;
import com.spring.farm.play.HolidayVO;

@Repository
public class HolidayDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<HolidayVO> getHolidayList(DateData vo){
		return mybatis.selectList("HolidayDAO.getHolidayList", vo);
	}
	
	public List<HolidayVO> getHolidayAllList(DateData vo){
		return mybatis.selectList("HolidayDAO.getHolidayAllList", vo);
	}
}
