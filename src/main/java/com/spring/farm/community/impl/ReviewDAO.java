package com.spring.farm.community.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.farm.community.QNAVO;
import com.spring.farm.community.ReviewVO;


@Repository
public class ReviewDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
		//글등록
		public void insertReview(ReviewVO vo) {
			System.out.println("===>mybatis로 insertReview() 기능처리");
			mybatis.insert("ReviewDAO.insertReview", vo); 
		}
		
		//글수정
		public void updateReview(ReviewVO vo) {
			System.out.println("===>mybatis로 updateReview() 기능처리");
			mybatis.update("ReviewDAO.updateReview" , vo);
		}
		
		//글삭제
		public void deleteReview(ReviewVO vo) {
			System.out.println("===>mybatis로 deleteReview() 기능처리");
			mybatis.delete("ReviewDAO.deleteReview", vo);
		}
		
		
		//글상세 조회
		public ReviewVO getReview(ReviewVO vo) {
			System.out.println("===>mybatis로 getReview() 기능처리");
			return (ReviewVO) mybatis.selectOne("ReviewDAO.getReview", vo);
		}
		
		//글목록 조회
		public List<ReviewVO> getReviewList(ReviewVO vo) {
			System.out.println("===>mybatis로 getReviewList() 기능처리");
			return mybatis.selectList("ReviewDAO.getReviewList", vo);
		}
		
		//전체 페이지 수 조회
		public int countReview(ReviewVO vo) {
			return mybatis.selectOne("ReviewDAO.countReview", vo);
		}
		
		//조회수 카운트
		public void updateCntReview(ReviewVO vo) {
			System.out.println("===>mybatis로 updateCntReview() 기능처리");
			mybatis.update("ReviewDAO.updateCntReview", vo);
		}
		
		//업로드한 파일 삭제
		public void deleteReviewFile(ReviewVO vo) {
			System.out.println("===>mybatis로 deleteReviewFile() 기능처리");
			mybatis.update("ReviewDAO.deleteReviewFile", vo);
		}
		
		//답변 등록
		public void updateReviewReply(ReviewVO vo) {
			System.out.println("===>mybatis로 updateReviewReply() 기능처리");
			mybatis.update("ReviewDAO.updateReviewReply", vo); 
		}
}
