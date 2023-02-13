package kr.or.ddit.controller.oneoone.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.QnaMapper;
import kr.or.ddit.vo.QnAVO;

@Service
public class QnaServiceImpl implements IQnaService {


	@Inject
	QnaMapper mapper;

	@Override
	public int insertQna(QnAVO qnaVO) throws Exception {
		// TODO Auto-generated method stub
		return mapper.insertQna(qnaVO);
	}

	@Override
	public List<QnAVO> selectAllQna() throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectAllQna();
	}

	@Override
	public List<QnAVO> selectUncomment() throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectUncomment();
	}

	@Override
	public List<QnAVO> selectcomment() throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectcomment();
	}

	@Override
	public QnAVO getQnaDetail(String qnaNo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.getQnaDetail(qnaNo);
	}

	@Override
	public int adminAnswer(QnAVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.adminAnswer(vo);
	}

}
