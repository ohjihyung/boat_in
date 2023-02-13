package kr.or.ddit.controller.subwork.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProjectLogVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SubWorkComentVO;
import kr.or.ddit.vo.SubWorkVO;
import kr.or.ddit.vo.TopWorkComentVO;
import kr.or.ddit.vo.TopWorkVO;

public interface ISubWorkService {

    public String subWorkInsert(SubWorkVO subWorkVO) throws Exception;

    public List<SubWorkVO> subWorkList(TopWorkVO topWorkVO) throws Exception;

    public SubWorkVO subWorkDetail(SubWorkVO vo) throws Exception;

    public MemberVO selectSubWorkMember(SubWorkVO vo) throws Exception;

    public MemberVO selectMemberListSubWork(SubWorkVO vo) throws Exception;

    public void subWorkUpdate_K(SubWorkVO subWorkVO) throws Exception;

    public List<ProjectLogVO> subWorkLogList(SubWorkVO subWorkVO) throws Exception;

    public List<SubWorkComentVO> subWorkComentList(SubWorkVO subWorkVO) throws Exception;

    public String subWorkComentInsert(SubWorkComentVO swComentVO) throws Exception;

    public void subWorkComentDelete(SubWorkComentVO swComentVO) throws Exception;

    public void subWorkComentUpdate(SubWorkComentVO swComentVO) throws Exception;

    public List<SubWorkVO> selectAllSubWork(ProjectVO projectVO) throws Exception;

    public void subWorkDelete(SubWorkVO vo) throws Exception;

    public List<SubWorkVO> getChangeSubWork(HashMap<String, Object> map) throws Exception;

    public Map<String, String> setChangeSubWork(HashMap<String, Object> map) throws Exception;

}
