package kr.or.ddit.controller.chat;

import java.io.File;
import java.nio.file.Files;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import kr.or.ddit.controller.chat.service.IChatService;
import kr.or.ddit.controller.member.service.IMemberService;
import kr.or.ddit.vo.ChatContentVO;
import kr.or.ddit.vo.ChatRoomVO;
import kr.or.ddit.vo.ChatUserVO;
import kr.or.ddit.vo.FileLocationVO;
import kr.or.ddit.vo.FileVO;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/chat")
public class ChatController {

	@Inject
	IMemberService memberService;

	@Inject
	IChatService chatService;

	/**
	 *  sidebar boat-chat 클릭시 채팅방 페이지 보여주는 메서드
	 *
	 * @return content/chatMain.jsp
	 */
	@GetMapping("/chatMain")
	public String chatMain() {
		return "content/chatMain";
	}


	@PostMapping(value="/getNameById", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public ResponseEntity<String> getNameById(@RequestBody Map<String, String> data) throws Exception{
		//log.debug("myId : {}", data.get("myId"));
		String memberId = data.get("myId");
		MemberVO vo = new MemberVO();
		vo.setMemberId(memberId);
		MemberVO mem  = memberService.selectMember(vo);
		String name = mem.getMemberName();
		//log.debug("membername : {}", name);
		return new ResponseEntity<String>(name, HttpStatus.OK);
	}

	@PostMapping(value="/getRoomsById", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseEntity<List<Map<String, Object>>> getRoomsById(@RequestBody Map<String,String> data) throws Exception {


		List<Map<String, Object>> returnList = new ArrayList<Map<String,Object>>();


		//  myId랑 방번호 얻어서 chat no read chat_no_read 확인 카운트로 이거는 빨간색 띄워줄거 그리고
		// {roomId : 15, notReadCnt : 1, roomTitle : '방제목', 'lastChatContent' : 'ㅎㅇ', 'lastchatDate' : '2012/11/21' , 'roomUserImages' : { } }
		String memberId = data.get("myId");
		//log.debug("myId : {}", memberId);
		LocalDateTime now = LocalDateTime.now(); // 현재 시간
		String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyy/MM/dd/HH:mm:ss"));
		List<ChatRoomVO> rooms = chatService.getRoomsById(memberId);
			for(ChatRoomVO room : rooms) {
				Map<String, Object> returnData = new HashMap<String, Object>();
				String roomId = room.getChatRNo();

				//해당방에 관하여 안읽은 글 갯수 가져오기
				Map<String, String> getNCntData = new HashMap<String, String>();
				getNCntData.put("roomId", roomId);
				getNCntData.put("memberId", memberId);
				String notReadCnt = chatService.getNotReadCnt(getNCntData);

				//해당방 마지막 채팅 정보 가져오기
				ChatContentVO contentVO = new ChatContentVO();
				contentVO = chatService.getLastChat(roomId);

				//해당방 모든 유저들 이미지 가져오기
				//해당방 나간사람 제외하고 뽑을라면 chatUSER 테이블에서 가져와야함
				//채팅방의 사람들 이름 가져오기
				List<MemberVO> mempics = new ArrayList<MemberVO>();
				List<String> mempic = new ArrayList<String>();

				List<ChatUserVO> memNames = new ArrayList<ChatUserVO>();
				List<String> memNameList = new ArrayList<String>();

				// 여기까지
				mempics = chatService.getuserImgs(roomId);
				memNames = chatService.getuserName(roomId);

				if(mempics.size() != 0 && mempics.size() == 2) {
					for(int i = 0; i < mempics.size();i++) {
						if(mempics.get(i).getMemberId().equals(memberId)){
							mempics.get(i).setMemberPic("");
						}
					}
				}
				for(MemberVO v : mempics) {
					mempic.add(v.getMemberPic());
				}
				for(ChatUserVO v : memNames) {
					String realName = memberService.getUserNameById(v.getMemberPk());
					memNameList.add(realName);
				}
				for(int i = 0; i < memNameList.size(); i++) {    // {"허나훔", 나, 김진호, 조현수}
					String myName = memberService.getUserNameById(memberId);
					if(memNameList.size() != 0 && memNameList.get(i).equals(myName)) {
						Collections.swap(memNameList, 0, i);
					}

				}

				String lastChat = "";
				String lastDate = "";

				//returnData.put("roomUserImages", mempics);
				if(contentVO != null) {
					lastChat = contentVO.getChatContent();
					lastDate = contentVO.getChatDate(); //2023/01/14/15:21:42
					//여기서 현재 날짜와 입력날짜가 같으면  시간만   오전 오후 설정
					//log.debug(formatedNow.substring(8,10).toString());
					if(formatedNow.substring(8,10).equals(lastDate.substring(8, 10))) {
						//날짜 같으면 시간만
						lastDate = (String) lastDate.subSequence(11, 16);
					}else {
						// 날짜가 다르면 월 일 받아온다
						lastDate = (String)lastDate.subSequence(5, 10);
					}

				}
				returnData.put("lastChatContent", lastChat);
				returnData.put("lastChatDate", lastDate);
				returnData.put("notReadCnt", notReadCnt);
				returnData.put("roomId", room.getChatRNo());
				returnData.put("roomTitle", room.getChatRTitle());
				returnData.put("Img", mempic);
				returnData.put("nameList", memNameList);



				returnList.add(returnData);
		}

		return new ResponseEntity<List<Map<String,Object>>>(returnList, HttpStatus.OK);
	}

	@PostMapping(value="/getChatContent", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<List<Object>> getChatContent(@RequestBody Map<String, String> data) throws Exception{
		//System.out.println("getChatContent에 접속" + data.get("roomId"));
		String roomId = data.get("roomId");
		List<Object> datas = new ArrayList<Object>();
		LocalDateTime now = LocalDateTime.now(); // 현재 시간
		String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyy/MM/dd/HH:mm:ss"));
		//해당 체팅방 이름 가져오기
		String chatRName = chatService.getRoomTitleByRoomId(roomId);


		// 여기서 해당방 chat_content 시간순으로 다 가지고 온다
		List<ChatContentVO> chatList = new ArrayList<ChatContentVO>();
		chatList = chatService.getChatContents(roomId);

		for(ChatContentVO c : chatList) {
			JSONObject obj = new JSONObject();
			obj.put("memberName", c.getMemberName());
			obj.put("chatContent", c.getChatContent());
			obj.put("memberprofile", c.getMemberPic());
			String formatTime = c.getChatDate().substring(11, 16);  //2023/01/12/10:06:56
			obj.put("filePath", c.getChatFile());
//			obj.put("fileName", fileName);
//			obj.put("extractFileType", extractFileType);
			obj.put("time", formatTime);
			obj.put("roomTitle", chatRName);
			obj.put("memberPk", c.getMemberPk());
			obj.put("ptype", c.getChatPtype());

			//파일경로로 확장자랑 파일이름 잘라줘야됨
			if(!c.getChatFile().equals("NO")) {
				int beginIndex = c.getChatFile().indexOf("_");
				String fileName = c.getChatFile().substring(beginIndex + 1,c.getChatFile().length());
				beginIndex = fileName.lastIndexOf(".");
				String extractFileType = fileName.substring(beginIndex, fileName.length());
				//log.debug("extractFileType : {}", extractFileType );
				obj.put("fileName", fileName);
				obj.put("extractFileType", extractFileType);

			}

			//log.debug("formatTime : {}", formatTime);
			datas.add(obj);
		}
		if(chatList.size() == 0) {
			String time = formatedNow.substring(11,16);
			JSONObject obj = new JSONObject();
			obj.put("roomTitle", chatRName);
			obj.put("memberName", "boatIn");
			obj.put("time", time);
			obj.put("memberprofile", "/resources/src/images/chatBoat.jpg");
			obj.put("chatContent", "새로운 채팅을 시작해보세요~~");
			obj.put("filePath", "NO");
			datas.add(obj);

		}

		return new ResponseEntity<List<Object>>(datas,HttpStatus.OK);
	}


	@PostMapping(value="/getMembers", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<List<MemberVO>> getMembers() throws Exception{
		List<MemberVO> memberList = memberService.getAllMember();
		return new ResponseEntity<List<MemberVO>>(memberList,HttpStatus.OK);
	}


	@PostMapping(value="/createRoom", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> createRoom(@RequestBody Map<String, Object> data) throws Exception{
		//log.debug("data : {}", data);

		//받아온데이터로 채팅방 만들기
//data : {chatRoomName=DDDD, chatRoomCreater=rkwkakstp123@gmail.com, roomLimit=5, memarr={0=fnvkfl12@naver.com, 1=jajih29590@dentaltz.com}}
		ChatRoomVO roomVO = new ChatRoomVO();
		String creater = data.get("chatRoomCreater").toString();
		String roomTitle = data.get("chatRoomName").toString();
		String chatRPerson = data.get("roomLimit").toString();
//		log.debug("creater : {}", creater);
//		log.debug("roomTitle : {}", roomTitle);
		roomVO.setCreaterId(creater);
		roomVO.setChatRTitle(roomTitle);
		roomVO.setChatRPerson(chatRPerson);


		// room  번호
		int cnt = chatService.insertRoom(roomVO); //여기서 방만들때 seq값을 가져오고 싶음
		String roomNM = roomVO.getChatRNo();
		Map<String,String> invitedMems =(Map<String, String>)data.get("memarr");
		Iterator<String> keys = invitedMems.keySet().iterator();
	        while(keys.hasNext() ){
	            ChatUserVO chatUserVO = new ChatUserVO();
	        	String key = keys.next();
	            String member = invitedMems.get(key);
	            chatUserVO.setMemberPk(member);
	            chatService.insertInvitedUser(chatUserVO);
	            //log.debug("value : {}", invitedMems.get(key));
	        }
	     //생성자도 넣어준다
	     ChatUserVO chatUserVO = new ChatUserVO();
	     chatUserVO.setMemberPk(creater);
	     chatService.insertInvitedUser(chatUserVO);

		return new ResponseEntity<String>(roomNM ,HttpStatus.OK);
	}



	@PostMapping(value="/deleteUnread", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String deleteUnread(@RequestBody Map<String, Object> data) throws Exception {
		String roomId = data.get("roomId").toString();
		String myId = data.get("myId").toString();
//
//		log.debug("접속한방 : {}", roomId); //16
//		log.debug("내 아이디 : {}", myId); //

		Map<String, String> ddata = new HashMap<String, String>();

		ddata.put("Id", myId);
		ddata.put("roomId", roomId);

	    chatService.deleteUnread(ddata);

		return "삭제완료";
	}

	@PostMapping(value="/getoutRoom", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String getOutRoom(@RequestBody Map<String, String> data) throws Exception {

		String myId = data.get("myId").toString();
		String myRoom = data.get("roomId").toString();
//
//		log.debug("myId in getoutRoom : {}",myId);
//		log.debug("myRoom in getoutRoom : {}",myRoom);

		Map<String, String>  datas =  new HashMap<String, String>();
		datas.put("roomId", myRoom);
		datas.put("myId", myId);

		chatService.deleteRoom(datas);

		return "채팅방 나감 완료";
	}

	@PostMapping(value="/showUnreadIcon", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String showUnreadIcon(@RequestBody Map<String, String> data) throws Exception {

		String myId = data.get("myId").toString();

		String cnt = chatService.showUnreadIcon(myId);

		return cnt;
	}

	@PostMapping(value="/uploadAjaxchat_O", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, String> uploadAjaxchat_O(@RequestParam("jsonData") String data, MultipartFile[] uploadFile, HttpServletRequest req) throws Exception {

		JsonParser parser = new JsonParser();
	    JsonElement element = parser.parse(data);
	    String roomId = element.getAsJsonObject().get("roomId").getAsString();
	    String myId = element.getAsJsonObject().get("myId").getAsString();

        String path = req.getSession().getServletContext().getRealPath("resources/upload/chat/" + roomId);


        // 일단 locationVO 에 넣어줌
        FileLocationVO vo = new FileLocationVO();
        chatService.insertFileLocationChat(vo);
        int fileLNo = vo.getFileLNo();
        String filepath ="";
        String uploadFileName ="";


		log.debug("myId in uploadAjaxchat_O : {}", myId);
		log.debug("myRoom in uploadAjaxchat_O : {}",roomId);
		log.debug("FileLNo in uploadAjaxchat_O : {}",fileLNo);

		Map<String, String> fileData = new HashMap<String, String>();

		  File uploadPathunder = new File(path);

	      if (!uploadPathunder.exists()) uploadPathunder.mkdirs();

	      for (MultipartFile multipartFile : uploadFile) {
	            FileVO fileVO = new FileVO();

	            //UUID 로 파일 중복 방지
	            uploadFileName = multipartFile.getOriginalFilename();
	            fileVO.setFileRealName(uploadFileName); // 진짜 이름 설정
	            fileData.put("uploadFileName",uploadFileName);
	            String uploadFileSize = String.valueOf(multipartFile.getSize());
	            fileVO.setFileSize(uploadFileSize); // 파일 사이즈 설정

	            uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);

	            UUID uuid = UUID.randomUUID();
	            uploadFileName = uuid.toString() + "_" + uploadFileName; // 2lkwake9fdslafk;la_남성이미지.png
	            fileVO.setFileName(uploadFileName);

	            try {
	                File saveFile = new File(uploadPathunder, uploadFileName);
	                multipartFile.transferTo(saveFile);
	                fileVO.setUuid(uuid.toString()); // 12dsakj12jkldsakldd21
	                fileVO.setFilePath("\\chat\\"+roomId +"\\"+uploadFileName);

	                fileVO.setFileLNo(fileLNo);
	                if (checkImageType(saveFile)) {
	                    fileVO.setImage("T");
	                    fileData.put("image", "T");

	                } else {
	                    fileVO.setImage("F");
	                    fileData.put("image", "F");
	                }

	                fileVO.setFileUploader(myId);

	                log.debug(fileVO.toString());
	                log.debug("fileVO : {}", fileVO);

	                chatService.sendChatFile_O(fileVO);
	                filepath = fileVO.getFilePath();

	            } catch (Exception e) {
	                log.error(e.getMessage());
	            }
	        }

	      fileData.put("filePath", filepath);


		return fileData;
	}

	  // 파일인지 이미지인지 구별해주는 메서드
    private boolean checkImageType(File file) {
        try {
            String contentType = Files.probeContentType(file.toPath());
            log.debug("contentType : {}", contentType);
            return contentType.startsWith("image");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
