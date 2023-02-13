package kr.or.ddit.controller.project.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProjectJoinStateVO;

/**
 * @author 김진호
 *
 */
public interface IProjectJoinService {
	/**
	 * @param vo
	 * @return
	 */
	public int insertProJoin(ProjectJoinStateVO vo);
	/**
	 * @param vo
	 * @return
	 */
	public int updateProJoinState(ProjectJoinStateVO vo);
	public int updateProAuth(ProjectJoinStateVO vo);
	public ProjectJoinStateVO  selectProJoin(ProjectJoinStateVO vo);
	
    public ProjectJoinStateVO checkAuth(Map<String, String> map) throws Exception;
}
