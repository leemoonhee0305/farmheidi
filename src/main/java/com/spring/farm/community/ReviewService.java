package com.spring.farm.community;

import java.util.List;


public interface ReviewService {
	
	//글등록
		void insertReview(ReviewVO vo);

		//글수정
		void updateReview(ReviewVO vo);

		//글삭제
		void deleteReview(ReviewVO vo);

		//글상세 조회
		ReviewVO getReview(ReviewVO vo);

		//글목록 조회
		List<ReviewVO> getReviewList(ReviewVO vo);
			
		//게시물 총 갯수
		int countReview(ReviewVO vo);
			
		//조회수 카운트
		void updateCntReview(ReviewVO vo);
		
		//업로드한 파일 삭제
		void deleteReviewFile(ReviewVO vo);
		
		//답변 등록
		void updateReviewReply(ReviewVO vo);

}
