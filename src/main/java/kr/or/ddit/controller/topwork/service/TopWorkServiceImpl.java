package kr.or.ddit.controller.topwork.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.common.CommonDao;
import kr.or.ddit.mapper.FileTreeMapper;
import kr.or.ddit.mapper.ProjectMapper;
import kr.or.ddit.mapper.TopWorkMapper;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProjectLogVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SubWorkVO;
import kr.or.ddit.vo.TopWorkCategoryVO;
import kr.or.ddit.vo.TopWorkComentVO;
import kr.or.ddit.vo.TopWorkRelationVO;
import kr.or.ddit.vo.TopWorkVO;
import lombok.extern.slf4j.Slf4j;


@Service
@Slf4j
public class TopWorkServiceImpl implements ITopWorkService {
    @Inject
    private TopWorkMapper mapper;
    @Inject
    private FileTreeMapper fileTreeMapper;
    @Inject
    private ProjectMapper projectMapper;

    @Inject
    private CommonDao dao;
    @Override
    public List<TopWorkVO> list(String proNo) throws Exception {
        //return mapper.list(proNo);
        return dao.list("topWorklist", proNo);
        
    }

    @Override
    public String insert(TopWorkVO topWorkVO) throws Exception {
        if (topWorkVO.getTopWorkFile() == null) {
            topWorkVO.setTopWorkFile("0");
        }

        mapper.insert(topWorkVO);//인서트 이후 topWorkNo가 추가되어있음.
        log.debug("topWorkVO 상태: {}", topWorkVO);
        //파일 로케이션에 바로 추가하기


        return topWorkVO.getTopWorkNo();
    }

    @Override
    public void updateMove(TopWorkVO topWorkVO) throws Exception {
        mapper.updateMove(topWorkVO);
    }

    @Override
    public void update(TopWorkVO topWorkVO) throws Exception {
        mapper.update(topWorkVO);

    }

    @Override
    public void delete(TopWorkVO topWorkVO) throws Exception {
        mapper.delete(topWorkVO);
    }

    @Override
    public List<TopWorkCategoryVO> categoryList(String proNo) throws Exception {
        return mapper.categoryList(proNo);
    }

    @Override
    public void categoryInsert(TopWorkCategoryVO topWorkCategoryVO) throws Exception {
        mapper.categoryInsert(topWorkCategoryVO);
    }

    @Override
    public void categoryDelete(TopWorkCategoryVO topWorkCategoryVO) throws Exception {
        //카테고리 삭제 전에 해당 카테고리에 있는 작업들 위치 변경해줘야함.
        List<TopWorkVO> topWorkList = mapper.selectTopWork(topWorkCategoryVO.getTwCategoryNo());

        //삭제할 카테고리에 일감 리스트가 있으면 Wating으로 이동시켜준다.
        if (topWorkList.size() > 0) {
            for (TopWorkVO item : topWorkList) {
                mapper.topWorkWaiting(item);

                //이동 후 로그 기록
                String proLogContent = item.getTwCategoryNo() + "에서 "
                                     + "1 으로 이동됨";
                ProjectLogVO projectLogVO = new ProjectLogVO();
                projectLogVO.setProNo(item.getProNo());
                projectLogVO.setProLogContent(proLogContent);
                projectLogVO.setTopWorkNo(item.getTopWorkNo());
                log.debug("projectLogVO : {}", projectLogVO);

                mapper.logInsert(projectLogVO);
            }
        }

        mapper.categoryDelete(topWorkCategoryVO);
    }

    @Override
    public void topWorkMove(TopWorkVO topWorkVO) throws Exception {
        mapper.topWorkMove(topWorkVO);
    }

    @Override
    public void logInsert(Map<String, String> map) throws Exception {
        String beforeTwCategoryNo = map.get("beforeTwCategoryNo");
        String afterTwCategoryNo = map.get("twCategoryNo");

        if (beforeTwCategoryNo.equals(afterTwCategoryNo)) {
            return;
        }

        //카테고리 no로 이름 알아내기
        //beforeTwCategoryName
        String beforeTwCategoryName = dao.select("selectCategoryName", beforeTwCategoryNo);
        String afterTwCategoryName = dao.select("selectCategoryName", afterTwCategoryNo);

        String topWorkNo = map.get("topWorkNo");
        String proLogContent = "'" + beforeTwCategoryName + "'에서 '"
                + afterTwCategoryName + "'으로 이동됨.";

        //필요한건 프로젝트 번호(탑워크도 다 있음)
        TopWorkVO topWorkVO = mapper.select(topWorkNo);

        ProjectLogVO projectLogVO = new ProjectLogVO();
        projectLogVO.setProNo(topWorkVO.getProNo());
        projectLogVO.setProLogContent(proLogContent);
        projectLogVO.setTopWorkNo(topWorkNo);
        //프로그레스는 현재 그대로 둘 다 기록
        projectLogVO.setProLogProgressOrigin(topWorkVO.getTopWorkProgress());
        projectLogVO.setProLogProgressNew(topWorkVO.getTopWorkProgress());

        log.debug("인서트될 로그 : {}", projectLogVO);

        mapper.logInsert(projectLogVO);
    }

