package com.spring.farm.play.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.farm.play.ResvService;
import com.spring.farm.play.ResvVO;

@Service("resvService")
public class ResvServiceImpl implements ResvService {

	@Autowired
	ResvDAO dao;

	// 체험상품 예약 정보 조회(1줄):회원예약정보조회
	@Override
	public ResvVO getResv(ResvVO vo) {
		return dao.getResv(vo);
	}

	// 체험상품 예약 정보 조회(여러 줄)
	@Override
	public List<ResvVO> getResvList() {
		return dao.getResvList();
	}

	// 체험상품 개인 예약 정보 조회(여러 줄)
	@Override
	public List<ResvVO> getUserResvList(ResvVO vo) {
		return dao.getUserResvList(vo);
	}

	// 체험상품 예약 정보 등록
	@Override
	public void insertResv(ResvVO vo) {
		dao.insertResv(vo);
	}

	// 체험상품 예약 정보 수정
	@Override
	public void updateResv(ResvVO vo) {
		dao.updateResv(vo);
	}

	// 체험상품 예약 정보 삭제
	@Override
	public void deleteResv(ResvVO vo) {
		dao.deleteResv(vo);
	}

	// 체험상품 예약 정보 취소
	@Override
	public void cancelResv(ResvVO vo) {
		dao.cancelResv(vo);
	}

	// 관리자 - 체험상품 예약 정보 조회(여러 줄)
	@Override
	public List<ResvVO> getadminResvList(ResvVO vo) {
		return dao.getadminResvList(vo);
	}

	// 관리자 - 체험 예약현황 갯수 조회
	@Override
	public int countAllResv(ResvVO vo) {
		return dao.countAllResv(vo);
	}

}
