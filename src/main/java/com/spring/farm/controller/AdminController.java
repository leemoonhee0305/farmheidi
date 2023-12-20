package com.spring.farm.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.farm.admin.AdminService;
import com.spring.farm.community.NoticeService;
import com.spring.farm.community.NoticeVO;
import com.spring.farm.community.QNAService;
import com.spring.farm.community.QNAVO;
import com.spring.farm.community.ReviewService;
import com.spring.farm.community.ReviewVO;
import com.spring.farm.play.PlayListService;
import com.spring.farm.play.PlayListVO;
import com.spring.farm.play.ResvService;
import com.spring.farm.play.ResvVO;
import com.spring.farm.product.OIFService;
import com.spring.farm.user.UserService;
import com.spring.farm.user.UserVO;
import com.spring.farm.util.PagingVO;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private ResvService resvService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PlayListService playListService;
	
	@Autowired
	private QNAService qnaService;
	
	@Autowired
	private OIFService OifService ;

	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private ReviewService reviewService;
	
	String realPath;

	private int cntChk;
	
	// 회원 목록 검색
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("ID", "USER_ID");
		conditionMap.put("이름", "USER_NAME");
		return conditionMap;
	}
	
	@RequestMapping("/adminMain.do")
	public String adminMain(Model model, QNAVO vo, UserVO uvo) {

		List<ResvVO> resvList = resvService.getResvList();
		/*qnaList 시작*/
		String cntPerPage = "4";
		if (vo.getSearchCondition() == null)
			vo.setSearchCondition("QNA_TITLE");
		else
			vo.setSearchCondition(vo.getSearchCondition());
		if (vo.getSearchKeyword() == null)
			vo.setSearchKeyword("");
		else
			vo.setSearchKeyword(vo.getSearchKeyword());

		int total = qnaService.countQNA(vo);
		PagingVO pv = new PagingVO(total, 1, Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pv);
		vo.setStart(pv.getStart());
		vo.setListcnt(Integer.parseInt(cntPerPage));
		model.addAttribute("qnaList", qnaService.getQNAList(vo));
		model.addAttribute("adminUserList", adminService.adminUserList(uvo));
		/*qnaList 끝*/
		
		String ucntPerPage = "4";
		if (uvo.getSearchCondition() == null)
			uvo.setSearchCondition("USER_ID");
		else
			uvo.setSearchCondition(uvo.getSearchCondition());
		if (uvo.getSearchKeyword() == null)
			uvo.setSearchKeyword("");
		else
			uvo.setSearchKeyword(vo.getSearchKeyword());

		int utotal = adminService.countAlluser(uvo);

		PagingVO upv = new PagingVO(utotal, 1, Integer.parseInt(ucntPerPage));
		model.addAttribute("paging", upv);
		uvo.setStart(upv.getStart());
		uvo.setCntPerPage(Integer.parseInt(ucntPerPage));

		model.addAttribute("searchCondition", uvo.getSearchCondition());
		model.addAttribute("searchKeyword", uvo.getSearchKeyword());

		model.addAttribute("userList", adminService.adminUserList(uvo));
		model.addAttribute("resvList", resvList);
		model.addAttribute("oifList", OifService.adoifMain());
		return "/admin/adminMain";
	}

	// 회원 목록 전체 리스트
	@RequestMapping("/adminUserList.do")
	public String adminUserList(PagingVO pv, UserVO vo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage) {
		System.out.println("admin 컨트롤러 진입 :" + " 회원 전체 목록 ");
		String cntPerPage = "10";
		if (vo.getSearchCondition() == null)
			vo.setSearchCondition("USER_ID");
		else
			vo.setSearchCondition(vo.getSearchCondition());
		if (vo.getSearchKeyword() == null)
			vo.setSearchKeyword("");
		else
			vo.setSearchKeyword(vo.getSearchKeyword());

		int total = adminService.countAlluser(vo);
		if (nowPage == null) {
			nowPage = "1";
		}

		pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pv);
		vo.setStart(pv.getStart());
		vo.setCntPerPage(Integer.parseInt(cntPerPage));

		model.addAttribute("searchCondition", vo.getSearchCondition());
		model.addAttribute("searchKeyword", vo.getSearchKeyword());

		model.addAttribute("adminUserList", adminService.adminUserList(vo));
		return "admin/adminUserList";
	}

	// 회원 정보 상세 조회
	@RequestMapping("/adminUserInfo.do")
	public String adminUserInfo(UserVO vo, Model model) {
		model.addAttribute("user", adminService.adminUserInfo(vo));
		return "admin/adminUserInfo";
	}
	
	// 체험 상품 등록 페이지로 넘어가기
	@RequestMapping("/adminAddPlay.do")
	public String adminAddplay(PlayListVO vo, Model model) {
		System.out.println("admin 체험 상품 추가 페이지로 이동");
		List<PlayListVO> playList = playListService.getPlayList();
		
		model.addAttribute("playList", playList);
		return "admin/adminAddPlay";
	}
	
	@RequestMapping("/insertPlay.do")
	public String insertPlay(@RequestParam MultipartFile pla_filename, PlayListVO playList, HttpServletRequest request, Model model){
		System.out.println("insertPlay.do 탔음");
		System.out.println("playListVO : " + playList);
		
				// 1. 전송받은 파일 및 파일설명 값 가져오기
				System.out.println("pla_filename : " + pla_filename);
				
				// 2. 저장할 경로 가져오기
				String path = request.getSession().getServletContext().getRealPath("/resources/img");
				System.out.println("path : " + path);
				String root = path + "\\playImg" ;
				System.out.println("root : " + root);
				
				File file = new File(root);
				
				// 만약 uploadFiles 폴더가 없으면 생성해라 라는뜻
				if(!file.exists()) file.mkdirs();
				
				// 업로드할 폴더 설정
				String originFileName = pla_filename.getOriginalFilename();
				System.out.println("originFileName :" + originFileName);
				String ext = originFileName.substring(originFileName.lastIndexOf("."));
				System.out.println("ext : " + ext);
				String ranFileName = UUID.randomUUID().toString() + ext;
				System.out.println("ranFileName : " + ranFileName);
				
				File changeFile = new File(root + "\\" + ranFileName);
				System.out.println("changeFile : " + changeFile);
				System.out.println("root : " + root);
				
				// 파일업로드
				try {
					pla_filename.transferTo(changeFile);
					System.out.println("파일 업로드 성공");
				} catch (IllegalStateException | IOException e) {
					System.out.println("파일 업로드 실패");
					e.printStackTrace();
				}
				
				// DB에 넣는 작업
				String pla_img = root.substring(root.lastIndexOf("resources"));
				System.out.println("pla_img : " + pla_img);
				playList.setPla_img(pla_img+ "\\" + ranFileName);

				adminService.adminPlayInsert(playList);
				
		return "redirect:/adminAddPlay.do";
	}
	
	@RequestMapping("/deletePlay.do")
	public String delPlay(@RequestParam int pla_num) {
		System.out.println("/deletePlay.do : 체험 정보 삭제");
		adminService.adminPlayDelete(pla_num);
		return "redirect:/adminAddPlay.do";
	}
	
	//공지사항 게시판 글 목록
    @RequestMapping("/adminNoticeList.do")
    public String getNoticeListPost(PagingVO pv, NoticeVO vo, Model model,
          @RequestParam(value = "page", required = false) String nowPage) {
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
       return "admin/adminNoticeList";
    }
