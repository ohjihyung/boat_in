package kr.or.ddit.controller.myhome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.MyHomeMapper;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MyhomeVO;
import kr.or.ddit.vo.QnAVO;
import kr.or.ddit.vo.TopWorkVO;

@Service
public class MyhomeServiceImpl implements IMyhomeService {

    @Inject
    MyHomeMapper mapper;

    @Override
    public MemberVO selectMemberInfo(MemberVO memberVO) {
        return mapper.selectMemberInfo(memberVO);
    }

    @Override
    public int updateMyHomeColor(MyhomeVO myhomeVO) {
        return mapper.updateMyHomeColor(myhomeVO);
    }

    @Override
    public MyhomeVO selectMyhome(MemberVO memberVO) {
        return mapper.selectMyhome(memberVO);
    }

    @Override
    public int insertMyhomeMemberId(MemberVO memberVO) {
        return mapper.insertMyhomeMemberId(memberVO);
    }

    @Override
    public List<AlarmVO> selectMyAllAlarm(MemberVO memberVO) {
        return mapper.selectMyAllAlarm(memberVO);
    }

    @Override
    public List<TopWorkVO> outOfdeadlineWorkList(MemberVO memberVO) {
        return mapper.outOfdeadlineWorkList(memberVO);
    }

    @Override
    public List<TopWorkVO> before3daysWorkList(MemberVO memberVO) {
        return mapper.before3daysWorkList(memberVO);
    }

	@Override
	public List<QnAVO> qnaNoAnswerList() {
		return mapper.qnaNoAnswerList();
	}

}
