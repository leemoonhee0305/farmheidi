package com.spring.farm.play;

import java.util.List;

public interface ResvService {

	// 체험상품 예약 정보 조회(1줄):회원예약정보조회
	public ResvVO getResv(ResvVO vo);

	// 체험상품 예약 정보 조회(여러 줄)
	public List<ResvVO> getResvList();

	// 체험상품 예약 내역보기
	public List<ResvVO> getUserResvList(ResvVO vo);

	// 체험상품 예약 정보 등록
	void insertResv(ResvVO vo);

	// 체험상품 예약 정보 수정
	void updateResv(ResvVO vo);

	// 체험상품 예약 정보 삭제
	void deleteResv(ResvVO vo);

	// 체험상품 예약 정보 취소
	void cancelResv(ResvVO vo);

	// 관리자 - 체험상품 예약 정보 조회(여러 줄)
	public List<ResvVO> getadminResvList(ResvVO vo);

	// 관리자 - 체험 예약현황 갯수 조회
	public int countAllResv(ResvVO vo);

}