//	공지사항 삭제
	@RequestMapping("/adminDeleteNotice.do")
	public String deleteNotice(NoticeVO vo, HttpServletRequest request) {
		realPath = request.getSession().getServletContext().getRealPath("/resources/img/");
		if (vo.getNotice_filename() != null) {
			System.out.println("파일삭제: " + realPath + vo.getNotice_filename());
			File f = new File(realPath + vo.getNotice_filename());
			f.delete();
		}
		noticeService.deleteNotice(vo);
		return "redirect:adminNoticeList.do";
	}
//	공지사항 등록
	@GetMapping(value ="/adminInsertInfo.do")
	public String insert() {
		return "admin/adminInsertNotice";
	}
//	공지사항 상세보기
	@RequestMapping("/adminNoticeInfo.do")
	public String getNotice(@RequestParam(value="error", required = false) String error,NoticeVO vo, Model model) {
		System.out.println("관리자 공지사항 컨트롤러");
		NoticeVO mnotice = noticeService.getNotice(vo);
		int cntChk = 0;
		if (!(error==null || error.equals(""))) 
			cntChk = 0;
		else if(cntChk <= 0) noticeService.updateCntNotice(mnotice);
		else cntChk = 0;
		mnotice = noticeService.getNotice(vo);
		model.addAttribute("notice", mnotice);
		return "admin/adminNoticeListInfo";
	}
