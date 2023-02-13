package kr.or.ddit.controller.subwork.service;

import java.lang.reflect.Member;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

import kr.common.CommonDao;
import kr.or.ddit.mapper.SubWorkMapper;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProjectLogVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SubWorkComentVO;
import kr.or.ddit.vo.SubWorkVO;
import kr.or.ddit.vo.TopWorkComentVO;
import kr.or.ddit.vo.TopWorkRelationVO;
import kr.or.ddit.vo.TopWorkVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class SubWorkServiceImpl implements ISubWorkService {
    @Inject
    private SubWorkMapper mapper;
    @Inject
    private CommonDao dao;
    
    @Override
    public String subWorkInsert(SubWorkVO subWorkVO) throws Exception {
        mapper.subWorkInsert(subWorkVO);
        
        return subWorkVO.getSubWorkNo();
    }

    @Override
    public List<SubWorkVO> subWorkList(TopWorkVO topWorkVO) throws Exception {
        return mapper.subWorkList(topWorkVO);
    }

    @Override
    public SubWorkVO subWorkDetail(SubWorkVO vo) throws Exception {
        return dao.select("subWorkDetail", vo);
    }

    @Override
    public MemberVO selectSubWorkMember(SubWorkVO vo) throws Exception {
        return dao.select("selectSubWorkMember", vo);
    }

    @Override
    public MemberVO selectMemberListSubWork(SubWorkVO vo) throws Exception {
        return dao.select("selectMemberListSubWork", vo);
    }

    @Override
    public void subWorkUpdate_K(SubWorkVO subWorkVO) throws Exception {
        //진행률이 변경되었을 때 로그 기록하기
        Map<String, String> map = dao.select("selectOriginProgressSubWork", subWorkVO.getSubWorkNo());
        log.debug("서브워크 로그용 맵 : {}", map);
        String originProgress = map.get("SUBWORK_PROGRESS");
        String newProgress = subWorkVO.getSubWorkProgress();
        
        if (!originProgress.equals(newProgress)) {
            String proLogContent = "작업 진행률이 " + newProgress + "%로 변경되었습니다.";
            ProjectLogVO proLogVO = new ProjectLogVO();
            proLogVO.setProNo(map.get("PRO_NO"));
            proLogVO.setTopWorkNo(subWorkVO.getTopWorkNo());
            proLogVO.setSubWorkNo(subWorkVO.getSubWorkNo());
            proLogVO.setProLogContent(proLogContent);
            proLogVO.setProLogProgressOrigin(originProgress);
            proLogVO.setProLogProgressNew(newProgress);
            
            log.debug("인서트할 서브워크의 로그 : {}", proLogVO);
            dao.insert("subWorkProgressLogInsert", proLogVO);
        }
        
        
        dao.update("subWorkUpdate_K", subWorkVO);
    }

    @Override
    public List<ProjectLogVO> subWorkLogList(SubWorkVO subWorkVO) throws Exception {
        return dao.selectList("subWorkLogList", subWorkVO);
    }

    @Override
    public List<SubWorkComentVO> subWorkComentList(SubWorkVO subWorkVO) throws Exception {
        return dao.selectList("subWorkComentList", subWorkVO);
    }

    @Override
    public String subWorkComentInsert(SubWorkComentVO swComentVO) throws Exception {
        dao.insert("subWorkComentInsert", swComentVO);
        
        return swComentVO.getSwComentNo();
    }

    @Override
    public void subWorkComentDelete(SubWorkComentVO swComentVO) throws Exception {
        dao.update("subWorkComentDelete", swComentVO);
    }

    @Override
    public void subWorkComentUpdate(SubWorkComentVO swComentVO) throws Exception {
        dao.update("subWorkComentUpdate", swComentVO);
    }

    @Override
    public List<SubWorkVO> selectAllSubWork(ProjectVO projectVO) throws Exception {
        return dao.selectList("selectAllSubWork", projectVO);
    }

    @Override
    public void subWorkDelete(SubWorkVO vo) throws Exception {
        dao.update("subWorkDelete", vo);
    }

    @Override
    public List<SubWorkVO> getChangeSubWork(HashMap<String, Object> map) throws Exception {
        String topWorkNo = (String) map.get("topWorkNo");
        log.debug("하위작업 검색할 topWorkNo : {}", topWorkNo);
        
        return dao.selectList("getChangeSubWork", topWorkNo);
    }

    @Override
    public Map<String, String> setChangeSubWork(HashMap<String, Object> map) throws Exception {
        
        List<Object> newWorkArray = (List<Object>) map.get("newWorkArray");
        LinkedHashMap<String, String> changeMap = (LinkedHashMap<String, String>) map.get("changeMap");
        String topWorkNo = (String) map.get("topWorkNo");
        
        log.debug("newWorkArray : {}", newWorkArray);
        log.debug("changeMap : {}", changeMap);
        log.debug("topWorkNo : {}", topWorkNo);
        
        //1. 기존 관계 테이블 전체 삭제
        //2. 새로운 인원 전체 추가 -> 이것만 찾아내면 됨.
        //3. 관계테이블에서 해당 멤버아이디로 번호 조회 후 그 하위작업 번호에 관계번호 업데이트
        /////////////////////
        //1.
        dao.delete("deleteTopWorkRelation", topWorkNo);
        
        //2. 신규 관계번호 인서트
        //그러기위해선 vo를 만들고 멤버아이디와 상위작업번호 넣어야함
        
        //새로운 작업자 관계 행 리스트.
        List<TopWorkRelationVO> twRelationList = new ArrayList<>();
        
        for (int i = 0; i < newWorkArray.size(); i++) {
            TopWorkRelationVO vo = new TopWorkRelationVO();
            vo.setMemberId((String) newWorkArray.get(i));
            vo.setTopWorkNo(topWorkNo);
            twRelationList.add(vo); 
        }
        
        log.debug("twRelationList : {}", twRelationList);
        
        //로직이 변경될 여지가 있으니
        //반복문을 분리해서 관계vo 인서트
        for (TopWorkRelationVO twRelationVO : twRelationList) {
            dao.insert("insertRelation", twRelationVO);
        }
        
        //그다음 하위작업 번호와 담당자 아이디.
        ///담당자 아이디 + 상위작업번호로 관계테이블 조회-> 새로 생긴 번호 조회됨
        // 그 번호를 하위작업에 업데이트 해준다.
        
        for (Entry<String, String> entry : changeMap.entrySet()) {
            //log.debug("키값 {}, 밸류값 {}", entry.getKey(), entry.getValue());
            String subWorkNo = entry.getKey();
            String memberId = (String) entry.getValue().toString();
            log.debug("재배치할 하위작업 번호 : {}", subWorkNo);
            log.debug("그걸 담당할 작업자 : {}", memberId);
            
            TopWorkRelationVO twRVO = new TopWorkRelationVO();
            twRVO.setMemberId(memberId);
            twRVO.setTopWorkNo(topWorkNo);
            twRVO = dao.select("selectNewRelation", twRVO);
            
            String newRelationNumber = twRVO.getTopWorkRNo();
            
            //하위작업에 관계번호 업데이트해주기
            SubWorkVO subWorkVO = new SubWorkVO();
            subWorkVO.setSubWorkNo(subWorkNo);
            subWorkVO.setTopWorkRNo(newRelationNumber);
            dao.update("updateSubWorkMember", subWorkVO);
            //그럼이제 끝인가... 디버그해보쟈..
        }
        
        
        
        
        
        
//        List<Object> workerArray = (List<Object>) map.get("workerArray");
//        String newWorker = (String) map.get("newWorker");
//        String subWorkNo = (String) map.get("subWorkNo");
//        
//        log.debug("workerArray : {}, 타입 : {}", workerArray, workerArray.get(0).getClass().getName());
//        //workerArray는 새로운 멤버 리스트
//        
//        //1. 기존 관계번호 삭제
//        
//        //2. 신규 관계번호 인서트
//        //그러기위해선 vo를 만들고 멤버아이디와 상위작업번호 넣어야함
//        //List<TopWorkRelationVO> twRelationList = new ArrayList<>();
//        
//        for (int i = 0; i < workerArray.size(); i++) {
//            TopWorkRelationVO vo = new TopWorkRelationVO();
//            vo.setMemberId((String) workerArray.get(i));
//            vo.setTopWorkNo(topWorkNo);
//            twRelationList.add(vo); //새로운 작업자 관계 행 리스트.
//        }
//        //해시맵에서 subwork 빼내기 
//        //현재 방식으론 무조건 vo는 하나만 옴
//        Map<String, String> updateMap = new HashMap<String, String>();
//        updateMap.put("subWorkNo", subWorkNo);
//        updateMap.put("memberId", newWorker); //드래그된 하위작업 담당자
//        log.debug("업데이트할 updateMap : {}", updateMap);
//        
//        for (TopWorkRelationVO twRelationVO : twRelationList) {
//            dao.insert("insertRelation", twRelationVO);
//            //인서트 완료했으면 그 번호를 받아서 하위작업에 업데이트.
//            String topWorkRNo = twRelationVO.getTopWorkRNo();
//            log.debug("새로생긴 관계번호 : {}", topWorkRNo);
//            //지금 뭔가 에러가 있다.
//            //관계vo의 아이디와 updateMap의 아이디가 같으면 업데이트.. 
//            //근데 리스트는 여러개고 맵은 하난데?
//            log.debug("여기 이상해");
//            log.debug("twRelationVO.getMemberId() : {}", twRelationVO.getMemberId());
//            log.debug("updateMap.get(memberId) : {}", updateMap.get("memberId"));
//            
//            if (twRelationVO.getMemberId().equals(updateMap.get("memberId"))) {
//                SubWorkVO subWorkVO = new SubWorkVO();
//                subWorkVO.setSubWorkNo(updateMap.get("subWorkNo"));
//                subWorkVO.setTopWorkRNo(topWorkRNo);
//                
//                log.debug("새롭게 관계 업데이트할 정보 : {}", subWorkVO);
//                dao.update("updateSubWorkRelation", subWorkVO);
//            }
//            
//        }
        
        return null;
    }

}
