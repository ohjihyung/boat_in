package kr.or.ddit.vo;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class QnAVO {
	private String qnaNo;
	private String memberId;
	private String qnaTitle;
	private String qnaContent;
	private String qnaType;

	@JsonFormat(pattern = "yyyy-MM-dd")
	private String qnaDate;
	private String qnaState;
	private String qnaAnswer;
	private String answerDate;
}