    @Override
    public void categoryUpdate(TopWorkCategoryVO topWorkCategoryVO) throws Exception {
        mapper.categoryUpdate(topWorkCategoryVO);

        // 파일트리 - 카테고리 업데이트
//        fileTreeMapper.categoryUpdate(topWorkCategoryVO);
    }

    @Override
    public TopWorkVO select(TopWorkVO topWorkVO) throws Exception {
        return mapper.select(topWorkVO.getTopWorkNo());
    }

    @Override
    public void topWorkUpdate(TopWorkVO topWorkVO) throws Exception {
        mapper.topWorkUpdate(topWorkVO);

        // 파일트리 - 상위작업 업데이트
//        fileTreeMapper.topWorkUpdate(topWorkVO);
    }

    @Override
    public void topWorkDelete(TopWorkVO topWorkVO) throws Exception {
        //삭제 전 로그 날려야함 (최종 적용시엔 하위 삭제(첨부파일삭제-> 댓글삭제-> 로그삭제-> 일감삭제) 후 상위도 동일)
        ProjectLogVO projectLogVO = new ProjectLogVO();
        projectLogVO.setTopWorkNo(topWorkVO.getTopWorkNo());
        mapper.logDelete(projectLogVO);
        //처리가 다 끝나면 그때 작업 삭제(실제로는 삭제안하고 TOPWORK_DELETE를 'T'로 업데이트)
        mapper.topWorkDelete(topWorkVO);
    }

    @Override
    public void insertRelation(TopWorkRelationVO topWorkRelationVO) throws Exception {
        mapper.insertRelation(topWorkRelationVO);
    }

    @Override
    public String selectCategoryColor(String twCategoryNo) throws Exception {
        return mapper.selectCategoryColor(twCategoryNo);
    }

    @Override
    public List<TopWorkVO> myList(Map<String, String> map) throws Exception {
        return mapper.myList(map);
    }

 // OJH 생성된 상위카테고리에다가 FILELOCATION 첨부위치번호 연결해주기
	@Override
	public void updateTopworkFile(Map<String, String> uploadData) throws Exception {
			mapper.updateTopworkFile(uploadData);

	}

    @Override
    public List<TopWorkVO> topWorkMyList(Map<String, String> map) throws Exception {
        return mapper.myList(map);
    }

    @Override
    public List<TopWorkCategoryVO> categoryPersonal() throws Exception {
        return mapper.categoryPersonal();
    }

    @Override
    public void moveState(TopWorkVO topWorkVO) throws Exception {
        TopWorkVO originVO = mapper.select(topWorkVO.getTopWorkNo());

        //완료에서 다른 곳으로 이동
        if (originVO.getTopWorkState() == 2 && topWorkVO.getTopWorkState() != 2) {
            topWorkVO.setTopWorkProgress("90");
            dao.update("updateProgress", topWorkVO);
        }

        //다른 곳에서 완료로 이동
        if (topWorkVO.getTopWorkState() == 2) {
            topWorkVO.setTopWorkProgress("100");

            dao.update("updateProgress", topWorkVO);
            dao.update("topWorkComplete", topWorkVO);
        }

        mapper.moveState(topWorkVO);
    }



    // ojh 카테고리 번호로 카테고리 이름가져오는 메서드
	@Override
	public String getCategoryName(String CategoryNo) {
		// TODO Auto-generated method stub
		return mapper.getCategoryName(CategoryNo);
	}

	@Override
	public List<ProjectLogVO> logList(TopWorkVO topWorkVO) throws Exception {
	    return mapper.logList(topWorkVO);
	}

	// OJH TopWorkNo 로  TopworkTitle 가져오는 함수
	@Override
	public String getTopWorkTitle(String topWorkNo) {

		return mapper.getTopWorkTitle(topWorkNo);
	}

