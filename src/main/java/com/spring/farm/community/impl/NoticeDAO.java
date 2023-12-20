package com.spring.farm.community.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.farm.community.NoticeVO;

@Repository
public class NoticeDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
		//글등록
		public void insertNotice(NoticeVO vo) {
			System.out.println("===>mybatis로 insertNotice() 기능처리");
			mybatis.insert("NoticeDAO.insertNotice", vo); 
		}
		
		//글수정
		public void updateNotice(NoticeVO vo) {
			System.out.println("===>mybatis로 updateNotice() 기능처리");
			mybatis.update("NoticeDAO.updateNotice" , vo);
		}
		
		//글삭제
		public void deleteNotice(NoticeVO vo) {
			System.out.println("===>mybatis로 deleteNotice() 기능처리");
			mybatis.delete("NoticeDAO.deleteNotice", vo);
		}
		
		
		//글상세 조회
		public NoticeVO getNotice(NoticeVO vo) {
			System.out.println("===>mybatis로 getNotice() 기능처리");
			return (NoticeVO) mybatis.selectOne("NoticeDAO.getNotice", vo);
		}
		
		//글목록 조회
		public List<NoticeVO> getNoticeList(NoticeVO vo) {
			System.out.println("===>mybatis로 getNoticeList() 기능처리");
			return mybatis.selectList("NoticeDAO.getNoticeList", vo);
		}
		
		//전체 페이지 수 조회
		public int countNotice(NoticeVO vo) {
			return mybatis.selectOne("NoticeDAO.countNotice", vo);
		}
		
		//조회수 카운트
		public void updateCntNotice(NoticeVO vo) {
			System.out.println("===>mybatis로 updateCntNotice() 기능처리");
			mybatis.update("NoticeDAO.updateCntNotice", vo);
		}
		
		//업로드한 파일 삭제
		public void deleteNoticeFile(NoticeVO vo) {
			System.out.println("===>mybatis로 deleteNoticeFile() 기능처리");
			mybatis.update("NoticeDAO.deleteNoticeFile", vo);
		}

}
