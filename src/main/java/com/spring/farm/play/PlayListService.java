package com.spring.farm.play;

import java.util.List;

public interface PlayListService {
	
//	체험 상품 전체 리스트
	public List<PlayListVO> getPlayList();
	
// 	체험 상품 한줄 데이터 가져오기
	public PlayListVO getPlayOne(PlayListVO vo);
	
//	체험 상품 추가하기
	void insertPlay(PlayListVO vo);
	
// 	패키지 체험 상품 한줄 데이터 가져오기
	public PlayListVO getPlayPackageOne(PlayListVO vo);
	
}
