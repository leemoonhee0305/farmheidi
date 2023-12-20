package com.spring.farm.community.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.farm.community.QNAService;
import com.spring.farm.community.QNAVO;

@Service("qnaService")
public class QNAServiceImpl implements QNAService{
	
	@Autowired
	private QNADAO qnaDAO;

	@Override
	public void insertQNA(QNAVO vo) {
		qnaDAO.insertQNA(vo);
		
	}

	@Override
	public void updateQNA(QNAVO vo) {
		qnaDAO.updateQNA(vo);
		
	}

	@Override
	public void deleteQNA(QNAVO vo) {
		qnaDAO.deleteQNA(vo);
		
	}

	@Override
	public QNAVO getQNA(QNAVO vo) {
		return qnaDAO.getQNA(vo);
	}

	@Override
	public List<QNAVO> getQNAList(QNAVO vo) {
		return qnaDAO.getQNAList(vo);
	}

	@Override
	public int countQNA(QNAVO vo) {
		return qnaDAO.countQNA(vo);
	}

	@Override
	public void updateCntQNA(QNAVO vo) {
		qnaDAO.updateCntQNA(vo);
		
	}

	@Override
	public void deleteQNAFile(QNAVO vo) {
		qnaDAO.deleteQNAFile(vo);
		
	}

	@Override
    public String getPasswordByQnaNum(int qna_num) {
        return qnaDAO.getPasswordByQnaNum(qna_num);
    }

	@Override
	public void updateQNAReply(QNAVO vo) {
		qnaDAO.updateQNAReply(vo);
		
	}
}


