package kr.or.ddit.controller.admin;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.controller.admin.service.IAdminService;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProjectJoinStateVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SubWorkVO;
import kr.or.ddit.vo.TopWorkCategoryVO;
import kr.or.ddit.vo.TopWorkVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/jino")
public class AdminJinoController {
    @Inject
    private IAdminService service;
    
    @GetMapping(value = "/getAllMember", produces = "application/json; charset=utf-8")
    @ResponseBody
    public List<MemberVO> getAllMember() throws Exception {
        List<MemberVO> allMemberList = service.getAllMember();
        
        return allMemberList;
    }
    
    @PostMapping(value = "/getAllProject", produces = "application/json; charset=utf-8")
    @ResponseBody
    public List<ProjectVO> getAllProject() throws Exception {
        List<ProjectVO> allProjectList = service.getAllProject();
        
        return allProjectList;
    }
    
    @PostMapping(value = "/getAllDatas", produces = "application/json; charset=utf-8")
    @ResponseBody
    public Map<String, Object> getAllDatas() throws Exception {
        Map<String, Object> map = service.getAllDatas();
        
        return map;
    }
    
    /**
     * 김진호
     * 관리자 - 프로젝트 변경
     * @param projectVO
     * @throws Exception
     */
    @PostMapping(value = "/updateProjectName", produces = "text/plain; charset=utf-8")
    @ResponseBody
    public String updateProjectName(@RequestBody ProjectVO projectVO) throws Exception {
        log.debug("바꿀 프로젝트 정보 : {}", projectVO);
        service.updateProjectName(projectVO);
        
        return "프로젝트 이름 변경 성공";
    }
    
    /**
     * 김진호
     * 관리자 - 카테고리 이름 변경
     * @param twCategoryVO
     * @throws Exception
     */
    @PostMapping(value = "/updateCategoryName", produces = "text/plain; charset=utf-8")
    @ResponseBody
    public String updateCategoryName(@RequestBody TopWorkCategoryVO twCategoryVO) throws Exception {
        log.debug("바꿀 카테고리 정보 : {}", twCategoryVO);
        service.updateCategoryName(twCategoryVO);
        
        return "카테고리 이름 변경 성공";
    }
    
    @PostMapping(value = "/updateTopWorkTitle", produces = "text/plain; charset=utf-8")
    @ResponseBody
    public String updateTopWorkTitle(@RequestBody TopWorkVO topWorkVO) throws Exception {
        log.debug("바꿀 상위작업 정보 : {}", topWorkVO);
        service.updateTopWorkTitle(topWorkVO);
        
        return "상위작업 제목 변경 성공";
    }
    
    @PostMapping(value = "/updateTopWorkProgress", produces = "text/plain; charset=utf-8")
    @ResponseBody
    public String updateTopWorkProgress(@RequestBody TopWorkVO topWorkVO) throws Exception {
        log.debug("바꿀 상위작업 정보 : {}", topWorkVO);
        service.updateTopWorkProgress(topWorkVO);
        
        return "상위작업 진행도 변경 성공";
    }
    
    @PostMapping(value = "/updateSubWorkTitle", produces = "text/plain; charset=utf-8")
    @ResponseBody
    public String updateSubWorkTitle(@RequestBody SubWorkVO subWorkVO) throws Exception {
        log.debug("바꿀 하위작업 정보 : {}", subWorkVO);
        service.updateSubWorkTitle(subWorkVO);
        
        return "하위작업 제목 변경 성공";
    }
    
    @PostMapping(value = "/updateMemberName", produces = "text/plain; charset=utf-8")
    @ResponseBody
    public String updateMemberName(@RequestBody MemberVO memberVO) throws Exception {
        log.debug("바꿀 멤버 정보 : {}", memberVO);
        service.updateMemberName(memberVO);
        
        return "멤버 이름 변경 성공";
    }
    
    @PostMapping(value = "/updateMemberPhone", produces = "text/plain; charset=utf-8")
    @ResponseBody
    public String updateMemberPhone(@RequestBody MemberVO memberVO) throws Exception {
        log.debug("바꿀 멤버 정보 : {}", memberVO);
        service.updateMemberPhone(memberVO);
        
        return "멤버 전화번호 변경 성공";
    }
    