	@Override
    public List<TopWorkRelationVO> selectMemberList(TopWorkVO topWorkVO) throws Exception {
        return mapper.selectMemberList(topWorkVO);
    }

    @Override
    public void topWorkUpdate_K(TopWorkVO topWorkVO) throws Exception {
        //로그 프로그레스 기록용 뽑기
        Map<String, String> map = dao.select("selectOriginProgress", topWorkVO);
        log.debug("에러나는 맵 : {}", map);
        log.debug("들어오는 vo는? {}", topWorkVO);

        ProjectLogVO proLogVO = new ProjectLogVO();

        String originProgress = map.get("TOPWORK_PROGRESS");
        String newProgress = topWorkVO.getTopWorkProgress();

        if (!originProgress.equals(newProgress)) {
            //프로젝트 번호 뽑기
            String proNo = dao.select("getProNo", topWorkVO.getTopWorkNo());
            log.debug("해당 프로젝트 번호 : {} ", proNo);

            //프로젝트 총진행률 업데이트 및 로그
            Map<String, String> map2 = new HashMap<>();
            map2.put("proNo1", proNo);
            map2.put("proNo2", proNo);
            int res  = projectMapper.updateProTotalRate(map2);
            log.debug("총진행도 업데이트횟수 : {} ",res);
            ProjectVO projectVO = projectMapper.selectOne(proNo);
            String proLogProgressTotal = projectVO.getProTotalrate();
            log.debug("해당프로젝트 총 진행도: {} ",proLogProgressTotal);

            //진행률이 변경됐을때
            String proLogContent = "작업 진행률이 " + newProgress + "%로 변경되었습니다.";
            proLogVO.setTopWorkNo(topWorkVO.getTopWorkNo());
            proLogVO.setProNo(proNo);
            proLogVO.setProLogContent(proLogContent);
            proLogVO.setProLogProgressOrigin(originProgress);
            proLogVO.setProLogProgressNew(newProgress);
            proLogVO.setProLogProgressTotal(proLogProgressTotal);
            log.debug("인서트할 로그 : {}", proLogVO);
            dao.insert("topWorkProgressLogInsert", proLogVO);
        }

        if (newProgress.equals("100")) {
            topWorkVO.setTopWorkState(2);
        } else {
            topWorkVO.setTopWorkState(1);
        }

        dao.update("topWorkUpdate_K", topWorkVO);
    }

    @Override
    public List<TopWorkComentVO> topWorkComentList(TopWorkVO topWorkVO) throws Exception {
        return dao.list("topWorkComentList", topWorkVO);
    }

    @Override
    public String topWorkComentInsert(TopWorkComentVO topWorkComentVO) throws Exception {
        dao.insert("topWorkComentInsert", topWorkComentVO); //이후 PK값 있음

        String twComentNo = topWorkComentVO.getTwComentNo();

        return twComentNo;
    }

    @Override
    public void topWorkComentDelete(TopWorkComentVO topWorkComentVO) throws Exception {
        dao.update("topWorkComentDelete", topWorkComentVO);
    }

    @Override
    public void topWorkComentUpdate(TopWorkComentVO topWorkComentVO) throws Exception {
        dao.update("topWorkComentUpdate", topWorkComentVO);
    }

    @Override
    public TopWorkCategoryVO categorySelect(TopWorkVO topWorkVO) throws Exception {
        return dao.select("categorySelect", topWorkVO);
    }

    @Override
    public List<TopWorkCategoryVO> categoryPersonalList(String proNo) throws Exception {
        // TODO Auto-generated method stub
        return dao.selectList("categoryPersonalList", proNo);
    }

    @Override
    public void topWorkComplete(TopWorkVO topWorkVO) throws Exception {
        dao.update("topWorkComplete", topWorkVO);
    }

    @Override
    public void topWorkReject(TopWorkVO topWorkVO) throws Exception {
        dao.update("topWorkReject", topWorkVO);
    }

