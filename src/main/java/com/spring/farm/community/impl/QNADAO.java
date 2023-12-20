package com.spring.farm.community.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.farm.community.QNAVO;

@Repository
public class QNADAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//글등록
	public void insertQNA(QNAVO vo) {
		System.out.println("===>mybatis로 insertQNA() 기능처리");
		mybatis.insert("QNADAO.insertQNA", vo); 
	}
	
	//글수정
	public void updateQNA(QNAVO vo) {
		System.out.println("===>mybatis로 updateQNA() 기능처리");
		mybatis.update("QNADAO.updateQNA" , vo);
	}
	
	//글삭제
	public void deleteQNA(QNAVO vo) {
		System.out.println("===>mybatis로 deleteQNA() 기능처리");
		mybatis.delete("QNADAO.deleteQNA", vo);
	}
	
	
	//글상세 조회
	public QNAVO getQNA(QNAVO vo) {
		System.out.println("===>mybatis로 getQNA() 기능처리");
		return (QNAVO) mybatis.selectOne("QNADAO.getQNA", vo);
	}
	
	//글목록 조회
	public List<QNAVO> getQNAList(QNAVO vo) {
		System.out.println("===>mybatis로 getQNAList() 기능처리");
		return mybatis.selectList("QNADAO.getQNAList", vo);
	}	

	//전체 페이지 수 조회
	public int countQNA(QNAVO vo) {
		return mybatis.selectOne("QNADAO.countQNA", vo);
	}
	
	//조회수 카운트
	public void updateCntQNA(QNAVO vo) {
		System.out.println("===>mybatis로 updateCntQNA() 기능처리");
		mybatis.update("QNADAO.updateCntQNA", vo);
	}
	
	//업로드한 파일 삭제
		public void deleteQNAFile(QNAVO vo) {
			System.out.println("===>mybatis로 deleteQNAFile() 기능처리");
			mybatis.update("QNADAO.deleteQNAFile", vo);
		}
	
	public String getPasswordByQnaNum(int qna_num) {
		return mybatis.selectOne("QNADAO.getPasswordByQnaNum", qna_num);
	}
	
	//답변 등록
	public void updateQNAReply(QNAVO vo) {
		System.out.println("===>mybatis로 updateQNAReply() 기능처리");
		mybatis.update("QNADAO.updateQNAReply", vo); 
	}
	
}
