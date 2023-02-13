package kr.or.ddit.controller.project;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.tiles.extras.module.ModularTilesListener;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.controller.project.service.IGdocsService;
import kr.or.ddit.controller.project.service.IProjectService;
import kr.or.ddit.controller.upload.IUploadService;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProjectJoinStateVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.TopWorkVO;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/project")
@Controller
@Slf4j
public class ProjectController {
    @Inject
    private IProjectService projectService;

    @Inject
    private IUploadService UploadService;
    
    @Inject
    private IGdocsService gdocsService;

    @PostMapping(value = "/insert", produces = "text/plain; charset=utf-8")
    @ResponseBody
    public String projectInsert(@RequestBody ProjectVO projectVO, HttpServletRequest req) throws Exception {
        log.debug("프로젝트만들 객체 : {}", projectVO);
        String proNo = projectService.insert(projectVO);
        
        //OJH 프로젝트 생성시 해당 프로젝트 폴더 만드는 서비스
        UploadService.mkProjectDir(projectVO, req);
        
        //프로젝트 생성시 gdocs 하나 생성 
        gdocsService.insertDocs(proNo);

        return proNo;
    }

    @GetMapping("/home")
    public String projectMain(String proNo) throws Exception {
        log.debug("proNO : {}", proNo);
        
        return "content/projectHome";
    }
    /*
     * @GetMapping("/test") public String projectTest() {
     * sql을 위한..
     * return "spl/calendar"; }
     */

    @GetMapping("/home_spa")
    public String home_spa() throws Exception {
        return "spa/project-home";
    }

    @GetMapping("/calendar_spa")
    public String calendar_spa() {
        return "spa/calendar";
    }
    
    @GetMapping("/kanban_spa")
    public String kanban_spa() {
        return "spa/kanban";
    }
    
    @GetMapping("/dataRoom_spa")
    public String dataRoom_spa() {
//    	log.debug("여기는 projectController");
        return "spa/dataRoom";
    }
    
    @GetMapping("/gdocs_spa")
    public String gdocs_spa() {
    	return "spa/gdocs";
    }
    
    @GetMapping("/projectNotice_spa")
    public String pronotice_spa() {
    	return "spa/projectNotice";
    }
    
    @PostMapping(value = "/list", produces = "application/json; charset=utf-8")
    @ResponseBody
    public List<ProjectVO> projectList(@RequestBody MemberVO memberVO) throws Exception{
        List<ProjectVO> list = projectService.list(memberVO);
        
        return list;
    }
    
  
    @GetMapping(value = "/homeMemberList")
    @ResponseBody
    public List<ProjectJoinStateVO> teamMemberList(@RequestParam(name = "proNo", required = false) String proNo) throws Exception{
    	
    	List<ProjectJoinStateVO> teamMemberList = projectService.selectTeamMember(proNo);
    	
    	return teamMemberList;
    }
    
    @PostMapping(value = "/memberList", produces = "application/json; charset=utf-8")
    @ResponseBody
    public List<MemberVO> memberList(@RequestBody ProjectVO projectVO) throws Exception {
        log.debug("멤버리스트 뽑으러 왔다 : {}", projectVO);
        List<MemberVO> memberList = projectService.memberList(projectVO);
        
        return memberList;
    }
    
    /**
     * 프로젝트 홈화면에 표시할 참가한 회원 리스트 
     * @param proNo
     * @return
     * @throws Exception
     */
    @PostMapping(value = "/homeMemberList")
    @ResponseBody
    public List<ProjectJoinStateVO> teamMemberList2(@RequestBody ProjectJoinStateVO proJoinVO) throws Exception{
    	
    	List<ProjectJoinStateVO> teamMemberList = projectService.selectTeamMember(proJoinVO.getProNo());
    	
    	return teamMemberList;
    }
    
    @PostMapping(value = "/getProjectPeriod", produces = "application/json; charset=utf-8")
    @ResponseBody
    public ProjectVO getProjectPeriod(@RequestBody ProjectVO vo) throws Exception {
        log.debug("기간 조회할 프로젝트 번호 : {}", vo.getProNo());
        ProjectVO projectVO = projectService.getProjectPeriod(vo);
        
        return projectVO;
    }
    
    @PostMapping(value = "/getProjectResult", produces = "application/json; charset=utf-8")
    @ResponseBody
    public Map<String, Object> getProjectResult(@RequestBody ProjectVO projectVO) throws Exception {
        log.debug("프로젝트 정보수집");
        Map<String, Object> map = projectService.getProjectResult(projectVO);
        
        return map;
    }
    
    @PostMapping(value = "/finishProject", produces = "text/plain; charset=utf-8")
    @ResponseBody
    public String finishProject(@RequestBody Map<String, Object> map) throws Exception {
        log.debug("플젝 종결하러 들어온 맵 : {}", map);
        projectService.finishProject(map);
        
        return "프로젝트 종결 성공";
    }
    
    @PostMapping(value = "/selectProject", produces = "application/json; charset=utf-8")
    @ResponseBody
    public ProjectVO selectProject(@RequestBody ProjectVO vo) throws Exception {
        ProjectVO projectVO = projectService.selectProject(vo);
        
        return projectVO; 
    }
    
    @PostMapping(value = "/finishList", produces = "application/json; charset=utf-8") 
    @ResponseBody
    public List<ProjectVO> finishList(@RequestBody MemberVO vo) throws Exception {
        List<ProjectVO> list = projectService.finishList(vo);
        
        return list;
    }

}
