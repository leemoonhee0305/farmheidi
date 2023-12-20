package com.spring.farm.community.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.farm.community.QNAVO;
import com.spring.farm.community.ReportVO;
import com.spring.farm.community.ReviewVO;
import com.spring.farm.user.UserVO;

@Repository
public class ReportDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	 
	public List<ReportVO> adminReportList(ReportVO vo){
		return mybatis.selectList("ReportDAO.adminReportList", vo);
	}		
		
	public int countAllReport(ReportVO vo) {
		return mybatis.selectOne("ReportDAO.countAllReport", vo);
	}
	
	public void insertQNAReport(ReportVO vo) {
		System.out.println("===>mybatis로 insertQNAReport() 기능처리");
		mybatis.insert("ReportDAO.insertQNAReport", vo);
	}
	
	public void insertReviewReport(ReportVO vo) {
		mybatis.insert("ReportDAO.insertReviewReport", vo);
	}
	
	//report글만 삭제
	public void onlyDeleteReport(ReportVO vo) {
		mybatis.delete("ReportDAO.onlyDeleteReport", vo);
	}
	
	//qna 신고글삭제
	public void deleteQNAReport(QNAVO vo) {
		System.out.println("===>mybatis로 deleteQNAReport() 기능처리");
		mybatis.delete("ReportDAO.deleteQNAReport", vo);
	}
	
	//review 신고글삭제
	public void deleteReviewReport(ReviewVO vo) {
		System.out.println("===>mybatis로 deleteReviewReport() 기능처리");
		mybatis.delete("ReportDAO.deleteReviewReport", vo);
	}
	//글상세 조회
	public ReportVO getReport(ReportVO vo) {
		System.out.println("===>mybatis로 getQNAReport() 기능처리");
		return (ReportVO) mybatis.selectOne("ReportDAO.getReport", vo);
	}
	
	public String qnaFilename(QNAVO vo) {
		return mybatis.selectOne("ReportDAO.qnaFilename", vo);
	}
	
	public String reviewFilename(ReviewVO vo) {
		return mybatis.selectOne("ReportDAO.reviewFilename", vo);
	}
	

}
