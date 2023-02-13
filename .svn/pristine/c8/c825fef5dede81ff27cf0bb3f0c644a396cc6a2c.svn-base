package kr.or.ddit.controller.project.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.common.CommonDao;
import kr.or.ddit.mapper.ProjectJoinMapper;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProjectJoinStateVO;

@Service
public class ProjectJoinServiceImpl implements IProjectJoinService {
	
	@Inject
	private ProjectJoinMapper mapper;
	@Inject
	private CommonDao dao;
	
	@Override
	public int insertProJoin(ProjectJoinStateVO vo) {
		return mapper.insertProJoin(vo);
	}

	@Override
	public int updateProJoinState(ProjectJoinStateVO vo) {
		return mapper.updateProJoinState(vo);
	}

	@Override
	public int updateProAuth(ProjectJoinStateVO vo) {
		return mapper.updateProAuth(vo);
	}

	@Override
	public ProjectJoinStateVO  selectProJoin(ProjectJoinStateVO vo) {
		// TODO Auto-generated method stub
		return mapper.selectProJoin(vo);
	}

    @Override
    public ProjectJoinStateVO checkAuth(Map<String, String> map) throws Exception {
        return dao.select("checkAuth", map);
    }

}
