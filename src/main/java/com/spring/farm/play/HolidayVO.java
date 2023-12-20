package com.spring.farm.play;

public class HolidayVO {
	
	// 년도
	private String holiday_year;
	// 월
	private String holiday_month;
	// 일
	private String holiday_day;
	
	public String getHoliday_year() {
		return holiday_year;
	}
	public void setHoliday_year(String holiday_year) {
		this.holiday_year = holiday_year;
	}
	public String getHoliday_month() {
		return holiday_month;
	}
	public void setHoliday_month(String holiday_month) {
		this.holiday_month = holiday_month;
	}
	public String getHoliday_day() {
		return holiday_day;
	}
	public void setHoliday_day(String holiday_day) {
		this.holiday_day = holiday_day;
	}

	
	@Override
	public String toString() {
		return "HolidayVO [holiday_year=" + holiday_year + ", holiday_month=" + holiday_month + ", holiday_day="
				+ holiday_day + "]";
	}

	
	
	
	
	
	
	
	
	
	

}
