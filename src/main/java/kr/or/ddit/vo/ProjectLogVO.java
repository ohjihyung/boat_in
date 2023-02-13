package kr.or.ddit.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ProjectLogVO {
    private String proLogNo;
    private String proNo;
    private String proLogContent;
    private String proLogDate;
    private String topWorkNo;
    private String proLogState;
    private String proLogProgressOrigin;
    private String proLogProgressNew;
    private String proLogProgressTotal;
    private String subWorkNo;
}
