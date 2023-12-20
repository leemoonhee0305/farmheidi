package com.spring.farm.play.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.farm.play.PlayListVO;

@Repository
public class PlayListDAO {

	//어플리케이션 빈 설정에서 만들고 자동주입
	@Autowired
	SqlSessionTemplate mybatis;
	
	//체험상품 정보 조회(1줄):상품정보조회
	public PlayListVO getPlayOne(PlayListVO vo) {
		return mybatis.selectOne("PlayListDAO.getPlayOne", vo);
	}
	
	//체험상품 정보 조회(여러 줄)
	public List<PlayListVO> getPlayList() {
		return mybatis.selectList("PlayListDAO.getPlayList");
	}

	//체험상품 정보 등록
	public void insertPlay(PlayListVO vo) {
		System.out.println("===>mybatis insertPlay() 기능처리");
		mybatis.insert("PlayListDAO.insertPlay", vo);
	}
	
	//패키지 체험상품 정보 조회(1줄):패키지상품정보조회
	public PlayListVO getPlayPackageOne(PlayListVO vo) {
		return mybatis.selectOne("PlayListDAO.getPlayPackageOne", vo);
	}
	
}
