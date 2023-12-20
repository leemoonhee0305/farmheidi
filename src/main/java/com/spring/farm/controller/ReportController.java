package com.spring.farm.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.farm.community.ReportVO;
import com.spring.farm.community.ReviewVO;
import com.spring.farm.util.PagingVO;
import com.spring.farm.community.QNAVO;
import com.spring.farm.community.ReportService;

@Controller
public class ReportController {
	
	@Autowired
	private ReportService reportService;
	
	String realPath;

	
//		//Report 상세보기 입장
//		@RequestMapping(value = "/getReport.do", method = RequestMethod.GET)
//		public String getReport(ReportVO vo) throws IllegalStateException, IOException {
//		return "admin/getReport";
//		}
		
		// 신고 게시판 상세 조회
		@RequestMapping("/getReport.do")
		public String getReport(ReportVO vo, Model model) {
			model.addAttribute("report", reportService.getReport(vo));
			return "admin/adminReport";
		}
		
		// 신고게시 목록 전체 리스트
		@RequestMapping("/adminReportList.do")
		public String adminReportList(PagingVO pv, ReportVO vo, Model model,
				@RequestParam(value = "nowPage", required = false) String nowPage) {
			System.out.println("Report 컨트롤러 진입 :" + " Report 전체 목록 ");
			String cntPerPage = "10";

			int total = reportService.countAllReport(vo);
			if (nowPage == null) {
				nowPage = "1";
			}

			pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			model.addAttribute("paging", pv);
			vo.setStart(pv.getStart());
			vo.setCntPerPage(Integer.parseInt(cntPerPage));

			model.addAttribute("adminReportList", reportService.adminReportList(vo));
			return "admin/adminReportList";
		}
		
		
						
		//report 게시판 글만 삭제
		@RequestMapping("/onlyDeleteReport.do")
			public String onlyDeleteReport(ReportVO vo) {
			reportService.onlyDeleteReport(vo);
				return "redirect:getReportList.do";
			}
		
		//Report와 qna 게시판 글 삭제
		@RequestMapping("/deleteQNAReport.do")
		public String deleteQNAReport(QNAVO vo, HttpServletRequest request) {
			String qnaFilename = reportService.qnaFilename(vo);
			System.out.println("777777::::  "+vo);
			realPath = request.getSession().getServletContext().getRealPath("/resources/img/");
			if (!(qnaFilename == null || qnaFilename.equals("")   ) ) {
				System.out.println("파일삭제: " + realPath + qnaFilename);
				File f = new File(realPath + qnaFilename);
				f.delete();
			}
			reportService.deleteQNAReport(vo);
			return "redirect:adminReportList.do";
		}	
		
		//Report와 review 게시판 글 삭제
		@RequestMapping("/deleteReviewReport.do")
		public String deleteReviewReport(ReviewVO vo, HttpServletRequest request) {
			String reviewFilename = reportService.reviewFilename(vo);
			System.out.println("8888::::  "+vo);
			realPath = request.getSession().getServletContext().getRealPath("/resources/img/");
			if (!(reviewFilename == null || reviewFilename.equals("")   ) ) {
				System.out.println("파일삭제: " + realPath + reviewFilename);
				File f = new File(realPath + reviewFilename);
				f.delete();
			}
			reportService.deleteReviewReport(vo);
			return "redirect:adminReportList.do";
		}	
		
}