    @Override
    public String updateRelation(TopWorkRelationVO twRelationVO) throws Exception {
        //우선 인서트 전에 탐색하고 있으면 지우기
        List<TopWorkRelationVO> twList = dao.selectList("selectTopWorkRelationList", twRelationVO.getTopWorkNo());
        List<String> originTWRelationNo = null;

        log.debug("관계 점검할 상위작업 번호 : {}", twRelationVO);
        log.debug("관계 점검할 상위작업 리스트 : {}", twList);
        //유효성 체크
        //1. 기존에 지정되어있던 멤버인지

        //2. 해당 작업에 하위작업을 생성한 멤버가 지워지는지 - 중요
        if (twList.size() > 0) { //twList에는 각각의 관계 VO들이 있다.
//            for (int i = 0; i < twList.size(); i++) {
//                List<SubWorkVO> subWorkList = dao.selectList("selectRelationSubWorkList", twList.get(i).getTopWorkRNo());
//                log.debug("하위작업 검색결과 : {}", subWorkList);
//
//                if (subWorkList.size() > 0) {
//                    return "멤버수정불가";
//                }
//            }

            dao.delete("deleteTopWorkRelation", twRelationVO.getTopWorkNo());
        }

        dao.insert("insertRelation", twRelationVO);
        return "수정 성공";
    }

    @Override
    public String memberChangeCheck(HashMap<String, Object> map) throws Exception {

        List<Object> originMemberList = (List<Object>) map.get("originMemberArray");
        List<Object> newMemberList = (List<Object>) map.get("newMemberArray");
        //타입은 String
        //log.debug("originMemberList : {}, 타입 : {}", originMemberList, originMemberList.get(0).getClass().getName());
        //log.debug("newMemberList : {}, 타입 : {}", newMemberList, newMemberList.get(0).getClass().getName());
        //log.debug("topWorkNo 타입 : {}", map.get("topWorkNo").getClass().getName());
        String topWorkNo = (String) map.get("topWorkNo");
        log.debug("탑워크 : {}", topWorkNo);

        List<MemberVO> originMembers = new ArrayList<>();
        List<MemberVO> newMembers = new ArrayList<>();

        for (Object item : originMemberList) {
            MemberVO vo = new MemberVO();
            vo.setMemberId((String) item);
            originMembers.add(vo);
        }

        for (Object item : newMemberList) {
            MemberVO vo = new MemberVO();
            vo.setMemberId((String) item);
            newMembers.add(vo);
        }

        log.debug("형변환 성공한 기존 작업자 리스트 : {}", originMembers);
        log.debug("형변환 성공한 신규 작업자 리스트 : {}", newMembers);

        //이제 기존 멤버로 subwork 탐색하기 -> 관계테이블에서 해당 멤버와 작업번호 검색해야함.
        int subWorkCnt = 0;

        for (MemberVO item : originMembers) {
            TopWorkRelationVO twRelationVO = new TopWorkRelationVO();
            twRelationVO.setMemberId(item.getMemberId());
            twRelationVO.setTopWorkNo(topWorkNo);
            log.debug("검색할 vo : {}", twRelationVO);
            //먼저 관계번호 얻어내기 (서브워크 검색하기 위함)
            TopWorkRelationVO selectVO = dao.select("selectTopWorkRelation", twRelationVO);
            log.debug("검색된 vo : {}", selectVO); //관계번호 있음.

            List<SubWorkVO> subWorkList = dao.selectList("selectRelationSubWorkList", selectVO.getTopWorkRNo());
            log.debug("검색된 기존작업자와 관련된 하위작업 리스트 : {}", subWorkList);

            if (subWorkList.size() > 0) {
                subWorkCnt++;
            }

        }

        if (subWorkCnt > 0) {
            return "작업자 변경 불가";
        } else {
            //여기서 작업자 변경 로직 시작해야함.
            //기존 관계 삭제
            dao.delete("deleteTopWorkRelation", topWorkNo);
            //
            for (MemberVO item : newMembers) {
                TopWorkRelationVO newTWRelationVO = new TopWorkRelationVO();
                newTWRelationVO.setMemberId(item.getMemberId());
                newTWRelationVO.setTopWorkNo(topWorkNo);

                dao.insert("insertRelation", newTWRelationVO);
            }

            return "작업자 변경 성공";
        }



    }

    @Override
    public List<TopWorkVO> categoryComplete(ProjectVO vo) throws Exception {
        return dao.selectList("categoryComplete", vo);
    }

    @Override
    public List<TopWorkVO> completeList(String proNo) throws Exception {
        return dao.selectList("completeList", proNo);
    }

	@Override
	public String getProNobyTopWork(String topWorkNo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.getProNobyTopWork(topWorkNo);
	}

    @Override
    public List<ProjectLogVO> logListChart(TopWorkVO topWorkVO) throws Exception {
        return dao.selectList("logListChart", topWorkVO);
    }


}
