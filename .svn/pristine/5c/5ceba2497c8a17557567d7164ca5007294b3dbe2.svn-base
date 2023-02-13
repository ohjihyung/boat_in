package kr.or.ddit.controller.cs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.common.CommonDao;
import kr.or.ddit.mapper.NoticeMapper;
import kr.or.ddit.vo.NoticeVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class NoticeServiceImpl implements INoticeService {
	
	@Autowired
	private NoticeMapper noticeMapper;
	@Inject
	private CommonDao dao;

	// SSY 공지사항 리스트 받아오기
	@Override
	public List<NoticeVO> getNoticeList() throws Exception {
		return noticeMapper.getNoticeList();
	}

	// SSY 글번호에 따른 공지사항 디테일 가져오기
	@Override
	public NoticeVO getDetail(NoticeVO noticeVO) throws Exception {
		return noticeMapper.getDetail(noticeVO);
	}

	
	@Override
	public NoticeVO noticeInsert(NoticeVO noticeVO) throws Exception {
		log.debug("vo : {}", noticeVO);
		dao.insert("noticeInsert", noticeVO);
		log.debug("vo : {}", noticeVO);
		
		NoticeVO vo = dao.select("selectNotice", noticeVO.getSysNNo());
		
		return vo;
	}

	@Override
	public void updateNotice(NoticeVO noticeVO) throws Exception {
		dao.update("updateNotice", noticeVO);
	}

	@Override
	public void hitUp(NoticeVO noticeVO) throws Exception {
		dao.update("hitUp", noticeVO);
	}

	@Override
	public void noticeDelete(NoticeVO noticeVO) throws Exception {
		dao.update("noticeDelete", noticeVO);
	}

	@Override
	public List<NoticeVO> getNoticeList_work() throws Exception {
		String category = "작업";
		return dao.selectList("selectCategoryList", category);
	}

	@Override
	public List<NoticeVO> getNoticeList_service() throws Exception {
		String category = "서비스";
		return dao.selectList("selectCategoryList", category);
	}

	@Override
	public List<NoticeVO> getNoticeList_update() throws Exception {
		String category = "업데이트";
		return dao.selectList("selectCategoryList", category);
	}


}
