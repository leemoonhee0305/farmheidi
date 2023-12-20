package com.spring.farm.community.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.farm.community.NoticeService;
import com.spring.farm.community.NoticeVO;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	@Override
	public void insertNotice(NoticeVO vo) {
		noticeDAO.insertNotice(vo);
		
	}

	@Override
	public void updateNotice(NoticeVO vo) {
		noticeDAO.updateNotice(vo);
	}

	@Override
	public void deleteNotice(NoticeVO vo) {
		noticeDAO.deleteNotice(vo);
		
	}

	@Override
	public NoticeVO getNotice(NoticeVO vo) {
		return noticeDAO.getNotice(vo);
	}

	@Override
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		return noticeDAO.getNoticeList(vo);
	}

	@Override
	public int countNotice(NoticeVO vo) {
		return noticeDAO.countNotice(vo);
	}

	@Override
	public void updateCntNotice(NoticeVO vo) {
		noticeDAO.updateCntNotice(vo);
		
	}

	@Override
	public void deleteNoticeFile(NoticeVO vo) {
		noticeDAO.deleteNoticeFile(vo);
		
	}
}
