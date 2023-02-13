package kr.or.ddit.controller.oneoone.service;

import java.util.List;

import kr.or.ddit.vo.QnAVO;

public interface IQnaService {

	int insertQna(QnAVO qnaVO) throws Exception;

	List<QnAVO> selectAllQna() throws Exception;

	List<QnAVO> selectUncomment() throws Exception;

	List<QnAVO> selectcomment() throws Exception;

	QnAVO getQnaDetail(String qnaNo) throws Exception;

	int adminAnswer(QnAVO vo) throws Exception;

}
