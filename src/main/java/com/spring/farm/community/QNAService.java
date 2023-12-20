package com.spring.farm.community;

import java.util.List;


public interface QNAService {
	
	//글등록
	void insertQNA(QNAVO vo);

	//글수정
	void updateQNA(QNAVO vo);

	//글삭제
	void deleteQNA(QNAVO vo);

	//글상세 조회
	QNAVO getQNA(QNAVO vo);

	//글목록 조회
	List<QNAVO> getQNAList(QNAVO vo);
	
	//게시물 총 갯수
	int countQNA(QNAVO vo);
			
	//조회수 카운트
	void updateCntQNA(QNAVO vo);
	
	//업로드한 파일 삭제
	void deleteQNAFile(QNAVO vo);

	//비밀번호 
	String getPasswordByQnaNum(int qna_num);
	
	//답변 등록
	void updateQNAReply(QNAVO vo);

}
