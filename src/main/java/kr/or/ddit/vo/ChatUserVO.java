package kr.or.ddit.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChatUserVO {
	private String memberPk;
	private String chatRNo;
	private String isOnline;
}
