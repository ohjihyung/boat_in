package kr.or.ddit.controller.upload;

import java.util.List;

import kr.or.ddit.vo.FileTreeVO;
import kr.or.ddit.vo.FileVO;
import kr.or.ddit.vo.ProjectVO;

public interface IFileTreeService {
	
	// SSY FILE_TREE테이블에서 proNo에 해당하는 데이터 리스트로 가져오기
	public List<FileTreeVO> dataList(String proNo) throws Exception;

	// SSY FILE_TREE테이블 데이터 초기화하기
	public int delData(String proNo);
	
	// SSY 중복처리된 FILE_TREE 테이블에서 proNo에 해당하는 데이터만 리스트로 가져오기
	public List<FileTreeVO> finalDataList(String proNo);
	
	// SSY MEMBER_ID로 MEMBER_NAME 가져오깅
	public String getMemberName(String memberId);
	
	// SSY PROJECT_JOIN_STATE 테이블에서 MEMBER_ID로 PRO_NO 가져오기
	public List<ProjectVO> getProNo(String memberId);

	// SSY MEMBER_ID로 가져온 PRO_NO에 해당하는 FILE_PATH 가져오기
	public List<FileVO> getMyFilePath(ProjectVO projectVO);
	
	// SSY FILE_TREE 테이블에서 MEMBER_ID로 가져온 PRO_NO에 해당하는 데이터만 중복 없이 가져오깅 
	public List<FileTreeVO> myFinalDataList(String memberId);

	
}
