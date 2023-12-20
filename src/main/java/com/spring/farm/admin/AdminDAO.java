package com.spring.farm.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.farm.play.PlayListVO;
import com.spring.farm.user.UserVO;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate adminMybatis;
	
	// 회원 관련 - 회원 목록 
	public List<UserVO> adminUserList(UserVO vo){
		return adminMybatis.selectList("AdminDAO.adminUserList", vo);
	}		
	
	// 회원 관련 - 회원수 체크 
	public int countAlluser(UserVO vo) {
		return adminMybatis.selectOne("AdminDAO.countAlluser", vo);
	}
	
	// 회원 관련 - 회원 정보 상세 조회 
	public UserVO adminUserInfo(UserVO vo) {
		return adminMybatis.selectOne("AdminDAO.adminUserInfo", vo);
	}
		
	// 회원 관련 - 회원 정보 수정 
	public void adminUserUpdate(UserVO vo) {
		adminMybatis.update("AdminDAO.adminUserUpdate", vo);		
	}
		
	// 회원 관련 - 회원 탈퇴 처리 
	public void adminUserExit(UserVO vo) {
		System.out.println("관리자 회원탈퇴 dao chk1");
		System.out.println("탈퇴 dao vo : "+vo);
		adminMybatis.update("AdminDAO.adminUserExit", vo);
		System.out.println("관리자 회원탈퇴 dao chk2");
	}
	
	// 체험 관련 - 체험 상품 추가
	public void adminPlayInsert(PlayListVO vo) {
		adminMybatis.insert("AdminDAO.adminPlayInsert", vo);
	}
	
	// 체험 패키지 목록 삭제
	public void adminPlayDelete(int pla_num) {
		adminMybatis.delete("AdminDAO.adminPlayDelete", pla_num);
	}
	

}
