package kr.or.ddit.controller.project.service;

import java.util.List;

import kr.or.ddit.vo.ProjectNoticeVO;


public interface IProjectNoticeService {
	// 게시글 추가
	public int insert(ProjectNoticeVO projectNoticeVO) throws Exception;
	
	// 게시글 출력
	public List<ProjectNoticeVO> selectList(String proNo) throws Exception;	
	
	// 게시글 번호 선택
	public ProjectNoticeVO select(String proNoticeNo) throws Exception;	
	
	// 게시글 수정
	public int update(ProjectNoticeVO projectNoticeVO) throws Exception;
	
	// 게시글 삭제
	public void delete(ProjectNoticeVO vo) throws Exception;
	
	// 프로젝트 참여인력 조회
	public List<ProjectNoticeVO> selectJoinMemberList(String proNo) throws Exception;
	
	// 게시글 파일 리얼패스 추가 수정
	public void updateRealPath(ProjectNoticeVO noticeVO);

	public String selectProjectManagerId(String proNo);	
}
