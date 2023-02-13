package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProjectLogVO;
import kr.or.ddit.vo.TopWorkCategoryVO;
import kr.or.ddit.vo.TopWorkRelationVO;
import kr.or.ddit.vo.TopWorkVO;


public interface TopWorkMapper {

    public List<TopWorkVO> list(String proNo);

    public void insert(TopWorkVO topWorkVO) throws Exception;

    public void insertRelation(TopWorkRelationVO topWorkRelationVO) throws Exception;

    public void updateMove(TopWorkVO topWorkVO) throws Exception;

    public void update(TopWorkVO topWorkVO) throws Exception;

    public void delete(TopWorkVO topWorkVO) throws Exception;

    public List<TopWorkCategoryVO> categoryList(String proNo) throws Exception;

    public void categoryInsert(TopWorkCategoryVO topWorkCategoryVO) throws Exception;

    public void categoryDelete(TopWorkCategoryVO topWorkCategoryVO) throws Exception;

    public void topWorkMove(TopWorkVO topWorkVO) throws Exception;

    public List<TopWorkVO> selectTopWork(String twCategoryNo) throws Exception;

    public void topWorkWaiting(TopWorkVO item) throws Exception;

    public TopWorkVO select(String topWorkNo) throws Exception;

    public void logInsert(ProjectLogVO projectLogVO) throws Exception;

    public void categoryUpdate(TopWorkCategoryVO topWorkCategoryVO) throws Exception;

    public void topWorkUpdate(TopWorkVO topWorkVO) throws Exception;

    public void topWorkDelete(TopWorkVO topWorkVO) throws Exception;

    public void logDelete(ProjectLogVO projectLogVO) throws Exception;

    public String selectCategoryColor(String twCategoryNo) throws Exception;

    public List<TopWorkVO> myList(Map<String, String> map) throws Exception;

	public void updateTopworkFile(Map<String, String> uploadData)throws Exception;

	// OJH 해당 상위작업의 topworkFile 가져오는 메서드
	public int getTopWorkFile(TopWorkVO topwork);

    public List<TopWorkVO> topWorkMyList(Map<String, String> map) throws Exception;

    public List<TopWorkCategoryVO> categoryPersonal() throws Exception;

    public void moveState(TopWorkVO topWorkVO) throws Exception;

    //ojh 카테고리 번호로 카테고리 이름가져오는 메서드
	public String getCategoryName(String categoryNo);

	public List<ProjectLogVO> logList(TopWorkVO topWorkVO) throws Exception;

	// OJH TopWorkNo 로  TopworkTitle 가져오는 함수
	public String getTopWorkTitle(String topWorkNo);

	public List<TopWorkRelationVO> selectMemberList(TopWorkVO topWorkVO) throws Exception;

	public String getProNobyTopWork(String topWorkNo) throws Exception;

}
