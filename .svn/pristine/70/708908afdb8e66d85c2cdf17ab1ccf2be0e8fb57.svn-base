package kr.or.ddit.controller.upload;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.vo.FileLocationVO;
import kr.or.ddit.vo.FileTreeVO;
import kr.or.ddit.vo.FileVO;
import kr.or.ddit.vo.MyFileVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SubWorkVO;
import kr.or.ddit.vo.TopWorkCategoryVO;
import kr.or.ddit.vo.TopWorkVO;

public interface IUploadService {

	// OJH  프로젝트 생성시 프로젝트 폴더 생성
	public void mkProjectDir(ProjectVO projectVO, HttpServletRequest req);

	// OJH  카테고리 생성시  프로젝트/카테고리 폴더 생성
	public void mkCategoryDir(TopWorkCategoryVO topWorkCategoryVO, HttpServletRequest req);

	// OJH 상위작업 생성시 파일 경로 설정
	public int insertFileLocation(FileLocationVO fileLocationVO);

	// OJH 상위작업 파일 업로드시 해당 파일들 db 넣기  이거 안됨 ㅠㅠ
	public int insertFiles(List<FileVO> list) throws Exception;

	// OJH 파일 하나하나 넣기
	public int insertFile(FileVO fileVO) throws Exception;

	// OJH 해당 카테고리 번호에 있는 모든 파일 가져오기
	public List<FileVO> getCategoryFiles(String twCategoryNo) throws Exception;

	// OJH 해당 카테고리 이름수정시 파일 경로 수정
	public int changeFilePath(FileVO cfile) throws Exception;

	// OJH 카테고리 번호로 해당 fileLocationVO의 file_l_no 들 가져오기
	public List<FileLocationVO> getfileLocations(String twCategoryNo);

	// OJH 카테고리 삭제시 해당 LOCATION 삭제 t 로 설정
	public int setLocationisDel(int fileLNo);

	// OJH 카테고리 삭제시 각각의 상위작업에 속해있는 파일들의 삭제여부 t로 설정
	public int setFileisDel(int fileLNo);

	// OJH 해당 상위작업 삭제시 해당 파일들 상태 t로 변경해주는 것
	public int topworkFileDel(TopWorkVO topwork);

	// OJH  해당 상위작업의 no로 그에 포함되있는 파일 path 가져오기
	public List<FileVO> getFilePath(TopWorkVO topWorkVO);

	// SSY proNo로 그에 해당하는 filePath 가져오기(=getFilePath With ProNo)
	public List<FileVO> getFilePathWP(String proNo);
	
	// OJH 상위작업 다른카테고리로 옮길시 해당 상위작업 파일경로 수정
	public int updateFilePath(FileVO f);
	
	public List<FileVO> selectFile(TopWorkVO topWorkVO) throws Exception;

	
	// SSY proNo로 해당 프로젝트 이름 가져오기
	public String getProName(String proNo);

	// SSY 트리 데이터 삽입하기
	public int insertRow(FileTreeVO fileTreeVO);

    public List<FileVO> selectFileSubWork(SubWorkVO subWorkVO) throws Exception;

	// SSY proNo로 FILE_REAL_NAME 가져오기(프로젝트 자료실)
	public List<FileVO> getRealName(Map<String, Object> fileInfoMap);

	// SSY proNo로 FILE_REAL_NAME 가져오기(내 자료실)
	public List<FileVO> getMyRealName(Map<String, Object> fileInfoMap);

	public List<FileVO> searchFile(Map<String, String> map) throws Exception;

    public List<FileVO> searchComentFile() throws Exception;

    public void fileDelete(FileVO fileVO) throws Exception;

    public List<FileVO> fileListOnlyTopWork(TopWorkVO topWorkVO) throws Exception;

    public List<FileVO> fileListOnlySubWork(SubWorkVO subWorkVO) throws Exception;
    
    // SSY MY_FILE 테이블에 내 자료실(담은 파일) 데이터 삽입하기
	public int insertMyRepo(MyFileVO myFileVO);
	
	// SSY MY_FILE 테이블에서 해당 멤버가 담은 파일 가져오기
	public List<MyFileVO> getMyRepo(String memberId);
	
	// SSY MEMBER_ID와 FILE_PATH가 같은 FILE_REAL_NAME 가져오기
	public List<MyFileVO> checkMyFile(MyFileVO myFileVO);

    public void subWorkFileDelete(SubWorkVO subWorkVO) throws Exception;

    // SSY FILE_PATH와 FILE_REAL_NAME을 이용해 FILE_UPLOADER 가져오기
	public String getFileUploader(MyFileVO vo);
}
