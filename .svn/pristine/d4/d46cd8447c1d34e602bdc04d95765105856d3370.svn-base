package kr.or.ddit.controller.project.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.GdocsMapper;
import kr.or.ddit.vo.GdocsVO;

@Service
public class GdocsServiceImpl implements IGdocsService {

	@Inject
	GdocsMapper mapper;

	@Override
	public int insertDocs(String porNo) {
		return mapper.insertDocs(porNo);
	}

	@Override
	public int certifyDocs(GdocsVO gdocsVO) {
		return mapper.certifyDocs(gdocsVO);
	}

	@Override
	public GdocsVO selectOne(String proNo) {
		// TODO Auto-generated method stub
		return mapper.selectOne(proNo);
	}
	
}
