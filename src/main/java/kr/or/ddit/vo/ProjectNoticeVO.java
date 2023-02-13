package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProjectNoticeVO {
	private String proNoticeNo;
	private String proNo;
	private String proNoticeTitle;
	private String proNoticeContent;
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date proNoticeDate;
	//private List<MultipartFile> proNoticeFile;
	private String proNoticeFile; //파일
	private MultipartFile noticeFile;
	private String proNoticePath; // 진짜경로
	private String proNoticePop;
	
	
	//프로젝트별 멤버 출력할 때 추가로 필요한 정보들
	private String memberId;
    private String memberName;
    private String memberPic;
    
    // 해당 프로젝트에 참여여부(조인) 출력할 때 추가로 필요한 정보
    private String proJSNo;
    private String proAuth;
    private String proJoinState;
}