    @PostMapping(value = "/updateMemberBirth", produces = "text/plain; charset=utf-8")
    @ResponseBody
    public String updateMemberBirth(@RequestBody MemberVO memberVO) throws Exception {
        log.debug("바꿀 멤버 정보 : {}", memberVO);
        service.updateMemberBirth(memberVO);
        
        return "멤버 생일 변경 성공";
    }
    
    @PostMapping(value = "/updateMemberRegdate", produces = "text/plain; charset=utf-8")
    @ResponseBody
    public String updateMemberRegdate(@RequestBody MemberVO memberVO) throws Exception {
        log.debug("바꿀 멤버 정보 : {}", memberVO);
        service.updateMemberRegdate(memberVO);
        
        return "멤버 가입일 변경 성공";
    }
    
    @PostMapping(value = "/updateMemberInfo", produces = "text/plain; charset=utf-8")
    @ResponseBody
    public String updateMemberInfo(@RequestBody MemberVO memberVO) throws Exception {
        log.debug("바꿀 멤버 정보 : {}", memberVO);
        service.updateMemberInfo(memberVO);
        
        return "멤버 소개 변경 성공";
    }
    
    @PostMapping(value = "/deleteSubWork", produces = "text/plain; charset=utf-8")
    @ResponseBody
    public String deleteSubWork(@RequestBody SubWorkVO subWorkVO) throws Exception {
        log.debug("삭제/복구할 하위작업 정보 : {}", subWorkVO);
        service.deleteSubWork(subWorkVO);
        
        return "하위작업 삭제/복구 처리 성공";
    }
    
    /**
     * 김진호
     * 상위작업 삭제 혹은 복구
     * 삭제시 관련 하위작업 모두 삭제처리
     * @param topWorkVO
     * @throws Exception
     */
    @PostMapping(value = "/deleteTopWork", produces = "text/plain; charset=utf-8")
    @ResponseBody
    public String deleteTopWork(@RequestBody TopWorkVO topWorkVO) throws Exception {
        log.debug("삭제/복구할 상위작업 정보 : {}", topWorkVO);
        service.deleteTopWork(topWorkVO);
        
        return "상위작업 삭제/복구 처리 성공";
    }
    
    @PostMapping(value = "/deleteTopWorkCategory", produces = "text/plain; charset=utf-8")
    @ResponseBody
    public String deleteTopWorkCategory(@RequestBody TopWorkCategoryVO twCategoryVO) throws Exception {
        log.debug("삭제/복구할 카테고리 정보 : {}", twCategoryVO);
        service.deleteTopWorkCategory(twCategoryVO);
        
        return "카테고리 삭제/복구 처리 성공";
    }
    
    @PostMapping(value = "/deleteProject", produces = "text/plain; charset=utf-8")
    @ResponseBody
    public String deleteProject(@RequestBody ProjectVO projectVO) throws Exception {
        log.debug("삭제/복구할 프로젝트 정보 : {}", projectVO);
        service.deleteProject(projectVO);
        
        return "프로젝트 삭제/복구 처리 성공";
    }
    
    @PostMapping(value = "/selectJoinMember", produces = "application/json; charset=utf-8")
    @ResponseBody
    public List<ProjectJoinStateVO> selectJoinMember(@RequestBody ProjectVO projectVO) throws Exception {
//        log.debug("삭제/복구할 프로젝트 정보 : {}", projectVO);
        List<ProjectJoinStateVO> joinMemberList = service.selectJoinMember(projectVO);
        
        return joinMemberList;
    }
    @PostMapping(value = "/updateProjectManager", produces = "text/plain; charset=utf-8")
    @ResponseBody
    public String updateProjectManager(@RequestBody ProjectJoinStateVO proJSVO) throws Exception {
        log.debug("PM 교체할 정보 : {}", proJSVO);
        service.updateProjectManager(proJSVO);
        
        return "PM 변경 성공";
    }
    
    
    
}
