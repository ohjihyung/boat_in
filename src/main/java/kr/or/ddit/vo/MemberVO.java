package kr.or.ddit.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberVO {
	String memberId;
	String memberPw;
	String memberName;
	String memberToken;
	String memberBirth;
	String memberPic;
	String memberRegdate;
	String memberState;
	
	//myPage에서 설정
	String memberPhone;
	String memberInfo;
	
	private List<MemberAuthVO>  memAuthVOList;
	private MultipartFile profileImgFile;
	
	//myhome 배경색상
	private String myhomeColor;
	//필요해서 추가
	private String proAuth;
}