//	공지사항 게시판 글 수정
	@RequestMapping("/adminUpdateNotice.do")
	public String updateNotice(@ModelAttribute("notice") NoticeVO vo, HttpSession session) {
		cntChk++;
		noticeService.updateNotice(vo);
		return "redirect:adminNoticeInfo.do?notice_num="+vo.getNotice_num();
	}

//  Qna 목록
  @RequestMapping("/adminQnaList.do")
  public String adminQnaList(PagingVO pv, QNAVO vo, Model model, @RequestParam(value = "nowPage", required = false) String nowPage) {
     String cntPerPage = "10";
      if (vo.getSearchKeyword() == null) {
            vo.setSearchKeyword("");
         }
         if (nowPage == null) {
            nowPage = "1";
         }
         if(vo.getListcnt() < 1) {
            vo.setListcnt(Integer.parseInt(cntPerPage));
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
     return "admin/adminQnaList";
  }
//	qna 상세보기
	@RequestMapping("/adminQnaListInfo.do")
	public String getQNA(@RequestParam(value="error", required = false) String error,QNAVO vo, Model model) {
		
		QNAVO mqna = qnaService.getQNA(vo);
		
		if (!(error==null || error.equals(""))) cntChk = 0;
		else if(cntChk <= 0) qnaService.updateCntQNA(mqna);
		else cntChk = 0;
		model.addAttribute("qna", mqna);
		
		return "admin/adminQnaListInfo";
	}
	
//	qna 글삭제
	@RequestMapping("/admindeleteQNA.do")
	public String deleteQNA(QNAVO vo, HttpServletRequest request) {
		realPath = request.getSession().getServletContext().getRealPath("/resources/img/");
		if (vo.getQna_filename() != null) {
			File f = new File(realPath + vo.getQna_filename());
			f.delete();
		}
		qnaService.deleteQNA(vo);
		return "redirect:adminQnaList.do";
	}
	
	//review 게시판 글 목록
	   @RequestMapping("/adminReview.do")
	   public String getReviewListPost(PagingVO pv, ReviewVO vo, Model model,
	         @RequestParam(value = "page", required = false) String nowPage) {
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
	         vo.setSearchCondition("REVIEW_TITLE");
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
	      return "admin/adminReview";
	   }

	
	//리뷰 삭제
	@RequestMapping("/adminDeleteReview.do")
	public String deleteReview(ReviewVO vo, HttpServletRequest request) {
		realPath = request.getSession().getServletContext().getRealPath("/resources/img/");
		if (vo.getReview_filename() != null) {
			System.out.println("파일삭제: " + realPath + vo.getReview_filename());
			File f = new File(realPath + vo.getReview_filename());
			f.delete();
		}
		reviewService.deleteReview(vo);
		return "redirect:adminReview.do";
	}	
	
//	리뷰 상세 보기
	@RequestMapping("/adminReviewList.do")
	public String adminReview(@RequestParam(value="error", required = false) String error,ReviewVO vo, Model model) {
		
		ReviewVO mreview = reviewService.getReview(vo);
		if (!(error==null || error.equals(""))) cntChk = 0;
		else if(cntChk <= 0) reviewService.updateCntReview(mreview);
		else cntChk = 0;
		mreview = reviewService.getReview(vo);
		model.addAttribute("review", mreview);
		
		return "admin/adminReviewList";
	}
	// 회원 정보 수정 - 관리자
	@RequestMapping("/adminUserUpdate.do")
	public String adminUserUpdate(UserVO vo, Model model) {
		userService.updateUser(vo);
		return "redirect:adminUserList.do";		
	}

	// 회원 탈퇴 - 관리자
		@RequestMapping(value = "/adminexitUser.do")
		public String adminexitUser(UserVO vo) {
			adminService.adminUserExit(vo);
			System.out.println("exit con vo (num체크용): "+vo);
			System.out.println("관리자 회원탈퇴 up완료");
			return "redirect:/adminUserList.do";
		}

}
