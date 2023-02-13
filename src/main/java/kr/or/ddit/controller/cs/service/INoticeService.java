package kr.or.ddit.controller.cs.service;

import java.util.List;

import kr.or.ddit.vo.NoticeVO;

public interface INoticeService {
	
	// SSY 공지사항 리스트 가져오기
	List<NoticeVO> getNoticeList() throws Exception;

	// SSY 글번호에 따른 공지사항 디테일 가져오기
	NoticeVO getDetail(NoticeVO noticeVO) throws Exception;

	NoticeVO noticeInsert(NoticeVO noticeVO) throws Exception;

	public void updateNotice(NoticeVO noticeVO) throws Exception;

	public void hitUp(NoticeVO noticeVO) throws Exception;

	void noticeDelete(NoticeVO noticeVO) throws Exception;

	List<NoticeVO> getNoticeList_work() throws Exception;

	List<NoticeVO> getNoticeList_service() throws Exception;

	List<NoticeVO> getNoticeList_update() throws Exception;

	

}
