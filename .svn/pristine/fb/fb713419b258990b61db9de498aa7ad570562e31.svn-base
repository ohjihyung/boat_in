package kr.or.ddit.controller.alarm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.AlarmMapper;
import kr.or.ddit.vo.AlarmVO;

@Service
public class AlarmServiceImpl implements IAlarmService{

	@Autowired
	AlarmMapper mapper;


	@Override
	public List<AlarmVO> getUnreadAlarm(AlarmVO alarmVO) throws Exception {
		// TODO Auto-generated method stub
		return mapper.getUnreadAlarm(alarmVO);
	}


	@Override
	public int deleteAllAlarm(String memberId) throws Exception {
		// TODO Auto-generated method stub
		return mapper.deleteAllAlarm(memberId);
	}


	@Override
	public int makeReadAlarm(AlarmVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.makeReadAlarm(vo);
	}

}
