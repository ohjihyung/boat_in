package kr.or.ddit.controller.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.MypageMapper;
import kr.or.ddit.vo.DevinVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.QnAVO;

@Service
public class MypageServiceImpl implements IMypageService {

	@Inject
	MypageMapper mapper;

	@Override
	public MemberVO selectMember(String memberId) {
		return mapper.selectMember(memberId);
	}

	@Override
	public int updateMember(MemberVO memberVO) {
		return mapper.updateMember(memberVO);
	}

	@Override
	public int updateMemberInfo(MemberVO memberVO) {
		return mapper.updateMemberInfo(memberVO);
	}

	@Override
	public int updateMemberStateOfTime(String memberId) {
		return mapper.updateMemberStateOfTime(memberId);
	}

	@Override
	public int updateMemberStateOfTimeEnd(String memberId) {
		return mapper.updateMemberStateOfTimeEnd(memberId);
	}

	@Override
	public List<ProjectVO> selectMyProjetInMypage(String memberId) {
		return mapper.selectMyProjetInMypage(memberId);
	}

	@Override
	public List<QnAVO> selectMyQnAList(String memberId) {
		return mapper.selectMyQnAList(memberId);
	}

	@Override
	public List<DevinVO> selectMyDevInList(String memberId) {
		return mapper.selectMyDevInList(memberId);
	}

	@Override
	public int deleteMyQna(String qnaNo) {
		return mapper.deleteMyQna(qnaNo);
	}
	
	
}
