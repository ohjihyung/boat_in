package kr.or.ddit.vo;

import org.springframework.web.socket.WebSocketSession;

import lombok.Data;

@Data
public class ChatMemVO {
	private WebSocketSession wsSession;
	private String roomId;
	private String myName;
	private String myId;

	public ChatMemVO() {}
	public ChatMemVO(String a, String b, String c) {
		this.roomId = a;
		this.myName = b;
		this.myId = c;
	}
}
