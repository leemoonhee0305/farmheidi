package com.spring.farm.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.farm.community.QNAVO;
import com.spring.farm.product.OIFVO;

@Service("mypageService")
public class MypageServiceImpl implements MypageService{

	@Autowired
	private MypageDAO mypageDAO;
	
	@Override
	public MypageVO myinfoUser(MypageVO vo) {
		return mypageDAO.myinfoUser(vo);
	}

	@Override
	public List<MypageVO> myResvList(MypageVO vo) {		
		return mypageDAO.myResvList(vo);
	}

	@Override
	public List<MypageVO> myOrderList(MypageVO vo) {		
		return mypageDAO.myOrderList(vo);
	}

	@Override
	public List<MypageVO> myQnaList(MypageVO vo) {		
		return mypageDAO.myQnaList(vo);
	}

	@Override
	public int countResv(MypageVO vo) {		
		return mypageDAO.countResv(vo);
	}
	
	@Override
	public int countOrder(OIFVO vo) {
		return mypageDAO.countOrder(vo);
	}


	@Override
	public int countMyqna() {
		return mypageDAO.countMyqna();
	}	
	
	@Override
	public void myresvCan(MypageVO vo) {
		mypageDAO.myresvCan(vo);
	}

}
