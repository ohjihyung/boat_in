package kr.or.ddit.controller.member.service;

import java.util.List;

import kr.or.ddit.vo.DevinVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.QnAVO;

public interface IMypageService {

	public MemberVO selectMember(String memberId);

	public int updateMember(MemberVO memberVO);

	public int updateMemberInfo(MemberVO memberVO);

	public int updateMemberStateOfTime(String memberId);

	public int updateMemberStateOfTimeEnd(String memberId);

	public List<ProjectVO> selectMyProjetInMypage(String memberId);

	public List<QnAVO> selectMyQnAList(String memberId);

	public List<DevinVO> selectMyDevInList(String memberId);

	public int deleteMyQna(String qnaNo);

	
}
