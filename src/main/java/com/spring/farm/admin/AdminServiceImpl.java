package com.spring.farm.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.farm.play.PlayListVO;
import com.spring.farm.user.UserVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDAO adminDAO;

	@Override
	public List<UserVO> adminUserList(UserVO vo) {		
		return adminDAO.adminUserList(vo);
	}

	@Override
	public int countAlluser(UserVO vo) {
		return adminDAO.countAlluser(vo);
	}

	@Override
	public UserVO adminUserInfo(UserVO vo) {
		return adminDAO.adminUserInfo(vo);
	}

	@Override
	public void adminUserUpdate(UserVO vo) {
		adminDAO.adminUserUpdate(vo);		
	}

	@Override
	public void adminUserExit(UserVO vo) {
		adminDAO.adminUserExit(vo);
		System.out.println("관리자 회원탈퇴 serv chk");
	}

	@Override
	public void adminPlayInsert(PlayListVO vo) {
		adminDAO.adminPlayInsert(vo);
	}

	@Override
	public void adminPlayDelete(int pla_num) {
		adminDAO.adminPlayDelete(pla_num);
	} 

	
}
