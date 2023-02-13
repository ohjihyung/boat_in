package kr.or.ddit.mapper;


import java.util.List;

import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MyhomeVO;
import kr.or.ddit.vo.QnAVO;
import kr.or.ddit.vo.TopWorkVO;

public interface MyHomeMapper {

	public MemberVO selectMemberInfo(MemberVO memberVO);

	public int updateMyHomeColor(MyhomeVO myhomeVO);

	public MyhomeVO selectMyhome(MemberVO memberVO);

	public int insertMyhomeMemberId(MemberVO memberVO);

	public List<AlarmVO> selectMyAllAlarm(MemberVO memberVO);

	public List<TopWorkVO> outOfdeadlineWorkList(MemberVO memberVO);

	public List<TopWorkVO> before3daysWorkList(MemberVO memberVO);

	public List<QnAVO> qnaNoAnswerList();


}
