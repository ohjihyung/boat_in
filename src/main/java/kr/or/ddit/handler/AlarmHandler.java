package kr.or.ddit.handler;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.or.ddit.mapper.AlarmMapper;
import kr.or.ddit.vo.AlarmVO;

public class AlarmHandler extends TextWebSocketHandler {

	@Inject
	AlarmMapper mapper;

	// 로그인한 사람들 담아둘 리스트 <아이디 : 소켓 >
	private static Map<String, WebSocketSession> alarmList = new HashMap<String, WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//System.out.println("ws-alarm 잘들어옴!");

	}

	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		JSONObject returnMessage = new JSONObject();
		//parser 가져오기
		JSONParser parser = new JSONParser();
		JSONObject obj = (JSONObject)parser.parse(message.getPayload());

		String myAlarmId = obj.get("myAlarmId").toString();
		String alarmContent = obj.get("alarmContent").toString();
		String alarmType = obj.get("alarmType").toString();
		String receiver = obj.get("receiver").toString();
		String myWebSession = session.getId();
		String data = obj.get("inData").toString();

		//현재 시간
		LocalDateTime now = LocalDateTime.now();
		String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		//System.out.println(formatedNow);


		System.out.println("myAlarmId : " + myAlarmId);
		System.out.println("myWebSession : " + myWebSession);
		System.out.println("alarmContent : " + alarmContent);
		System.out.println("alarmType : " + alarmType);
		System.out.println("receiver : " + receiver);
		System.out.println("data : " + data);
		System.out.println("---------------------------------------------------");
		int cnt = 1;
		//alr_t_no == 1  채팅 초대  ok
		//alr_t_no == 2  개발자 지식인 댓글 알림 ok
		//alr_t_no == 3  좋아요 알림
		//alr_t_no == 4  프로젝트 관련 알림
		//alr_t_no == 5  프로젝트 초대  ok
		//alr_t_no == 6  쪽지 알람  ok
		if(alarmType.equals("refresh")) {
			alarmList.put(myAlarmId, session);
			Iterator<String> keys = alarmList.keySet().iterator();
			while(keys.hasNext()) {
				String key = keys.next();
				System.out.println( cnt++ +"번 아이디 : "+ key.toString()+"현재 들어있는 세션 " + alarmList.get(key).getId().toString());
				System.out.println("--------------------------------------------------------------------------------------");
			}
		}

		if(alarmType.equals("like")) {
			AlarmVO alarmVO = new AlarmVO();
			alarmVO.setAlrTNo("3");
			alarmVO.setAlarmContent(alarmContent);
			alarmVO.setAlarmSender(myAlarmId);
			alarmVO.setMemberId(receiver);
		    JSONObject datas = (JSONObject)parser.parse(data);
			String dviNo = datas.get("dviNo").toString();
			String receiverId = datas.get("receiverId").toString();
			alarmVO.setAlarmData(dviNo);
			alarmVO.setAlarmData2(receiverId);
			alarmVO.setAlarmDate(formatedNow);
			mapper.insertAlarmTwoData(alarmVO); // 알림 DB 삽입
			String sender = mapper.getMemNameById(myAlarmId); // 보내는 사람 이름 빼올라고
			//System.out.println(sender);
			String alarmNo = alarmVO.getAlarmNo();

			returnMessage.put("sender", sender);
			returnMessage.put("receiver", receiver);
			returnMessage.put("alarmContent", alarmContent);
			returnMessage.put("alarmData", dviNo);
			returnMessage.put("alarmData2", receiverId);
			returnMessage.put("alarmType", "3");
			returnMessage.put("Time", formatedNow);
			returnMessage.put("alarmNo", alarmNo);

			Iterator<String> keys = alarmList.keySet().iterator();
			while(keys.hasNext() ){
				String key = keys.next();
				if(key.equals(receiver)) {
					alarmList.get(key).sendMessage(new TextMessage(returnMessage.toJSONString()));
				}
			}
		}

		//채팅에 초대되었을때의 알람
		if(alarmType.equals("inviteChat")) {

			AlarmVO alarmVO = new AlarmVO();
			alarmVO.setAlrTNo("1");
			alarmVO.setAlarmContent(alarmContent);
			alarmVO.setAlarmSender(myAlarmId);
			alarmVO.setMemberId(receiver);
			alarmVO.setAlarmData(data);
			alarmVO.setAlarmDate(formatedNow);
			mapper.insertAlarm(alarmVO); // 알림 DB 삽입
			String sender = mapper.getMemNameById(myAlarmId); // 보내는 사람 이름 빼올라고
			//System.out.println(sender);
			String alarmNo = alarmVO.getAlarmNo();

			returnMessage.put("sender", sender);
			returnMessage.put("receiver", receiver);
			returnMessage.put("alarmContent", alarmContent);
			returnMessage.put("roomNM", data);
			returnMessage.put("alarmType", "1");
			returnMessage.put("Time", formatedNow);
			returnMessage.put("alarmNo", alarmNo);


			Iterator<String> keys = alarmList.keySet().iterator();
			while(keys.hasNext() ){
				String key = keys.next();
				if(key.equals(receiver)) {
					alarmList.get(key).sendMessage(new TextMessage(returnMessage.toJSONString()));
				}
			}
		} //end of inviteChat

		//지식인에 내 댓글에 다른사람이 썼을 때
		if(alarmType.equals("comment")) {
			AlarmVO alarmVO = new AlarmVO();
			alarmVO.setAlrTNo("2");
			JSONObject datas = (JSONObject)parser.parse(data);
			String dviNo = datas.get("dviNo").toString();
			String dvinOwner = datas.get("dvinOwner").toString();
			alarmVO.setAlarmContent(alarmContent);
			alarmVO.setAlarmSender(myAlarmId);
			alarmVO.setMemberId(receiver);
			alarmVO.setAlarmData(dviNo);
			alarmVO.setAlarmData2(dvinOwner);
			alarmVO.setAlarmDate(formatedNow);
			mapper.insertAlarmTwoData(alarmVO); // 알림 DB 삽입
			String sender = mapper.getMemNameById(myAlarmId); // 보내는 사람 이름 빼올라고
			//System.out.println("보내는 사람 " + sender);
			String alarmNo = alarmVO.getAlarmNo();
			returnMessage.put("sender", sender);
			returnMessage.put("receiver", receiver);
			returnMessage.put("alarmContent", alarmContent);
			returnMessage.put("alarmData", dviNo);
			returnMessage.put("alarmData2", dvinOwner);
			returnMessage.put("alarmType", "2");
			returnMessage.put("Time", formatedNow);
			returnMessage.put("alarmNo", alarmNo);

			Iterator<String> keys = alarmList.keySet().iterator();
			while(keys.hasNext() ){
				String key = keys.next();
				if(key.equals(receiver)) {
					alarmList.get(key).sendMessage(new TextMessage(returnMessage.toJSONString()));
				}
			}
		} //end of comment

		//새로운 프로젝트에 초대되었을때
		if(alarmType.equals("proinvite")) {
			AlarmVO alarmVO = new AlarmVO();
			alarmVO.setAlrTNo("5");
			alarmVO.setAlarmContent(alarmContent);
			alarmVO.setAlarmSender(myAlarmId);
			alarmVO.setMemberId(receiver);
			alarmVO.setAlarmData(data);
			alarmVO.setAlarmDate(formatedNow);
			mapper.insertAlarm(alarmVO); // 알림 DB 삽입
			String sender = mapper.getMemNameById(myAlarmId); // 보내는 사람 이름 빼올라고
			String alarmNo = alarmVO.getAlarmNo();
			returnMessage.put("sender", sender);
			returnMessage.put("receiver", receiver);
			returnMessage.put("alarmContent", alarmContent);
			returnMessage.put("alarmData", data);
			returnMessage.put("alarmType", "5");
			returnMessage.put("alarmNo", alarmNo);
			returnMessage.put("Time", formatedNow);

			Iterator<String> keys = alarmList.keySet().iterator();
			while(keys.hasNext() ){
				String key = keys.next();
				if(key.equals(receiver)) {
					alarmList.get(key).sendMessage(new TextMessage(returnMessage.toJSONString()));
				}
			}
		}//end of proinvite

		//프로젝트에 공지사항
		if(alarmType.equals("projectNotice")) {
			  AlarmVO alarmVO = new AlarmVO();
			  alarmVO.setAlrTNo("4");
			  alarmVO.setAlarmContent(alarmContent);
			  alarmVO.setAlarmSender(myAlarmId);
			  alarmVO.setMemberId(receiver);
			  String sender = mapper.getMemNameById(myAlarmId); // 보내는 사람 이름 빼올라고
			  //공지사항일 경우에 data 2개 필요  // 프로젝트 번호, 공지사항 번호
			  JSONObject datas = (JSONObject)parser.parse(data);
			  String proNo = datas.get("proNo").toString();
			  String proNoticeNo = datas.get("proNoticeNo").toString();
			  alarmVO.setAlarmData(proNo);
			  alarmVO.setAlarmData2(proNoticeNo);
			  alarmVO.setAlarmDate(formatedNow);
			  mapper.insertAlarmTwoData(alarmVO); // 알림 DB 삽입
			  String alarmNo = alarmVO.getAlarmNo();  //selected key 사용해서 값 가져오기
			  returnMessage.put("sender", sender);
			  returnMessage.put("receiver", receiver);
			  returnMessage.put("alarmContent", alarmContent);
			  returnMessage.put("alarmData", proNo);
			  returnMessage.put("alarmData2", proNoticeNo);
			  returnMessage.put("alarmType","4");
			  returnMessage.put("projectAlarmType","projectNotice");
			  returnMessage.put("Time", formatedNow);
			  returnMessage.put("alarmNo", alarmNo);
			  Iterator<String> keys = alarmList.keySet().iterator();
			  while(keys.hasNext()){
				  String key = keys.next();
				  if(key.equals(receiver)) {
					  alarmList.get(key).sendMessage(new TextMessage(returnMessage.toJSONString()));
				  }
			  }
		}//end of proinvite

		//프로젝트에 상위작업 추가시
		if(alarmType.equals("TopWorkInsertAlarm")) {
			if(myAlarmId != receiver) {
			AlarmVO alarmVO = new AlarmVO();
			alarmVO.setAlrTNo("4");
			alarmVO.setAlarmContent(alarmContent);
			alarmVO.setAlarmSender(myAlarmId);
			alarmVO.setMemberId(receiver);
			String sender = mapper.getMemNameById(myAlarmId); // 보내는 사람 이름 빼올라고
			//공지사항일 경우에 data 2개 필요  // 프로젝트 번호, 공지사항 번호
			JSONObject datas = (JSONObject)parser.parse(data);
			String proNo = datas.get("proNo").toString();
			String topWorkNo = datas.get("topWorkNo").toString();
			alarmVO.setAlarmData(proNo);
			alarmVO.setAlarmData2(topWorkNo);
			alarmVO.setAlarmDate(formatedNow);
			mapper.insertAlarmTwoData(alarmVO); // 알림 DB 삽입
			String alarmNo = alarmVO.getAlarmNo();
			returnMessage.put("sender", sender);
			returnMessage.put("receiver", receiver);
			returnMessage.put("alarmContent", alarmContent);
			returnMessage.put("alarmData", proNo);
			returnMessage.put("alarmData2", topWorkNo);
			returnMessage.put("alarmType","4");
			returnMessage.put("Time", formatedNow);
			returnMessage.put("projectAlarmType","TopWorkInsertAlarm");
			returnMessage.put("alarmNo",alarmNo);

			Iterator<String> keys = alarmList.keySet().iterator();
			while(keys.hasNext()){
				String key = keys.next();
				if(key.equals(receiver)) {
					alarmList.get(key).sendMessage(new TextMessage(returnMessage.toJSONString()));
					}
				}
		}
	}//end of TopWorkInsertAlarm
		//프로젝트에 하위작업 글 올시
		if(alarmType.equals("SubWorkComentAlarm")) {
			if(myAlarmId != receiver) {
				AlarmVO alarmVO = new AlarmVO();
				alarmVO.setAlrTNo("4");
				alarmVO.setAlarmContent(alarmContent);
				alarmVO.setAlarmSender(myAlarmId);
				alarmVO.setMemberId(receiver);
				String sender = mapper.getMemNameById(myAlarmId); // 보내는 사람 이름 빼올라고
				//공지사항일 경우에 data 2개 필요  // 프로젝트 번호, 공지사항 번호
				JSONObject datas = (JSONObject)parser.parse(data);
				String proNo = datas.get("proNo").toString();
				String topWorkNo = datas.get("topWorkNo").toString();
				alarmVO.setAlarmData(proNo);
				alarmVO.setAlarmData2(topWorkNo);
				alarmVO.setAlarmDate(formatedNow);
				mapper.insertAlarmTwoData(alarmVO); // 알림 DB 삽입
				String alarmNo = alarmVO.getAlarmNo();
				returnMessage.put("sender", sender);
				returnMessage.put("receiver", receiver);
				returnMessage.put("alarmContent", alarmContent);
				returnMessage.put("alarmData", proNo);
				returnMessage.put("alarmData2", topWorkNo);
				returnMessage.put("alarmType","4");
				returnMessage.put("Time", formatedNow);
				returnMessage.put("projectAlarmType"," SubWorkComentAlarm");
				returnMessage.put("alarmNo",alarmNo);

				Iterator<String> keys = alarmList.keySet().iterator();
				while(keys.hasNext()){
					String key = keys.next();
					if(key.equals(receiver)) {
						alarmList.get(key).sendMessage(new TextMessage(returnMessage.toJSONString()));
					}
				}
			}
		}//end of TopWorkInsertAlarm

		//상위작업 승인대기 시
		if(alarmType.equals("WorkRecognizeWaitingAlarm")) {
			if(myAlarmId != receiver) {
				AlarmVO alarmVO = new AlarmVO();
				alarmVO.setAlrTNo("4");
				alarmVO.setAlarmContent(alarmContent);
				alarmVO.setAlarmSender(myAlarmId);
				alarmVO.setMemberId(receiver);
				String sender = mapper.getMemNameById(myAlarmId); // 보내는 사람 이름 빼올라고
				//공지사항일 경우에 data 2개 필요  // 프로젝트 번호, 공지사항 번호
				JSONObject datas = (JSONObject)parser.parse(data);
				String proNo = datas.get("proNo").toString();
				String topWorkNo = datas.get("topWorkNo").toString();
				alarmVO.setAlarmData(proNo);
				alarmVO.setAlarmData2(topWorkNo);
				alarmVO.setAlarmDate(formatedNow);
				mapper.insertAlarmTwoData(alarmVO); // 알림 DB 삽입
				String alarmNo = alarmVO.getAlarmNo();
				returnMessage.put("sender", sender);
				returnMessage.put("receiver", receiver);
				returnMessage.put("alarmContent", alarmContent);
				returnMessage.put("alarmData", proNo);
				returnMessage.put("alarmData2", topWorkNo);
				returnMessage.put("alarmType","4");
				returnMessage.put("projectAlarmType","WorkRecognizeWaitingAlarm");
				returnMessage.put("alarmNo",alarmNo);
				returnMessage.put("Time", formatedNow);

				Iterator<String> keys = alarmList.keySet().iterator();
				while(keys.hasNext()){
					String key = keys.next();
					if(key.equals(receiver)) {
						alarmList.get(key).sendMessage(new TextMessage(returnMessage.toJSONString()));
					}
				}
			}
		}//end of TopWorkInsertAlarm

		//프로젝트에 상위작업 댓글 추가
		if(alarmType.equals("TopWorkComentAlarm")) {
			if(myAlarmId != receiver) {
				AlarmVO alarmVO = new AlarmVO();
				alarmVO.setAlrTNo("4");
				alarmVO.setAlarmContent(alarmContent);
				alarmVO.setAlarmSender(myAlarmId);
				alarmVO.setMemberId(receiver);
				String sender = mapper.getMemNameById(myAlarmId); // 보내는 사람 이름 빼올라고
				//공지사항일 경우에 data 2개 필요  // 프로젝트 번호, 공지사항 번호
				JSONObject datas = (JSONObject)parser.parse(data);
				String proNo = datas.get("proNo").toString();
				String topWorkNo = datas.get("topWorkNo").toString();
				alarmVO.setAlarmData(proNo);
				alarmVO.setAlarmData2(topWorkNo);
				alarmVO.setAlarmDate(formatedNow);
				mapper.insertAlarmTwoData(alarmVO); // 알림 DB 삽입
				String alarmNo = alarmVO.getAlarmNo();
				//System.out.println("실시간 알람 번호 :" + alarmNo);
				returnMessage.put("sender", sender);
				returnMessage.put("receiver", receiver);
				returnMessage.put("alarmContent", alarmContent);
				returnMessage.put("alarmData", proNo);
				returnMessage.put("alarmData2", topWorkNo);
				returnMessage.put("alarmType","4");
				returnMessage.put("projectAlarmType","TopWorkComentAlarm");
				returnMessage.put("alarmNo", alarmNo);
				returnMessage.put("Time", formatedNow);

				Iterator<String> keys = alarmList.keySet().iterator();
				while(keys.hasNext()){
					String key = keys.next();
					if(key.equals(receiver)) {
						alarmList.get(key).sendMessage(new TextMessage(returnMessage.toJSONString()));
					}
				}
			}
		}//end of TopWorkComentAlarm

		//프로젝트 작업 승인 완료
		if(alarmType.equals("WorkRecognizeAlarm")) {
			if(myAlarmId != receiver) {
				AlarmVO alarmVO = new AlarmVO();
				alarmVO.setAlrTNo("4");
				alarmVO.setAlarmContent(alarmContent);
				alarmVO.setAlarmSender(myAlarmId);
				alarmVO.setMemberId(receiver);
				String sender = mapper.getMemNameById(myAlarmId); // 보내는 사람 이름 빼올라고
				//공지사항일 경우에 data 2개 필요  // 프로젝트 번호, 공지사항 번호
				JSONObject datas = (JSONObject)parser.parse(data);
				String proNo = datas.get("proNo").toString();
				String topWorkNo = datas.get("topWorkNo").toString();
				alarmVO.setAlarmData(proNo);
				alarmVO.setAlarmData2(topWorkNo);
				alarmVO.setAlarmDate(formatedNow);
				mapper.insertAlarmTwoData(alarmVO); // 알림 DB 삽입
				String alarmNo = alarmVO.getAlarmNo();
				//System.out.println("실시간 알람 번호 :" + alarmNo);
				returnMessage.put("sender", sender);
				returnMessage.put("receiver", receiver);
				returnMessage.put("alarmContent", alarmContent);
				returnMessage.put("alarmData", proNo);
				returnMessage.put("alarmData2", topWorkNo);
				returnMessage.put("alarmType","4");
				returnMessage.put("projectAlarmType","WorkRecognizeAlarm");
				returnMessage.put("alarmNo", alarmNo);
				returnMessage.put("Time", formatedNow);

				Iterator<String> keys = alarmList.keySet().iterator();
				while(keys.hasNext()){
					String key = keys.next();
					if(key.equals(receiver)) {
						alarmList.get(key).sendMessage(new TextMessage(returnMessage.toJSONString()));
					}
				}
			}
		}//end of WorkRecognizeAlarm

		//프로젝트 작업 반려
		if(alarmType.equals("WorkRecognizeReferAlarm")) {
			if(myAlarmId != receiver) {
				AlarmVO alarmVO = new AlarmVO();
				alarmVO.setAlrTNo("4");
				alarmVO.setAlarmContent(alarmContent);
				alarmVO.setAlarmSender(myAlarmId);
				alarmVO.setMemberId(receiver);
				String sender = mapper.getMemNameById(myAlarmId); // 보내는 사람 이름 빼올라고
				//공지사항일 경우에 data 2개 필요  // 프로젝트 번호, 공지사항 번호
				JSONObject datas = (JSONObject)parser.parse(data);
				String proNo = datas.get("proNo").toString();
				String topWorkNo = datas.get("topWorkNo").toString();
				alarmVO.setAlarmData(proNo);
				alarmVO.setAlarmData2(topWorkNo);
				alarmVO.setAlarmDate(formatedNow);
				mapper.insertAlarmTwoData(alarmVO); // 알림 DB 삽입
				String alarmNo = alarmVO.getAlarmNo();
				//System.out.println("실시간 알람 번호 :" + alarmNo);
				returnMessage.put("sender", sender);
				returnMessage.put("receiver", receiver);
				returnMessage.put("alarmContent", alarmContent);
				returnMessage.put("alarmData", proNo);
				returnMessage.put("alarmData2", topWorkNo);
				returnMessage.put("alarmType","4");
				returnMessage.put("projectAlarmType","WorkRecognizeReferAlarm");
				returnMessage.put("alarmNo", alarmNo);
				returnMessage.put("Time", formatedNow);

				Iterator<String> keys = alarmList.keySet().iterator();
				while(keys.hasNext()){
					String key = keys.next();
					if(key.equals(receiver)) {
						alarmList.get(key).sendMessage(new TextMessage(returnMessage.toJSONString()));
					}
				}
			}
		}//end of WorkRecognizeAlarm

		//쪽지 보냈을때
		if(alarmType.equals("sendLetter")) {
			AlarmVO alarmVO = new AlarmVO();
			alarmVO.setAlrTNo("6");
			alarmVO.setAlarmContent(alarmContent);
			alarmVO.setAlarmSender(myAlarmId);
			alarmVO.setMemberId(receiver);
			alarmVO.setAlarmData(data);
			alarmVO.setAlarmDate(formatedNow);
			mapper.insertAlarm(alarmVO); // 알림 DB 삽입
			String alarmNo = alarmVO.getAlarmNo();
			//System.out.println("실시간 알람 번호 :" + alarmNo);
			String sender = mapper.getMemNameById(myAlarmId); // 보내는 사람 이름 빼올라고
			//System.out.println("보내는 사람 " + sender);

			returnMessage.put("sender", sender);
			returnMessage.put("receiver", receiver);
			returnMessage.put("alarmContent", alarmContent);
			returnMessage.put("roomNM", data);
			returnMessage.put("alarmType", "6");
			returnMessage.put("alarmNo", alarmNo);
			returnMessage.put("Time", formatedNow);


			Iterator<String> keys = alarmList.keySet().iterator();
			while(keys.hasNext() ){
				String key = keys.next();
				if(key.equals(receiver)) {
					alarmList.get(key).sendMessage(new TextMessage(returnMessage.toJSONString()));
				}
			}
		} //end of sendLetter
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

	}

}
