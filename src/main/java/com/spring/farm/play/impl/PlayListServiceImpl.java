package com.spring.farm.play.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.farm.play.PlayListService;
import com.spring.farm.play.PlayListVO;

@Service("playListService")
public class PlayListServiceImpl implements PlayListService {
	@Autowired
	PlayListDAO dao;
	
	@Override
	public List<PlayListVO> getPlayList() {
		return dao.getPlayList();
	}

	@Override
	public PlayListVO getPlayOne(PlayListVO vo) {
		return dao.getPlayOne(vo);
	}

	@Override
	public void insertPlay(PlayListVO vo) {
		dao.insertPlay(vo);
	}
	
	//패키지 체험 상품 한줄 데이터 가져오기
	@Override
	public PlayListVO getPlayPackageOne(PlayListVO vo) {
		return dao.getPlayPackageOne(vo);
	}

}
