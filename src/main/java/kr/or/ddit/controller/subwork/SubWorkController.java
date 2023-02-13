package kr.or.ddit.controller.subwork;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.controller.subwork.service.ISubWorkService;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProjectLogVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SubWorkComentVO;
import kr.or.ddit.vo.SubWorkVO;
import kr.or.ddit.vo.TopWorkComentVO;
import kr.or.ddit.vo.TopWorkVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/subWork")
public class SubWorkController {
    @Inject
    private ISubWorkService service;
    
    /**김진호
     * @param subWorkVO
     * @return 새로 인서트된 subWorkNo
     * @throws Exception
     */
    @PostMapping(value = "/subWorkInsert", produces = "text/plain; charset=utf-8")
    @ResponseBody
    public String subWorkInsert(@RequestBody SubWorkVO subWorkVO) throws Exception {
        log.debug("인서트하러 온 서브워크 : {}", subWorkVO);
        
        return service.subWorkInsert(subWorkVO);
    }
    
    @PostMapping(value = "/subWorkList", produces = "application/json; charset=utf-8")
    @ResponseBody
    public List<SubWorkVO> subWorkList(@RequestBody TopWorkVO topWorkVO) throws Exception {
        log.debug("서브워크리스트 조회할 탑워크객체 : {}", topWorkVO);
        List<SubWorkVO> subWorkList = service.subWorkList(topWorkVO);
        
        return subWorkList;
    }
    
    @PostMapping(value = "/subWorkDetail", produces = "application/json; charset=utf-8")
    @ResponseBody
    public SubWorkVO subWorkDetail(@RequestBody SubWorkVO vo) throws Exception {
        log.debug("서브워크 디테일할 객체 : {}", vo);
        SubWorkVO subWorkVO = service.subWorkDetail(vo);
        
        return subWorkVO;
    }
    
    @PostMapping(value = "/selectSubWorkMember", produces = "application/json; charset=utf-8")
    @ResponseBody
    public MemberVO selectSubWorkMember(@RequestBody SubWorkVO vo) throws Exception {
        MemberVO memberVO = service.selectSubWorkMember(vo);
        
        return memberVO;
    }
    
    @PostMapping(value = "/selectMemberListSubWork", produces = "application/json; charset=utf-8")
    @ResponseBody
    public MemberVO selectMemberListSubWork(@RequestBody SubWorkVO vo) throws Exception {
        log.debug("하위작업 조회할 정보 : {}", vo);
        MemberVO memberVO = service.selectMemberListSubWork(vo);
        
        return memberVO;
    }
    
    /**
     * 서브워크 업데이트
     * @param subWorkVO
     */
    @PostMapping(value = "/subWorkUpdate_K", produces = "text/plain; charset=utf-8")
    @ResponseBody
    public String subWorkUpdate_K(@RequestBody SubWorkVO subWorkVO) throws Exception {
        log.debug("업데이트할 서브워크 : {}", subWorkVO);
        service.subWorkUpdate_K(subWorkVO);
        
        return "서브워크 업데이트 성공";
    }
    
    @PostMapping(value = "/subWorkLogList", produces = "application/json; charset=utf-8")
    @ResponseBody
    public List<ProjectLogVO> subWorkLogList(@RequestBody SubWorkVO subWorkVO) throws Exception {
        log.debug("로그뽑을 서브워크 : {}", subWorkVO);
        List<ProjectLogVO> logList = service.subWorkLogList(subWorkVO);
        
        return logList;
    }
    
    /**
     * 디테일 조회시 함께 조회되는 댓글 리스트
     * @param subWorkVO
     * @return 해당 하위작업에 작성된 댓글 리스트
     */
    @PostMapping(value = "/subWorkComentList", produces = "application/json; charset=utf-8")
    @ResponseBody
    public List<SubWorkComentVO> subWorkComentList(@RequestBody SubWorkVO subWorkVO) throws Exception {
        log.debug("댓글 조회할 하위작업 : {}", subWorkVO);
        List<SubWorkComentVO> subWorkComentList = service.subWorkComentList(subWorkVO);
        log.debug("보내는 하위댓글들: {}", subWorkComentList);
        
        return subWorkComentList;
    }
    
    @PostMapping(value = "/subWorkComentInsert", produces = "text/plain; charset=utf-8")
    @ResponseBody
    public String subWorkComentInsert(@RequestBody SubWorkComentVO swComentVO) throws Exception {
        log.debug("인서트할 하위댓글 객체 : {}", swComentVO);
        String swComentNo = service.subWorkComentInsert(swComentVO);
        
        return swComentNo;
    }
    
    @PostMapping(value = "/subWorkComentDelete", produces = "text/plain; charset=utf-8")
    @ResponseBody
    public String subWorkComentDelete(@RequestBody SubWorkComentVO swComentVO) throws Exception {
        log.debug("삭제할 하위 댓글 : {}", swComentVO);
        service.subWorkComentDelete(swComentVO);
        
        return "하위 댓글 삭제 성공";
    }
    
    @PostMapping(value = "/subWorkComentUpdate", produces = "text/plain; charset=utf-8")
    @ResponseBody
    public String subWorkComentUpdate(@RequestBody SubWorkComentVO swComentVO) throws Exception {
        log.debug("업데이트할 하위 댓글 : {}", swComentVO);
        service.subWorkComentUpdate(swComentVO);
        
        return "하위 댓글 수정 성공";
    }
    
    @PostMapping(value = "/selectAllSubWork", produces = "application/json; charset=utf-8")
    @ResponseBody
    public List<SubWorkVO> selectAllSubWork(@RequestBody ProjectVO projectVO) throws Exception {
        log.debug("하위작업 조회할 프로젝트 : {}", projectVO);
        List<SubWorkVO> subWorkList = service.selectAllSubWork(projectVO);
        
        return subWorkList;
    }
    
    /**
     * 김진호
     * 하위작업 삭제 (SUBWORK_DELETE = 1)
     * @param subwWorkVO
     * @return 삭제된 하위작업이 속하는 상위작업 pk번호
     */
    @PostMapping(value = "/subWorkDelete", produces = "text/plain; charset=utf-8")
    @ResponseBody
    public String subWorkDelete(@RequestBody SubWorkVO vo) throws Exception {
        log.debug("삭제처리할 하위작업 번호 : {} ", vo.getSubWorkNo());
        service.subWorkDelete(vo);
        
        return vo.getTopWorkNo();
    }
    
    /**
     * 김진호
     * 담당자 변경시 하위작업 처리
     * @param memberList
     * @return 작업에 있는 하위 작업 목록
     * @throws Exception
     */
    @PostMapping(value = "/getChangeSubWork", produces = "application/json; charset=utf-8")
    @ResponseBody
    public List<SubWorkVO> getChangeSubWork(@RequestBody HashMap<String, Object> map) throws Exception {
        List<SubWorkVO> subWorkList = service.getChangeSubWork(map);
        
        return subWorkList;
    }
    
    /**
     * 김진호
     * 관계테이블 딜리트 및 인서트
     * 하위작업 업데이트 처리
     * @param map
     * @return 상위작업번호, 하위작업번호 등 리턴
     * @throws Exception
     */
    @PostMapping(value = "/setChangeSubWork", produces = "application/json; charset=utf-8")
    @ResponseBody
    public Map<String, String> setChangeSubWork(@RequestBody HashMap<String, Object> map) throws Exception {
        log.debug("최종맵 잘왔다 : {}", map);
        Map<String, String> returnMap = service.setChangeSubWork(map);
        
        return returnMap;
    }

}
