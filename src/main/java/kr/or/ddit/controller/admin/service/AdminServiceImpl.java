package kr.or.ddit.controller.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.common.CommonDao;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProjectJoinStateVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SubWorkVO;
import kr.or.ddit.vo.TopWorkCategoryVO;
import kr.or.ddit.vo.TopWorkRelationVO;
import kr.or.ddit.vo.TopWorkVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class AdminServiceImpl implements IAdminService {
    @Inject
    private CommonDao dao;
    @Override
    public List<MemberVO> getAllMember() throws Exception {
        return dao.selectList("getAllMember");
    }
    @Override
    public List<ProjectVO> getAllProject() throws Exception {
        return dao.selectList("getAllProject");
    }
    @Override
    public Map<String, Object> getAllDatas() throws Exception {
        List<ProjectVO> projectList = dao.selectList("getAllProject");
        List<TopWorkCategoryVO> twCategoryList = dao.selectList("getAlltwCategory");
        List<TopWorkVO> topWorkList = dao.selectList("getAllTopWork");
        List<SubWorkVO> subWorkList = dao.selectList("getAllSubWork");
        List<TopWorkRelationVO> twRelationList = dao.selectList("getAlltwRelation");
        List<ProjectJoinStateVO> proJSList = dao.selectList("getAllProjectJoinState");
        
        Map<String, Object> map = new HashMap<>();
        map.put("projectList", projectList);
        map.put("twCategoryList", twCategoryList);
        map.put("topWorkList", topWorkList);
        map.put("subWorkList", subWorkList);
        map.put("twRelationList", twRelationList);
        map.put("proJSList", proJSList);
        
        return map;
    }
    @Override
    public void updateProjectName(ProjectVO projectVO) throws Exception {
        dao.update("updateProjectName", projectVO);
    }
    @Override
    public void updateCategoryName(TopWorkCategoryVO twCategoryVO) throws Exception {
        dao.update("updateCategoryName", twCategoryVO);
    }
    @Override
    public void updateTopWorkTitle(TopWorkVO topWorkVO) throws Exception {
        dao.update("updateTopWorkTitle", topWorkVO);
    }
    @Override
    public void updateTopWorkProgress(TopWorkVO topWorkVO) throws Exception {
        TopWorkVO vo = dao.select("checkTopWorkProgress", topWorkVO);
        String oldProgress = vo.getTopWorkProgress();
        String progress = topWorkVO.getTopWorkProgress();
        log.debug("변경 전 진행률 : {}, 변경 후 진행률 : {}", oldProgress, progress);
        
        if (!oldProgress.equals("100") && progress.equals("100")) {
            //상태값 승인대기로 바꿔야함
            log.debug("상태값이 100으로 업데이트되어 상태값이 승인대기로 변경됩니다.");
            dao.update("updateTopWorkState_2", topWorkVO);
        }
        
        if (oldProgress.equals("100") && !progress.equals("100")) {
            //상태값 승인대기 혹은 완료에서 진행중으로 바뀌어야함
            log.debug("상태값이 100에서 업데이트되어 상태값이 진행중으로 변경됩니다.");
            dao.update("updateTopWorkState_1", topWorkVO);
            
        }
        
        dao.update("updateTopWorkProgress", topWorkVO);        
    }
    @Override
    public void updateSubWorkTitle(SubWorkVO subWorkVO) throws Exception {
        dao.update("updateSubWorkTitle", subWorkVO);
    }
    @Override
    public void updateMemberName(MemberVO memberVO) throws Exception {
        dao.update("updateMemberName", memberVO);
    }
    @Override
    public void updateMemberPhone(MemberVO memberVO) throws Exception {
        dao.update("updateMemberPhone", memberVO);
    }
    @Override
    public void updateMemberBirth(MemberVO memberVO) throws Exception {
        dao.update("updateMemberBirth", memberVO);
    }
    @Override
    public void updateMemberRegdate(MemberVO memberVO) throws Exception {
        dao.update("updateMemberRegdate", memberVO);
    }
    @Override
    public void deleteSubWork(SubWorkVO subWorkVO) throws Exception {
        SubWorkVO originSubWorkVO = dao.select("selectSubWork", subWorkVO);
        
        if (originSubWorkVO.getSubWorkDelete().equals("0")) {
            log.debug("삭제처리 : {}", subWorkVO);
            dao.update("subWorkDelete", subWorkVO);    
        } else {
            log.debug("복구처리 : {}", subWorkVO);
            dao.update("subWorkNotDelete", subWorkVO);
        }
        
        
    }
    
    @Override
    public void deleteTopWork(TopWorkVO topWorkVO) throws Exception {
        TopWorkVO originTopWorkVO = dao.select("selectTopWork_admin", topWorkVO);
        //데이터 복구시엔 탑워크만 복구하고 끝.
        if (originTopWorkVO.getTopWorkDelete().equals("T")) {
            log.debug("상위작업을 복구합니다. {}", originTopWorkVO);
            dao.update("topWorkNotDelete", topWorkVO);
            
            return;
        } 
        
        String topWorkNo = topWorkVO.getTopWorkNo();
        deleteRelationSubWork(topWorkNo);
        
        dao.update("topWorkDelete", topWorkVO);
        return;
    }
    @Override
    public void deleteTopWorkCategory(TopWorkCategoryVO twCategoryVO) throws Exception {
        TopWorkCategoryVO originTwCategoryVO = dao.select("selectTwCategory", twCategoryVO);
        //카테고리 복구시
        if (originTwCategoryVO.twCategoryState.equals("1")) {
            log.debug("카테고리를 복구합니다.", originTwCategoryVO);
            dao.update("twCategoryNotDelete", twCategoryVO);
            
            return;
        }
        
        //카테고리 삭제시
        List<TopWorkVO> topWorkList = dao.selectList("getAllRelationTopWork", twCategoryVO);
        
        if (topWorkList.size() > 0) {
            deleteRelationWork(topWorkList);
        }
        
        dao.update("twCategoryDelete", twCategoryVO);
        
        return;
    }
    
    @Override
    public void deleteProject(ProjectVO projectVO) throws Exception {
        ProjectVO originProjectVO = dao.select("selectProject", projectVO);
        
        //삭제된 프로젝트 복구시
        if (originProjectVO.getProDelete().equals("1")) {
            dao.update("projectNotDelete", projectVO);
            
            return;
        }
        
        //프로젝트 삭제시
        List<TopWorkCategoryVO> twCategoryList = dao.selectList("getAllRelationTwCategory", projectVO);
        
        if (twCategoryList.size() > 0) {
            log.debug("관련된 카테고리를 삭제합니다. {}", twCategoryList);
            
            for (TopWorkCategoryVO twVO : twCategoryList) {
                //하위삭제 -> 상위삭제 -> 카테고리 삭제
                List<TopWorkVO> topWorkList = dao.selectList("getAllRelationTopWork", twVO);
                
                deleteRelationWork(topWorkList);
                
                dao.update("twCategoryDelete", twVO);
            }
        }
        
        dao.update("projectDelete", projectVO);
        return;
    }
    
    //관련 상위 하위작업 삭제 메소드
    private void deleteRelationWork(List<TopWorkVO> topWorkList) {
        log.debug("관련 상위작업을 삭제합니다 : {}", topWorkList);
        
        for (TopWorkVO topWorkVO : topWorkList) {
            String topWorkNo = topWorkVO.getTopWorkNo();
            deleteRelationSubWork(topWorkNo);
            
            dao.update("topWorkDelete", topWorkVO);
        }
    }
    
    //관련 하위작업 삭제용 메소드
    private void deleteRelationSubWork(String topWorkNo) {
        List<SubWorkVO> subWorkList = dao.selectList("selectSubWorkList", topWorkNo);
        
        if (subWorkList.size() > 0) {
            log.debug("관련 하위작업을 삭제합니다. {}", subWorkList);
            dao.update("subWorkDeleteAll", topWorkNo);
        }
        
    }
    @Override
    public List<ProjectJoinStateVO> selectJoinMember(ProjectVO projectVO) throws Exception {
        return dao.selectList("selectJoinMember", projectVO);
    }
    @Override
    public void updateProjectManager(ProjectJoinStateVO proJSVO) throws Exception {
        String proNo = proJSVO.getProNo();
        //기존 PM찾기
        ProjectJoinStateVO originProJSVO = dao.select("getProjectManager", proNo);
        log.debug("기존 관계 : {}", originProJSVO);
        //기존 PM에 새 PM 이식
        proJSVO.setProJSNo(originProJSVO.getProJSNo());
        
        log.debug("수정할 관계(팀장) vo 정보 : {}", proJSVO);
        //추가로 프로젝트테이블에도 변경필요함
        dao.update("updateManager", proJSVO);
        
        dao.update("updateProjectManager", proJSVO);
    }
    @Override
    public void updateMemberInfo(MemberVO memberVO) throws Exception {
        dao.update("updateMemberInfo_admin", memberVO);
    }
}
