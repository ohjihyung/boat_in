package kr.or.ddit.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SubWorkComentVO {
    private String swComentNo;
    private String subWorkNo;
    private String memberId;
    private String swComentDate;
    private String swComentContent;
    private String swComentFile;
    private String swComentState;
    private String memberPic;
}
