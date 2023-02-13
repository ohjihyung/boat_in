 package kr.or.ddit.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FileVO {
	private int fileLNo;
	private int fileLNo2;
	private String fileRealName; // 파일 진짜 이름   홍길동.png
	private String fileSize;  // 123431
	private int fileDowncnt;  //   파일 다운로드 수
	private String filePath;  //    프로젝트1 // 카테고리 이름
	private String fileIsdeleted;  // 파일의 삭제 유무
	private String fileUploader;
	private String image;
	private String uuid;
	private String fileName; //  dk213jkldjkla2kl1jd_홍길동.png
	private String fileComentNo; //파일이 첨부된 댓글 위치 및 번호
	private String fileWorkNo; //파일이 첨부된 작업 위치 및 번호
	
	private String sliced;
}
