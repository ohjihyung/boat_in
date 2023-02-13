package kr.or.ddit.controller.oneoone;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.controller.oneoone.service.IQnaService;
import kr.or.ddit.vo.QnAVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/oneoone")
public class OneoOneController {

	@Inject
	IQnaService qnaService;

	@GetMapping("/question")
	public String goOneoOne() {
		log.debug("question에 잘들어옴");
		return "content/oneoone";
	}

	@PostMapping(value ="/questionInsert", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String questionInsert(@RequestBody Map<String, String> data ) throws Exception {

		log.debug("questionInsert 들어옴");
		String id = data.get("Id").toString();
		String title = data.get("title").toString();
		String content = data.get("content").toString();
		String contentType = data.get("contentType").toString();

		QnAVO qnaVO = new QnAVO();
		qnaVO.setMemberId(id);
		qnaVO.setQnaContent(content);
		qnaVO.setQnaType(contentType);
		qnaVO.setQnaTitle(title);

		int res = qnaService.insertQna(qnaVO) ;

		/*
		 * log.debug("작성자 아이디 : {}",id); log.debug("제목 : {}",title);
		 * log.debug("내용 : {}",content); log.debug("질문 종류 : {}",contentType);
		 */


		return String.valueOf(res);
	}
	@PostMapping(value ="/showUncomment", produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<QnAVO> showUncomment() throws Exception {

		List<QnAVO> qnaList = new ArrayList<QnAVO>();
		qnaList = qnaService.selectUncomment();

		return qnaList;
	}

	@PostMapping(value ="/showcomment", produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<QnAVO> showcomment() throws Exception {

		List<QnAVO> qnaList = new ArrayList<QnAVO>();
		qnaList = qnaService.selectcomment();
		return qnaList;
	}

	@PostMapping(value ="/showDetail", produces = "application/json; charset=utf-8")
	@ResponseBody
	public QnAVO showDetail(@RequestBody Map<String, String> data) throws Exception {
		String qnaNo = data.get("qnaNo").toString();
		QnAVO vo = new QnAVO();
		vo = qnaService.getQnaDetail(qnaNo);
		return vo;
	}

	//관리자가 해당 1대1 문의글 작성
	@PostMapping(value ="/adminAnswer", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String adminAnswer(@RequestBody Map<String, String> data) throws Exception {
		 String qnaNo = data.get("qnaNo").toString();
		 String adminComment = data.get("qnaAnswer").toString();

		 //log.debug("질문번호 : {}", qnaNo);
		 //log.debug("질문답변 : {}", adminComment);
		 QnAVO vo = new QnAVO();
		 vo.setQnaNo(qnaNo);
		 vo.setQnaAnswer(adminComment);

		 int res = qnaService.adminAnswer(vo);


		 return "success";
	}


}
