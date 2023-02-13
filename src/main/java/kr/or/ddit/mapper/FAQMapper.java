package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.FAQVO;

public interface FAQMapper {

	List<FAQVO> getFaqList();

	int insertFaqRow(FAQVO faqVO);

	int updateFaqList(FAQVO faqVO);

	int deleteFaqRow(FAQVO faqVO);
	
}
