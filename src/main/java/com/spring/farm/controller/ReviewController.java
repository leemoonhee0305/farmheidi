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

import com.spring.farm.community.ReportService;
import com.spring.farm.community.ReportVO;
import com.spring.farm.community.ReviewService;
import com.spring.farm.community.ReviewVO;
import com.spring.farm.util.PagingVO;


@Controller
@SessionAttributes("review")
public class ReviewController {
	
	int cntChk = 0;

	@Autowired
	private ReviewService reviewService;
	@Autowired
	private ReportService reportService;

	String realPath;
	

	//신고하기
		@RequestMapping(value = "/insertReviewReport.do", method = RequestMethod.POST)
		public String insertReviewReport(ReportVO vo) throws IllegalStateException, IOException {
		    reportService.insertReviewReport(vo);
		    return "redirect:getReview.do?review_num="+vo.getReview_num();
		}

	//후기 게시판 글목록 검색 옵션
	@ModelAttribute("conditionMapReview")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("내용", "REVIEW_CONTENT");
		conditionMap.put("제목", "REVIEW_TITLE");
		return conditionMap;
	}
	
	//후기 게시판 글 등록
		@RequestMapping(value = "/insertReview.do", method = RequestMethod.POST)
		public String insertReview(MultipartHttpServletRequest request, ReviewVO vo) throws IllegalStateException, IOException {
			MultipartFile uplodFile = vo.getUploadFile();
			realPath = request.getSession().getServletContext().getRealPath("/resources/img/");
			if (!uplodFile.isEmpty()) {
			if (uplodFile != null) {
				String fileName = uplodFile.getOriginalFilename();
				vo.setReview_filename(fileName);
				uplodFile.transferTo(new File(realPath + fileName));
			}
			
			}
			reviewService.insertReview(vo);
			return "redirect:getReviewList.do";
		}
		
		@RequestMapping(value = "/insertReview.do", method = RequestMethod.GET)
		public String insertView(ReviewVO vo) throws IllegalStateException, IOException {
			return "review/insertReview";
		}	

//		//후기 게시판 글 수정
		@RequestMapping(value = "/updateReview.do", method = RequestMethod.POST)
		public String updateReview(@ModelAttribute("review") ReviewVO vo, HttpSession session,MultipartHttpServletRequest request) throws IllegalStateException, IOException {
			MultipartFile uplodFile = vo.getUploadFile();
			realPath = request.getSession().getServletContext().getRealPath("/resources/img/");
			if (uplodFile != null && !uplodFile.isEmpty()) {
			    String fileName = uplodFile.getOriginalFilename();
			    vo.setReview_filename(fileName);
			    uplodFile.transferTo(new File(realPath + fileName));
			
			}
			cntChk++;
			reviewService.updateReview(vo);
			return "redirect:getReview.do?review_num="+vo.getReview_num();
		}
		
		// Review update게시판 입장
		@RequestMapping(value= "/updateReview.do", method = RequestMethod.GET)
		public String updateView(ReviewVO vo) throws IllegalStateException, IOException {
			return "review/updateReview";
		}
		
		//후기 게시판 글 삭제
		@RequestMapping("/deleteReview.do")
		public String deleteReview(ReviewVO vo, HttpServletRequest request) {
//		public String deleteReview(ReviewVO vo) {
			// 상대 경로 추가 시 realPath 추가
			realPath = request.getSession().getServletContext().getRealPath("/resources/img/");
			if (vo.getReview_filename() != null) {
				System.out.println("파일삭제: " + realPath + vo.getReview_filename());
				File f = new File(realPath + vo.getReview_filename());
				f.delete();
			}
			reviewService.deleteReview(vo);
			return "redirect:getReviewList.do";
		}	
		
		//후기 게시판 글 상세 조회
		@RequestMapping("/getReview.do")
		public String getReview(@RequestParam(value="error", required = false) String error,ReviewVO vo, Model model) {
			ReviewVO mreview = reviewService.getReview(vo);
			System.out.println("게시판 상세조회 컨트롤러 작동");
			if (!(error==null || error.equals(""))) cntChk = 0;
			else if(cntChk <= 0) reviewService.updateCntReview(mreview);
			else cntChk = 0;
			mreview = reviewService.getReview(vo);
			model.addAttribute("review", mreview);
			return "review/getReview";
		}
		
		
		//후기 게시판 글 목록
	      @RequestMapping("/getReviewList.do")
	      public String getReviewListPost(PagingVO pv, ReviewVO vo, Model model,
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
	            vo.setSearchCondition("");
	         else
	            vo.setSearchCondition(vo.getSearchCondition());
	         if (vo.getSearchKeyword() == null)
	            vo.setSearchKeyword("");
	         else
	            vo.setSearchKeyword(vo.getSearchKeyword());

	         int total = reviewService.countReview(vo);
	         if (nowPage == null) {
	            nowPage = "1";
	         }
	         pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
	         model.addAttribute("paging", pv);
	         vo.setStart(pv.getStart());
	         vo.setListcnt(Integer.parseInt(cntPerPage));

	         model.addAttribute("searchKeyword", vo.getSearchKeyword());
	         model.addAttribute("searchCondition", vo.getSearchCondition());
	         model.addAttribute("reviewList", reviewService.getReviewList(vo));
	         return "review/getReviewList";

	      }
		
		
		
		//후기 게시판 파일다운로드
		@RequestMapping(value = "/Reviewdownload.do", method = RequestMethod.GET)
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
				response.setContentType("image/jpeg");

				response.getOutputStream().write(bytes);
				response.getOutputStream().flush();
				response.getOutputStream().close();
			}
			
			System.out.println("파일 다운로드 완");
		}
		
		//후기 게시판 파일삭제
		@RequestMapping("/delReviewFile.do")
		public String deleteReviewFile(ReviewVO vo, HttpServletRequest request) {
			System.out.println("파일삭제");
			realPath = request.getSession().getServletContext().getRealPath("/resources/img/");
			if (vo.getReview_filename() != null) {
				System.out.println("파일삭제: " + realPath + vo.getReview_filename());
				File f = new File(realPath + vo.getReview_filename());
				f.delete();
			}
			reviewService.deleteReviewFile(vo);
			return "redirect:getReview.do?review_num="+vo.getReview_num();
		}
		
		//후기 답변 등록
		@RequestMapping(value = "/updateReviewReply.do")
		public String updateReviewReply(ReviewVO vo) throws IllegalStateException, IOException {
				System.out.println(vo);
		        reviewService.updateReviewReply(vo);
		        return "redirect:adminReview.do";
		    }
		}


