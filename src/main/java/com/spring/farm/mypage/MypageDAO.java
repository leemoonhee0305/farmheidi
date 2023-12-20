package com.spring.farm.mypage;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.farm.community.QNAVO;
import com.spring.farm.product.OIFVO;
import com.spring.farm.user.UserVO;

@Repository
public class MypageDAO {
	
	@Autowired
	private SqlSessionTemplate mpmybatis;
	
	// 마이페이지 내정보 조회
	public MypageVO myinfoUser(MypageVO vo) { 
		System.out.println("체크용 dao vo: "+vo);
		return mpmybatis.selectOne("MypageDAO.myinfoUser", vo);	
	}
	
	// 마이페이지 체험 예약 조회
	public List<MypageVO> myResvList(MypageVO vo) {
		return mpmybatis.selectList("MypageDAO.myResvList", vo);
	}	
	
	// 마이페이지 주문 배송 조회 
	public List<MypageVO> myOrderList(MypageVO vo){
		System.out.println("orderlist dao : "+vo);
		return mpmybatis.selectList("MypageDAO.myOrderList", vo);
	}
	
	// 마이페이지 나의 질문 조회
	public List<MypageVO> myQnaList(MypageVO vo){
		return mpmybatis.selectList("MypageDAO.myQnaList", vo);
	}

	// 마이페이지 체험 예약 글 갯수 조회 
	public int countResv(MypageVO vo) {
		return mpmybatis.selectOne("MypageDAO.countResv", vo);
	}
	
	// 마이페이지 주문 배송 갯수 조회 
	public int countOrder(OIFVO vo) {
		return mpmybatis.selectOne("MypageDAO.countOrder", vo);
	}
	
	// 마이페이지 나의 질문 글 갯수 조회
	public int countMyqna() {
		return mpmybatis.selectOne("MypageDAO.countMyqna");
	}
	
	// 마이페이지 체험 예약 취소
	public void myresvCan(MypageVO vo) {
		mpmybatis.update("MypageDAO.myresvCan");
	}

}
