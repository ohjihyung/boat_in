package kr.or.ddit.controller.alarm;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.controller.alarm.service.IAlarmService;
import kr.or.ddit.controller.member.service.IMemberService;
import kr.or.ddit.vo.AlarmVO;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/alarm")
public class AlarmController {

	@Inject
	IAlarmService alarmService;

	@Inject
	IMemberService memberService;

	@PostMapping(value="/getUnreadAlarm", produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<List<AlarmVO>> getUnreadAlarm(@RequestBody Map<String, String> data) throws Exception{

		String memberId  = data.get("memberId").toString();
		//log.debug("memberId in getUnreadAlarm : {}", memberId);

		List<AlarmVO> myAlarmList = new ArrayList<AlarmVO>();
		AlarmVO alarmVO = new AlarmVO();
		alarmVO.setMemberId(memberId);

		myAlarmList = alarmService.getUnreadAlarm(alarmVO); // 전체 갯수
		for(AlarmVO  v : myAlarmList) {
			String senderName = memberService.getUserNameById(v.getAlarmSender());
			//log.debug(senderName);
			v.setAlarmSender(senderName);

		}

		//log.info(myAlarmList.toString());
		return new ResponseEntity<List<AlarmVO>>(myAlarmList, HttpStatus.OK);
	}

	@PostMapping(value="/deleteAllAlarm", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String deleteAllAlarm(@RequestBody Map<String, String> data) throws Exception{

		String memberId  = data.get("memberId").toString();
		alarmService.deleteAllAlarm(memberId);

		return "allDel";
	}
	@PostMapping(value="/makeReadAlarm", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String makeReadAlarm(@RequestBody Map<String, String> data) throws Exception{
		String alarmNo = data.get("alarmNo").toString();
		AlarmVO vo = new AlarmVO();
		vo.setAlarmNo(alarmNo);
		int res = alarmService.makeReadAlarm(vo);
		return "success";
	}

}
