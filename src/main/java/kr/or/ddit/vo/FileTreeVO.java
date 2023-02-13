package kr.or.ddit.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FileTreeVO {
	private String proNo;	 		// 프로젝트 번호
	private String fileId;	 		// 해당 파일 id
	private String parentId; 		// 부모 파일 id
	private int depth;	 			// 계층
	private String fileName; 		// 파일 이름
}
