package com.spring.farm.admin;

import java.util.List;

import com.spring.farm.play.PlayListVO;
import com.spring.farm.user.UserVO;

public interface AdminService {

	public List<UserVO> adminUserList(UserVO vo);
	public int countAlluser(UserVO vo);
	public UserVO adminUserInfo(UserVO vo);
	public void adminUserUpdate(UserVO vo);
	public void adminUserExit(UserVO vo);
	public void adminPlayInsert(PlayListVO vo);
	public void adminPlayDelete(int pla_num);
}
