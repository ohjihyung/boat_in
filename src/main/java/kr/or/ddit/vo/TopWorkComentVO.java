package kr.or.ddit.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TopWorkComentVO {
    private String twComentNo;
    private String topWorkNo;
    private String memberId;
    private String twComentDate;
    private String twComentContent;
    private String twComentFile;
    private String twComentState;
    private String memberPic;
}
