package com.spring.farm.community;

import java.util.List;

public interface NoticeService {
	
	//글등록
	void insertNotice(NoticeVO vo);

	//글수정
	void updateNotice(NoticeVO vo);

	//글삭제
	void deleteNotice(NoticeVO vo);

	//글상세 조회
	NoticeVO getNotice(NoticeVO vo);

	//글목록 조회
	List<NoticeVO> getNoticeList(NoticeVO vo);
		
	//게시물 총 갯수
	int countNotice(NoticeVO vo);
		
	//조회수 카운트
	void updateCntNotice(NoticeVO vo);
	
	//업로드한 파일 삭제
	void deleteNoticeFile(NoticeVO vo);
}
