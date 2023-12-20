package com.spring.farm.play;

import java.util.List;

public interface HolidayService {
	
	public List<HolidayVO> getHolidayList(DateData vo);
	public List<HolidayVO> getHolidayAllList(DateData vo);
}
