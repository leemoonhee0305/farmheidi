package com.spring.farm.community;

import java.util.List;

public interface ReportService {
	
	public List<ReportVO> adminReportList(ReportVO vo);
	
	public int countAllReport(ReportVO vo);
	
	void insertQNAReport(ReportVO vo);
	
	void insertReviewReport(ReportVO vo);

	ReportVO getReport(ReportVO vo);

	void onlyDeleteReport(ReportVO vo);
	
	void deleteQNAReport(QNAVO vo);
	
	void deleteReviewReport(ReviewVO vo);
	
	String qnaFilename(QNAVO vo);
	
	String reviewFilename(ReviewVO vo);
	
}
