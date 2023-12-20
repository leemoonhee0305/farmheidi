package com.spring.farm.community.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.farm.community.ReviewService;
import com.spring.farm.community.ReviewVO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewDAO reviewDAO;

	@Override
	public void insertReview(ReviewVO vo) {
		reviewDAO.insertReview(vo);
	}

	@Override
	public void updateReview(ReviewVO vo) {
		reviewDAO.updateReview(vo);
	}

	@Override
	public void deleteReview(ReviewVO vo) {
		reviewDAO.deleteReview(vo);
	}

	@Override
	public ReviewVO getReview(ReviewVO vo) {
		return reviewDAO.getReview(vo);
	}

	@Override
	public List<ReviewVO> getReviewList(ReviewVO vo) {
		return reviewDAO.getReviewList(vo);
	}

	@Override
	public int countReview(ReviewVO vo) {
		return reviewDAO.countReview(vo);
	}

	@Override
	public void updateCntReview(ReviewVO vo) {
		reviewDAO.updateCntReview(vo);
	}

	@Override
	public void deleteReviewFile(ReviewVO vo) {
		reviewDAO.deleteReviewFile(vo);
		
	}

	@Override
	public void updateReviewReply(ReviewVO vo) {
		reviewDAO.updateReviewReply(vo);
		
	}
	

}
