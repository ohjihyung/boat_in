package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProjectJoinStateVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.TopWorkVO;

@Mapper
public interface ProjectMapper {

    public void insert(ProjectVO projectVO) throws Exception;

    public void insertJoinState(ProjectJoinStateVO proJSVO) throws Exception;

    public List<ProjectVO> list(MemberVO memberVO) throws Exception;
    
    public ProjectVO selectOne(String proNo)throws Exception;

    public List<ProjectJoinStateVO> selectTeamMember(String proNo) throws Exception;

    public List<MemberVO> memberList(ProjectVO projectVO) throws Exception;
    
//    public int updateProTotalRate(TopWorkVO topWorkVO) throws Exception;

//	public int updateProTotalRate(String proNo);

	public int updateProTotalRate(Map<String, String> proNo);
}
