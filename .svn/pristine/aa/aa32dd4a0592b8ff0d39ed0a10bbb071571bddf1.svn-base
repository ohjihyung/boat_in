package kr.or.ddit.controller.admin.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProjectJoinStateVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SubWorkVO;
import kr.or.ddit.vo.TopWorkCategoryVO;
import kr.or.ddit.vo.TopWorkVO;

public interface IAdminService {

    public List<MemberVO> getAllMember() throws Exception;

    public List<ProjectVO> getAllProject() throws Exception;

    public Map<String, Object> getAllDatas() throws Exception;

    public void updateProjectName(ProjectVO projectVO) throws Exception;

    public void updateCategoryName(TopWorkCategoryVO twCategoryVO) throws Exception;

    public void updateTopWorkTitle(TopWorkVO topWorkVO) throws Exception;

    public void updateTopWorkProgress(TopWorkVO topWorkVO) throws Exception;

    public void updateSubWorkTitle(SubWorkVO subWorkVO) throws Exception;

    public void updateMemberName(MemberVO memberVO) throws Exception;

    public void updateMemberPhone(MemberVO memberVO) throws Exception;

    public void updateMemberBirth(MemberVO memberVO) throws Exception;

    public void updateMemberRegdate(MemberVO memberVO) throws Exception;

    public void deleteSubWork(SubWorkVO subWorkVO) throws Exception;

    public void deleteTopWork(TopWorkVO topWorkVO) throws Exception;

    public void deleteTopWorkCategory(TopWorkCategoryVO twCategoryVO) throws Exception;

    public void deleteProject(ProjectVO projectVO) throws Exception;

    public List<ProjectJoinStateVO> selectJoinMember(ProjectVO projectVO) throws Exception;

    public void updateProjectManager(ProjectJoinStateVO proJSVO) throws Exception;

    public void updateMemberInfo(MemberVO memberVO) throws Exception;

}
