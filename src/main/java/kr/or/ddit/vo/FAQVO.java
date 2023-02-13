package kr.or.ddit.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FAQVO {
	private String faqNo;
	private String adminId;
	private String faqTitle;
	private String faqContent;
}