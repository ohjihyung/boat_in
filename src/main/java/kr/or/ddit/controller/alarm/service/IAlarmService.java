package kr.or.ddit.controller.alarm.service;

import java.util.List;

import kr.or.ddit.vo.AlarmVO;

public interface IAlarmService {

	List<AlarmVO> getUnreadAlarm(AlarmVO alarmVO) throws Exception;

	int deleteAllAlarm(String memberId)throws Exception;

	int makeReadAlarm(AlarmVO vo) throws Exception;

}
