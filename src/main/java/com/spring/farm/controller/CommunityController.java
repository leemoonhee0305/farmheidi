package com.spring.farm.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.farm.community.NoticeService;
import com.spring.farm.community.NoticeVO;
import com.spring.farm.util.PagingVO;


@Controller
@SessionAttributes("notice")
public class CommunityController {
	
	int cntChk = 0;

	@Autowired
	private NoticeService noticeService;

	String realPath;
	

	//공지사항 게시판 글목록 검색 옵션
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("내용", "NOTICE_CONTENT");
		conditionMap.put("제목", "NOTICE_TITLE");
		return conditionMap;
	}
	
	//공지사항 게시판 글 등록
		@RequestMapping(value = "/insertNotice.do", method = RequestMethod.POST)
		public String insertNotice(MultipartHttpServletRequest request, NoticeVO vo) throws IllegalStateException, IOException {
//		public String insertNotice(NoticeVO vo) throws IllegalStateException, IOException {
//		상대경로 추가시 
			System.out.println("post");
			MultipartFile uplodFile = vo.getUploadFile();
			// 상대 경로 추가 시 realPath 추가
			realPath = request.getSession().getServletContext().getRealPath("/resources/img/");
			if (!uplodFile.isEmpty()) {
			if (uplodFile != null) {
				String fileName = uplodFile.getOriginalFilename();
				vo.setNotice_filename(fileName);
				uplodFile.transferTo(new File(realPath + fileName));
			}
			
			}
			noticeService.insertNotice(vo);
			return "redirect:adminNoticeList.do";
		}
		
		@RequestMapping(value = "/insertNotice.do", method = RequestMethod.GET)
	      public String insertView(NoticeVO vo) throws IllegalStateException, IOException {
	         System.out.println("get");
	         return "admin/adminInsertNotice";
	      }

		//공지사항 게시판 글 수정
		@RequestMapping("/updateNotice.do")
		public String updateNotice(@ModelAttribute("notice") NoticeVO vo, HttpSession session) {
			cntChk++;
			noticeService.updateNotice(vo);
			return "redirect:getNotice.do?notice_num="+vo.getNotice_num();
		}
		
		//공지사항 게시판 글 삭제
		@RequestMapping("/deleteNotice.do")
		public String deleteNotice(NoticeVO vo, HttpServletRequest request) {
//		public String deleteNotice(NoticeVO vo) {
			// 상대 경로 추가 시 realPath 추가
			realPath = request.getSession().getServletContext().getRealPath("/resources/img/");
			if (vo.getNotice_filename() != null) {
				System.out.println("파일삭제: " + realPath + vo.getNotice_filename());
				File f = new File(realPath + vo.getNotice_filename());
				f.delete();
			}
			noticeService.deleteNotice(vo);
			return "redirect:getNoticeList.do";
		}	
		
		//공지사항 게시판 글 상세 조회
		@RequestMapping("/getNotice.do")
		public String getNotice(@RequestParam(value="error", required = false) String error,NoticeVO vo, Model model) {
			NoticeVO mnotice = noticeService.getNotice(vo);
			if (!(error==null || error.equals(""))) cntChk = 0;
			else if(cntChk <= 0) noticeService.updateCntNotice(mnotice);
			else cntChk = 0;
			mnotice = noticeService.getNotice(vo);
			model.addAttribute("notice", mnotice);
			return "notice/getNotice";
		}
		
		
		//공지사항 게시판 글 목록
		@RequestMapping("/getNoticeList.do")
		public String getNoticeListPost(PagingVO pv, NoticeVO vo, Model model,
				@RequestParam(value = "page", required = false) String nowPage) {
			System.out.println("글 목록 검색 처리");
			String cntPerPage = "10";
			  if (vo.getSearchKeyword() == null) {
		          vo.setSearchKeyword("");
		       }
		       if (nowPage == null) {
		          nowPage = "1";
		       }
		       if(vo.getListcnt() < 1) {
		          vo.setListcnt(cntChk);
		       }   
			if (vo.getSearchCondition() == null)
				vo.setSearchCondition("NOTICE_TITLE");
			else
				vo.setSearchCondition(vo.getSearchCondition());
			if (vo.getSearchKeyword() == null)
				vo.setSearchKeyword("");
			else
				vo.setSearchKeyword(vo.getSearchKeyword());
				int total = noticeService.countNotice(vo);
			if (nowPage == null) {
				nowPage = "1";
			}
			pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			model.addAttribute("paging", pv);
			vo.setStart(pv.getStart());
			vo.setListcnt(Integer.parseInt(cntPerPage));
			model.addAttribute("searchKeyword", vo.getSearchKeyword());
			model.addAttribute("searchCondition", vo.getSearchCondition());
			model.addAttribute("noticeList", noticeService.getNoticeList(vo));
			return "notice/getNoticeList";
		}
		
		
		
		//공지사항 게시판 파일다운로드
		@RequestMapping(value = "/download.do", method = RequestMethod.GET)
		public void fileDownLoad(@RequestParam(value = "filename", required = false) String filename,
				HttpServletRequest request, HttpServletResponse response) throws IOException {
			System.out.println("파일 다운로드");
			// (1) 기본 ajax요청 시 응답
			if (filename == null || filename.equals("")) {
			} else {

				// (2) 요청파일 정보 불러오기
				realPath = request.getSession().getServletContext().getRealPath("/resources/img/");
				File file = new File(realPath + filename);

				// 한글은 http 헤더에 사용할 수 없기 때문에 파일명은 영문으로 인코딩하여 헤더에 적용한다
				String fn = new String(file.getName().getBytes(), "iso_8859_1");

				// (3) ContentType설정
				byte[] bytes = org.springframework.util.FileCopyUtils.copyToByteArray(file);
				response.setHeader("Content-Disposition", "attachment; filename=\"" + fn + "\"");
				response.setContentLength(bytes.length);
				// response.setContentType("image/jpeg");

				response.getOutputStream().write(bytes);
				response.getOutputStream().flush();
				response.getOutputStream().close();
			}
			
			System.out.println("파일 다운로드 완");
		}
		
		//공지사항 게시판 파일삭제
		@RequestMapping("/delNoticeFile.do")
		public String deleteNoticeFile(NoticeVO vo, HttpServletRequest request) {
			System.out.println("파일삭제");
			realPath = request.getSession().getServletContext().getRealPath("/resources/img/");
			if (vo.getNotice_filename() != null) {
				System.out.println("파일삭제: " + realPath + vo.getNotice_filename());
				File f = new File(realPath + vo.getNotice_filename());
				f.delete();
			}
			noticeService.deleteNoticeFile(vo);
			return "redirect:getNotice.do";
		}
		
		
		

}
