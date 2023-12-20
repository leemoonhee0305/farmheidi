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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.farm.community.QNAService;
import com.spring.farm.community.QNAVO;
import com.spring.farm.community.ReportService;
import com.spring.farm.community.ReportVO;
import com.spring.farm.util.PagingVO;


@Controller
@SessionAttributes("qna")
public class QNAController {
	
	int cntChk = 0;

	@Autowired
	private QNAService qnaService;
	@Autowired
	private ReportService reportService;
	

	String realPath;
	
	String password;
	
	//신고하기
	@RequestMapping(value = "/insertQNAReport.do", method = RequestMethod.POST)
	public String insertQNAReport(ReportVO vo) throws IllegalStateException, IOException {
//	    int qn = vo.getQna_num();
	    reportService.insertQNAReport(vo);
	    return "redirect:getQNA.do?qna_num=" + vo.getQna_num();
	}
	
	// 비밀번호를 가져오는 컨트롤러 메소드 추가
	@RequestMapping(value = "/getPassword.do", method = RequestMethod.GET)
	public void getPassword(@RequestParam("qna_num") int qna_num, HttpServletResponse response) throws IOException {
		// qna_num을 이용하여 비밀번호 가져오기
		String password = qnaService.getPasswordByQnaNum(qna_num);

		// 비밀번호를 응답으로 전송
		response.getWriter().write(password);
	}
	
