package kr.or.ddit.controller.security.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.SecurityMapper;
import kr.or.ddit.vo.LoginLogVO;

@Service
public class SecurityServiceImpl implements ISecurityService {
	
	@Inject
	private SecurityMapper mapper;
	
	@Override
	public void loginLog(LoginLogVO loginLogVO) {
		mapper.insertLog(loginLogVO);

	}

}
