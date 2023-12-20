package com.spring.farm.play.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.farm.play.ResvVO;

@Repository
public class ResvDAO {

	// 어플리케이션 빈 설정에서 만들고 자동주입
	@Autowired
	SqlSessionTemplate mybatis;

	// 체험상품 예약 정보 조회(1줄):회원예약정보조회
	public ResvVO getResv(ResvVO vo) {
		return mybatis.selectOne("ResvDAO.getResv", vo);
	}

	// 체험상품 예약 정보 조회(여러 줄)
	public List<ResvVO> getResvList() {
		return mybatis.selectList("ResvDAO.getResvList");
	}

	// 체험상품 예약 정보 확인
	public List<ResvVO> getUserResvList(ResvVO vo) {
		return mybatis.selectList("ResvDAO.getUserResvList", vo);
	}

	// 체험상품 예약 정보 등록
	public void insertResv(ResvVO vo) {
		System.out.println("===>mybatis insertResv() 기능처리");
		mybatis.insert("ResvDAO.insertResv", vo);
	}

	// 체험상품 예약 정보 수정
	public void updateResv(ResvVO vo) {
		System.out.println("===>mybatis로 updateResv() 기능처리");
		mybatis.update("ResvDAO.updateResv", vo);
	}

	// 체험상품 예약 정보 삭제
	public void deleteResv(ResvVO vo) {
		System.out.println("===>mybatis로 deleteResv() 기능처리");
		mybatis.delete("ResvDAO.deleteResv", vo);
	}

	// 체험상품 예약 정보 취소
	public void cancelResv(ResvVO vo) {
		System.out.println("===>mybatis로 cancelResv() 기능처리");
		mybatis.delete("ResvDAO.cancelResv", vo);
	}

	// 관리자 - 체험상품 예약 정보 조회(여러 줄)
	public List<ResvVO> getadminResvList(ResvVO vo) {
		return mybatis.selectList("ResvDAO.getadminResvList", vo);
	}

	// 관리자 - 체험 예약현황 갯수 조회
	public int countAllResv(ResvVO vo) {
		return mybatis.selectOne("ResvDAO.countAllResv", vo);
	}

}
