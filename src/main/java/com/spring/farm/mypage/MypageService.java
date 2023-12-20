package com.spring.farm.mypage;

import java.util.List;

import com.spring.farm.community.QNAVO;
import com.spring.farm.product.OIFVO;

public interface MypageService {
	
	MypageVO myinfoUser(MypageVO vo); // 마이페이지 내정보
	
	List<MypageVO> myResvList(MypageVO vo); // 마이페이지 체험예약
	
	List<MypageVO> myOrderList(MypageVO vo); // 마이페이지 주문배송
	
	List<MypageVO> myQnaList(MypageVO vo); // 마이페이지 질문확인	
	
	int countResv(MypageVO vo); // 마이페이지 체험 예약 글 갯수 조회 
	int countOrder(OIFVO vo); // 마이페이지 주문배송 게시물 갯수
	int countMyqna(); // 마이페이지 나의 질문 글 갯수 조회 
	void myresvCan(MypageVO vo);
}
