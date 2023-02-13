package kr.or.ddit.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DevinComentVO {
	private String dviComentNo;		// 지식인 댓글 번호
	private String dviNo;		// 지식인 게시글 번호
	private String memberId;	// 회원아이디
	private String dviComentContent;	// 지식인 댓글 내용

	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date dviComentDate;		// 지식인 댓글 작성일
	private Integer dviComentLike;	// 지식인 댓글 좋아요
	private String dviComentState;	// 지식인 댓글 상태
	
	 //프로젝트별 멤버 출력할 때 추가로 필요한 정보들
    private String memberName;
    private String memberPic;
}
