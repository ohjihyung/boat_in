package kr.or.ddit.controller.cs.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.FAQMapper;
import kr.or.ddit.vo.FAQVO;

@Service
public class FAQServiceImpl implements IFAQService {

	@Autowired
	private FAQMapper faqMapper;
	
	// SSY FAQ리스트 가져오기
	@Override
	public List<FAQVO> getFaqList() {
		return faqMapper.getFaqList();
	}

	// SSY 받은 FAQ 데이터 입력하기
	@Override
	public int insertFaqRow(FAQVO faqVO) {
		int insertFaqRow = faqMapper.insertFaqRow(faqVO);
		return insertFaqRow;
	}

	// SSY FAQ 데이터 수정하기
	@Override
	public int updateFaqList(FAQVO faqVO) {
		int updateFaqRow = faqMapper.updateFaqList(faqVO);
		return updateFaqRow;
	}

	// SSY FAQ 데이터 삭제하기
	@Override
	public int deleteFaqRow(FAQVO faqVO) {
		int deleteFaqRow = faqMapper.deleteFaqRow(faqVO);
		return deleteFaqRow;
	}

}
