package kr.or.ddit.controller.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.common.CommonDao;
import kr.or.ddit.mapper.ProjectMapper;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProjectJoinStateVO;
import kr.or.ddit.vo.ProjectVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProjectServiceImpl implements IProjectService {
    @Inject
    private ProjectMapper mapper;
    @Inject
    private CommonDao dao;

    @Override
    public String insert(ProjectVO projectVO) throws Exception {
        //1. 프로젝트 생성됨
        //테스트용으로 멤버아이디 어드민으로 줘봄.
        //projectVO.setMemberId("admin");
        mapper.insert(projectVO);
        //셀렉트 키로 인해 이후엔 proNo가 담겨있음
        log.debug("생성 후 projectaVO : {}", projectVO);

        //2. 프로젝트 참여 인원에 해당 멤버 넣어주기. -> 생성된 프로젝트번호, 생성자 아이디가 꼭 필요함.
        ProjectJoinStateVO proJSVO = new ProjectJoinStateVO();
        proJSVO.setProNo(projectVO.getProNo());
        proJSVO.setMemberId(projectVO.getMemberId());
        proJSVO.setProAuth("1");
        log.debug("proJSVO : {}", proJSVO);

        mapper.insertJoinState(proJSVO);


        //이후에 proNo 리턴해줘서 새로운 프로젝트의 홈으로 보내주기
        return projectVO.getProNo();
    }

    @Override
    public List<ProjectVO> list(MemberVO memberVO) throws Exception {
        return mapper.list(memberVO);
    }


	@Override
	public List<ProjectJoinStateVO> selectTeamMember(String proNo) throws Exception {
		return mapper.selectTeamMember(proNo);
	}
    
    // 프로젝트 하나 정보 불러오기
	@Override
	public ProjectVO selectOne(String proNo)throws Exception {
		return mapper.selectOne(proNo);
	}

    @Override
    public List<MemberVO> memberList(ProjectVO projectVO) throws Exception {
        // TODO Auto-generated method stub
        return mapper.memberList(projectVO);
    }

    @Override
    public ProjectVO getProjectPeriod(ProjectVO vo) throws Exception {
        return dao.select("getProjectPeriod", vo);
    }

    @Override
    public Map<String, Object> getProjectResult(ProjectVO projectVO) throws Exception {
        //기간, 생성 작업 수, 완료된 작업 수, 완료율
        List<Map<String, String>> list = dao.selectList("getProjectResult", projectVO);
        Map<String, Object> resultMap = new HashMap<>();
        String projectStart = "";
        String projectEnd = "";
        double totalCount = list.size();
        double completeCount = 0;
        double completeRatio = 0;
        
        for (int i = 0; i < list.size(); i++) {
            int progress = Integer.parseInt(list.get(i).get("TOPWORK_PROGRESS"));
            
            if (progress == 100) {
                completeCount++;
            }
            
            if (i == 0) {
                projectStart = list.get(i).get("PRO_START");
                projectEnd = list.get(i).get("PRO_END");
            }
        }
        
        completeRatio = Math.round(completeCount / totalCount * 100);
        
        resultMap.put("projectStart", projectStart);
        resultMap.put("projectEnd", projectEnd);
        resultMap.put("projectEnd", projectEnd);
        resultMap.put("totalCount", totalCount); //int
        resultMap.put("completeCount", completeCount); //int
        resultMap.put("completeRatio", completeRatio); //int
        
        return resultMap;
    }

    @Override
    public void finishProject(Map<String, Object> map) throws Exception {
        //log.debug("원래 맵 : {}", map);
        String finishReason = (String) map.get("finishReason");
        String proNo = (String) map.get("proNo");
        
        Map<String, String> proMap = new HashMap<>();
        proMap.put("finishReason", finishReason);
        proMap.put("proNo", proNo);
        
        //1. 프로젝트 상태, 종료일, 이유 업데이트 -> 모든 작업을 종료처리해야..
        dao.update("finishProject", proMap);
        
        List<Object> list = (List<Object>) map.get("memberGradeArray");
        Map<String, String> gradeMap = new HashMap<>();
        
        for (int i = 0; i < list.size(); i++) {
            gradeMap = (LinkedHashMap<String, String>) list.get(i);
            gradeMap.put("proNo", proNo);
            log.debug("gradeMap : {}", gradeMap);
            //2. 관계테이블 업데이트
            dao.update("ratingMember", gradeMap);
        }
        
    }

    @Override
    public ProjectVO selectProject(ProjectVO vo) throws Exception {
        return dao.select("selectProject", vo);
    }

    @Override
    public List<ProjectVO> finishList(MemberVO vo) throws Exception {
        return dao.selectList("finishList", vo);
    }

}
