package com.spring.farm.community.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.farm.community.QNAVO;
import com.spring.farm.community.ReportService;
import com.spring.farm.community.ReportVO;
import com.spring.farm.community.ReviewVO;

@Service("reportService")
public class ReportServiceImpl implements ReportService{

	@Autowired
	private ReportDAO reportDAO;
	
	
	@Override
	public List<ReportVO> adminReportList(ReportVO vo) {		
		return reportDAO.adminReportList(vo);
	}

	@Override
	public int countAllReport(ReportVO vo) {
		return reportDAO.countAllReport(vo);
	}
	
	@Override
	public void insertQNAReport(ReportVO vo) {
		reportDAO.insertQNAReport(vo);
	}

	@Override
	public void insertReviewReport(ReportVO vo) {
		reportDAO.insertReviewReport(vo);	
	}

	@Override
	public ReportVO getReport(ReportVO vo) {
		return reportDAO.getReport(vo);
	}
	
	@Override
	public void onlyDeleteReport(ReportVO vo) {
		reportDAO.onlyDeleteReport(vo);
	}

	@Override
	public void deleteQNAReport(QNAVO vo) {
		reportDAO.deleteQNAReport(vo);
		
	}
	@Override
	public void deleteReviewReport(ReviewVO vo) {
		reportDAO.deleteReviewReport(vo);
		
	}

	@Override
	public String qnaFilename(QNAVO vo) {
		return reportDAO.qnaFilename(vo);
		
	}
	
	@Override
	public String reviewFilename(ReviewVO vo) {
		return reportDAO.reviewFilename(vo);
	}





}
