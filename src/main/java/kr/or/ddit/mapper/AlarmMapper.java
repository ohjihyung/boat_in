package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.AlarmVO;

public interface AlarmMapper {

	void insertAlarm(AlarmVO alarmVO) throws Exception;

	String getMemNameById(String myAlarmId) throws Exception;

	List<AlarmVO> getUnreadAlarm(AlarmVO alarmVO) throws Exception;

	int deleteAllAlarm(String memberId)throws Exception;

	int insertAlarmTwoData(AlarmVO alarmVO) throws Exception;

	int makeReadAlarm(AlarmVO vo) throws Exception;



}