	//qna 글목록 검색 옵션
	@ModelAttribute("conditionMapQNA")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("내용", "QNA_CONTENT");
		conditionMap.put("제목", "QNA_TITLE");
		return conditionMap;
	}
		//qna 글등록
		@RequestMapping(value = "/insertQNA.do", method = RequestMethod.POST)
		public String insertQNA(MultipartHttpServletRequest request, QNAVO vo) throws IllegalStateException, IOException {
		    MultipartFile uplodFile = vo.getUploadFile();
		    boolean qnasecret = vo.isQna_secret();
		    String qnapw = vo.getQna_password();
		    realPath = request.getSession().getServletContext().getRealPath("/resources/img/");

		    if (qnasecret && qnapw.isEmpty()) {
		        // 비밀번호를 입력하지 않은 경우
		        request.setAttribute("msg", "비밀번호를 입력해주세요");
		        
		        // 이전 페이지의 URL을 가져오기
		        String referer = request.getHeader("Referer");
		        if (referer == null || referer.isEmpty()) {
		            // 이전 페이지의 URL이 없는 경우 처리
		            request.setAttribute("url", "/");
		        } else {
		            request.setAttribute("url", referer);
		        }

		        return "qna/alert";
		    } else {
		        if (!uplodFile.isEmpty()) {
		            if (uplodFile != null) {
		                String fileName = uplodFile.getOriginalFilename();
		                vo.setQna_filename(fileName);
		                uplodFile.transferTo(new File(realPath + fileName));
		            }
		        }
		        qnaService.insertQNA(vo);
		        return "redirect:getQNAList.do";
		    }
		}
		
		//qna 글쓰기 입장
		@RequestMapping(value = "/insertQNA.do", method = RequestMethod.GET)
		public String insertView(QNAVO vo) throws IllegalStateException, IOException {
			return "qna/insertQNA";
		}	

		//qna 글 수정
		@RequestMapping(value = "/updateQNA.do", method = RequestMethod.POST)
		public String updateQNA(
		    MultipartHttpServletRequest request,
		    @ModelAttribute("qna") QNAVO vo,
		    @RequestParam(name = "qna_secret", defaultValue = "false") boolean qnaSecret,
		    HttpSession session
		) throws IllegalStateException, IOException {
		    MultipartFile uplodFile = vo.getUploadFile();
		    String qnapw = vo.getQna_password();
		    realPath = request.getSession().getServletContext().getRealPath("/resources/img/");

		    if (qnaSecret && (qnapw == null || qnapw.isEmpty())) {
		        // 비밀번호를 입력하지 않은 경우
		        request.setAttribute("msg", "비밀번호를 입력해주세요");

		        // 이전 페이지의 URL을 가져오기
		        String referer = request.getHeader("Referer");
		        if (referer == null || referer.isEmpty()) {
		            // 이전 페이지의 URL이 없는 경우 처리 (예: 기본 페이지로 리다이렉션)
		            request.setAttribute("url", "/");
		        } else {
		            request.setAttribute("url", referer);
		        }

		        return "qna/alert";
		    } else {
		    	if (uplodFile != null && !uplodFile.isEmpty()) {
		                String fileName = uplodFile.getOriginalFilename();
		                vo.setQna_filename(fileName);
		                uplodFile.transferTo(new File(realPath + fileName));
		            }
		        }

		        // 체크박스 값 설정
		        vo.setQna_secret(qnaSecret);

		        if (!qnaSecret) {
		            // qna_secret이 false이면 qna_password를 null로 설정
		            vo.setQna_password(null);
		        }

		        cntChk++;
		        qnaService.updateQNA(vo);
		        return "redirect:getQNA.do?qna_num=" + vo.getQna_num();
		    }
		

		// qna update게시판 입장
		@RequestMapping(value= "/updateQNA.do", method = RequestMethod.GET)
		public String updateView(QNAVO vo) throws IllegalStateException, IOException {
			return "qna/updateQNA";
		}
		
		//qna 게시판 글 삭제
		@RequestMapping("/deleteQNA.do")
		public String deleteQNA(QNAVO vo, HttpServletRequest request) {
//		public String deleteQNA(QNAVO vo) {
			// 상대 경로 추가 시 realPath 추가
			realPath = request.getSession().getServletContext().getRealPath("/resources/img/");
			if (vo.getQna_filename() != null) {
				System.out.println("파일삭제: " + realPath + vo.getQna_filename());
				File f = new File(realPath + vo.getQna_filename());
				f.delete();
			}
			qnaService.deleteQNA(vo);
			return "redirect:getQNAList.do";
		}	
		
		//qna 게시판 글 상세 조회
		@RequestMapping("/getQNA.do")
		public String getQNA(@RequestParam(value="error", required = false) String error,QNAVO vo, Model model) {
			QNAVO mqna = qnaService.getQNA(vo);
			if (!(error==null || error.equals(""))) cntChk = 0;
			else if(cntChk <= 0) qnaService.updateCntQNA(mqna);
			else cntChk = 0;
			mqna = qnaService.getQNA(vo);
			model.addAttribute("qna", mqna);
			return "qna/getQNA";
		}
		

		
		//비밀글 비밀번호 입력
		@RequestMapping("/passwordQNA.do")
		public String passwordQNA(@RequestParam(value="error", required = false) String error,QNAVO vo, Model model) {
			QNAVO mqna = qnaService.getQNA(vo);
			mqna = qnaService.getQNA(vo);
			model.addAttribute("qna", mqna);
			return "qna/passwordQNA";
		}
		
		// qna 비밀글 비밀번호 게시판 입장
		//		@RequestMapping(value= "/passwordQNA.do", method = RequestMethod.GET)
		//		public String passwordQNA(QNAVO vo) throws IllegalStateException, IOException {
		//			return "qna/passwordQNA";
		//		}
		
		
		//qna 게시판 글 목록
		@RequestMapping("/getQNAList.do")
	      public String getQNAListPost(PagingVO pv, QNAVO vo, Model model,
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
	            vo.setSearchCondition("QNA_TITLE");
	         else
	            vo.setSearchCondition(vo.getSearchCondition());
	         if (vo.getSearchKeyword() == null)
	            vo.setSearchKeyword("");
	         else
	            vo.setSearchKeyword(vo.getSearchKeyword());

	         int total = qnaService.countQNA(vo);
	         if (nowPage == null) {
	            nowPage = "1";
	         }
	         pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
	         model.addAttribute("paging", pv);
	         vo.setStart(pv.getStart());
	         vo.setListcnt(Integer.parseInt(cntPerPage));

	         model.addAttribute("searchKeyword", vo.getSearchKeyword());
	         model.addAttribute("searchCondition", vo.getSearchCondition());
	         model.addAttribute("qnaList", qnaService.getQNAList(vo));
	         return "qna/getQNAList";

	      }
		
		
		
		//qna 게시판 파일다운로드
		@RequestMapping(value = "/QNAdownload.do", method = RequestMethod.GET)
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
		
		//qna 게시판 파일삭제
		@RequestMapping("/delQNAFile.do")
		public String deleteQNAFile(QNAVO vo, HttpServletRequest request) {
			System.out.println("파일삭제");
			realPath = request.getSession().getServletContext().getRealPath("/resources/img/");
			if (vo.getQna_filename() != null) {
				System.out.println("파일삭제: " + realPath + vo.getQna_filename());
				File f = new File(realPath + vo.getQna_filename());
				f.delete();
			}
			qnaService.deleteQNAFile(vo);
			return "redirect:getQNA.do?qna_num="+vo.getQna_num();
		}
		
		//qna 답변 등록
				@RequestMapping(value = "/updateQNAReply.do")
				public String updateQNAReply(QNAVO vo) throws IllegalStateException, IOException {
						System.out.println(vo);
				        qnaService.updateQNAReply(vo);
				        return "redirect:adminQnaList.do";
				    }
				}


