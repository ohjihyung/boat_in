package kr.or.ddit.controller.letter.service;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import kr.common.CommonDao;
import kr.or.ddit.mapper.LetterMapper;
import kr.or.ddit.vo.FileLocationVO;
import kr.or.ddit.vo.FileVO;
import kr.or.ddit.vo.LetterVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class LetterServiceImpl implements ILetterService {

	@Inject
	CommonDao dao;
	
	@Inject
	LetterMapper mapper;
	
	@Override
	public String sendLetter_H(LetterVO letterVO) {
	    mapper.sendLetter_H(letterVO);
	    
	    String letterNo = letterVO.getLetterNo();
	    
	    return letterNo;
	}

    @Override
    public int sendLetterFileLocation_K() throws Exception {
        FileLocationVO vo = new FileLocationVO();
        dao.insert("sendLetterFileLocation_K", vo);
        log.debug("생성된 시퀀스번호 : {}", vo.getFileLNo());
        
        return vo.getFileLNo();
    }

    @Override
    public void sendLetterFile_K(FileVO fileVO) throws Exception {
        dao.insert("sendLetterFile_K", fileVO);
    }
	
	
	
}
