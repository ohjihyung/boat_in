package kr.or.ddit.controller.cs;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.controller.cs.service.INoticeService;
import kr.or.ddit.vo.NoticeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	INoticeService noticeService;

	/**
	 * 공지사항 홈 화면
	 * @return notice.jsp
	 */
	@GetMapping("/noticeMain")
	public String noticeMain() {
		return "content/notice";
	}
	
	
	/**
	 * 공지사항 리스트
	 * @param noticeVO
	 * @return noticeList
	 * @throws Exception
	 */
    @GetMapping(value = "/noticeList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<NoticeVO> noticeList(@RequestParam(name = "category", required = false) String category) throws Exception {
		
		List<NoticeVO> noticeList = new ArrayList<NoticeVO>();
		
		if (category == null) {
			noticeList = noticeService.getNoticeList();
			
		} else {
			if (category.equals("work")) {
				noticeList = noticeService.getNoticeList_work();	
			}
			if (category.equals("service")) {
				noticeList = noticeService.getNoticeList_service();	
			}
			if (category.equals("update")) {
				noticeList = noticeService.getNoticeList_update();	
			}
		}
		
		
		return noticeList;
	}




	@PostMapping(value = "/noticeDetail", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public NoticeVO noticeDetail(@RequestBody NoticeVO noticeVO) throws Exception {
		log.debug("공지사항디테일 {} ", noticeVO);
		NoticeVO detail = noticeService.getDetail(noticeVO);
		
		return detail;
	}
	
	@PostMapping(value = "/noticeInsert", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public NoticeVO noticeInsert(@RequestBody NoticeVO noticeVO) throws Exception {
		log.debug("공지사항인서트 {} ", noticeVO);
		NoticeVO detail = noticeService.noticeInsert(noticeVO);
		
		return detail;
	}
	
	@PostMapping(value = "/updateNotice", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String updateNotice(@RequestBody NoticeVO noticeVO) throws Exception {
		noticeService.updateNotice(noticeVO);
		
		return noticeVO.getSysNNo();
	}
	
	@PostMapping(value = "/hitUp", produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String hitUp(@RequestBody NoticeVO noticeVO) throws Exception {
		log.debug("조회수 올리러 : {}", noticeVO);
		noticeService.hitUp(noticeVO);
		log.debug("조회수 올린 : {}", noticeVO);
		
		return "조회수 업";
	}

	@PostMapping(value = "/noticeDelete", produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String noticeDelete(@RequestBody NoticeVO noticeVO) throws Exception {
		noticeService.noticeDelete(noticeVO);
		
		return "삭제 완료~";
	}

	

























}

