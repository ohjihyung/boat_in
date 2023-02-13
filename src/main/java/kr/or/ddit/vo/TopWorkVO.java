package kr.or.ddit.vo;

import lombok.Data;

@Data
public class TopWorkVO {
    private String topWorkNo;
    private String proNo;
    private String twCategoryNo;
    private String topWorkContent;
    private String topWorkStart;
    private String topWorkEnd;
    private Integer topWorkState;
    private String topWorkProgress;
    private Integer topWorkLike;
    private String topWorkFile;
    private String topWorkTitle;
    private String topWorkImportance;
    private String topWorkDelete;
    private String twCategoryColor;
    private String memberId;
    private String proName;
    
    //통계를 위한 vo변수 
    private String topWorkCnt;
    private String topWorkRate;
}
