package kr.or.ddit.controller.cs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.controller.cs.service.IFAQService;
import kr.or.ddit.vo.FAQVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/faq")
public class FAQController {
	
	@Autowired
	IFAQService faqService;
	
	
	/**
	 * FAQ 홈 화면
	 * @return faq.jsp 
	 */
	@GetMapping("/faqMain")
	public String myDataList() {
		return "content/faq";
	}
	
	
	/**
	 * FAQ 리스트 가져오기
	 * @return FAQ 데이터가 담긴 리스트
	 * @throws Exception
	 */
	@PostMapping(value = "/faqList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<FAQVO> faqList() throws Exception {
		
		List<FAQVO> faqList = faqService.getFaqList();
		log.debug("faqList : {}", faqList.toString());
		
		return faqList;
	}
	
	
	/**
	 * FAQ 입력하기
	 * @param faqVO
	 * @return insertFaqRow - 성공 1, 실패 0
	 * @throws Exception
	 */
	@PostMapping(value = "/faqInsert", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int faqInsert(@RequestBody FAQVO faqVO) throws Exception {
		
		log.debug("faqVO : {}", faqVO);
		int insertFaqRow = faqService.insertFaqRow(faqVO);
		
		return insertFaqRow;
	}
	
	
	/**
	 * FAQ 데이터 수정하기
	 * @param faqVO
	 * @return updateFaqRow - 성공 1, 실패 0
	 * @throws Exception 
	 */
	@PostMapping(value = "/faqUpdate", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int faqUpdate(@RequestBody FAQVO faqVO) throws Exception {
		
		log.debug("faqVO : {}", faqVO);
		int updateFaqRow = faqService.updateFaqList(faqVO);
		
		return updateFaqRow;
		
	}
	
	
	
	/**
	 * FAQ 데이터 삭제하기
	 * @param faqVO
	 * @return deleteFaqRow - 성공 1, 실패 0
	 * @throws Exception 
	 */
	@PostMapping(value = "/faqDelete", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int faqDelete(@RequestBody FAQVO faqVO) throws Exception {
		
		log.debug("faqVO : {}", faqVO);
		int deleteFaqRow = faqService.deleteFaqRow(faqVO);
		
		return deleteFaqRow;
	}
	
	

}
