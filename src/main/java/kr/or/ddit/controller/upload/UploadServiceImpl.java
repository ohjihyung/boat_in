package kr.or.ddit.controller.upload;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.common.CommonDao;
import kr.or.ddit.mapper.FileLocationMapper;
import kr.or.ddit.mapper.FileMapper;
import kr.or.ddit.mapper.FileTreeMapper;
import kr.or.ddit.mapper.TopWorkMapper;
import kr.or.ddit.vo.FileLocationVO;
import kr.or.ddit.vo.FileTreeVO;
import kr.or.ddit.vo.FileVO;
import kr.or.ddit.vo.MyFileVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SubWorkVO;
import kr.or.ddit.vo.TopWorkCategoryVO;
import kr.or.ddit.vo.TopWorkVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UploadServiceImpl implements IUploadService{


   @Autowired
   private FileLocationMapper fileLocationMapper;
   @Autowired
   private FileTreeMapper fileTreeMapper;
   @Autowired
   private FileMapper fileMapper;
   @Autowired
   private TopWorkMapper topworkMapper;
   @Inject
   private CommonDao dao;
   /**
    * @param proNo  //프로젝트 고유번호
    *  해당 프로젝트 번호로 realpath / 프로젝트 번호 폴더생성
    *
    */
   @Override
   public void mkProjectDir(ProjectVO projectVO, HttpServletRequest req) {
       String path = req.getSession().getServletContext().getRealPath("resources/upload/");
           File file = new File(path + projectVO.getProNo());
           log.debug("새로 생길 경로 : {}", path+"/"+projectVO.getProNo());
           if(!file.exists()) {
              file.mkdirs();
           }
   }

   @Override
   public void mkCategoryDir(TopWorkCategoryVO topWorkCategoryVO, HttpServletRequest req) {
      log.debug("프로젝트 번호 : {}", topWorkCategoryVO.proNo);
      log.debug("카테고리 이름 : {}", topWorkCategoryVO.twCategoryName);

      String proNo = topWorkCategoryVO.proNo;
      String twCategoryName = topWorkCategoryVO.twCategoryName;
      String path = getFolder(proNo, twCategoryName, req);
      log.debug("새로생긴 경로 : {}", path);
      File file = new File(path);

      if(!file.exists()) {
         file.mkdirs();
      }

   }

   /**
    *  클라이언트에서 프로젝트 번호와 어디서 업로드 했는지 받아와서
    * @return
    */
   private String getFolder(String proNo, String twCategoryName, HttpServletRequest req) {
      String path = req.getSession().getServletContext().getRealPath("resources/upload/");
      String str = proNo +"-"+ twCategoryName;
      return path + str.replace("-", File.separator);
   }


   @Override
   public int insertFileLocation(FileLocationVO fileLocationVO) {

      return fileLocationMapper.insertLocation(fileLocationVO);
   }

   @Override
   public int insertFiles(List<FileVO> list) throws Exception {

      return fileMapper.insertFiles(list);
   }

   @Override
   public int insertFile(FileVO fileVO) throws Exception {

      return fileMapper.insertFile(fileVO);
   }

   @Override
   public List<FileVO> getCategoryFiles(String twCategoryNo) throws Exception {
      // TODO Auto-generated method stub
      return fileMapper.getCategoryFiles(twCategoryNo);
   }

   @Override
   public int changeFilePath(FileVO cfile) throws Exception {
      return fileMapper.changeFilePath(cfile);
   }


   @Override
   public List<FileLocationVO> getfileLocations(String twCategoryNo) {
      // TODO Auto-generated method stub
      return fileLocationMapper.getfileLocations(twCategoryNo);
   }

   @Override
   public int setLocationisDel(int fileLNo) {

      return fileLocationMapper.setLocationisDel(fileLNo);
   }

   @Override
   public int setFileisDel(int fileLNo) {
      // TODO Auto-generated method stub
      return fileMapper.setFileisDel(fileLNo);
   }

   @Override
   public int topworkFileDel(TopWorkVO topwork) {

      //topwork에서 topworkFile 가져옴
      int topWorkFile = topworkMapper.getTopWorkFile(topwork);
      log.debug("topWorkFile : {}",topWorkFile);

      //fileLocation에서도 해당 work 삭제
      int result = fileLocationMapper.setLocationisDel(topWorkFile);
      if(result > 1) {
         log.debug("fileLocation db 삭제");
      }
      //해당 TOPWORKFILE의 파일 상태값을 F로 변경
      return fileMapper.setFileisDel(topWorkFile);
   }

   @Override
   public List<FileVO> getFilePath(TopWorkVO topWorkVO) {
      int topWorkFile = topworkMapper.getTopWorkFile(topWorkVO);
      log.debug("topworkFile : {}",topWorkFile);

      return fileMapper.getFilePath(topWorkFile);
   }

   // SSY 해당 proNo로 그에 해당하는 파일 path 가져오기(getFilePath With ProNo의 줄임말)
	@Override
	public List<FileVO> getFilePathWP(String proNo) {
		return fileMapper.getFilePathWP(proNo);
	}
	
@Override
public int updateFilePath(FileVO fileVO) {

	return fileMapper.updateFilePath(fileVO);
}
    
    //김진호
    @Override
    public List<FileVO> selectFile(TopWorkVO topWorkVO) throws Exception {
        String fileWorkNo = "T," + topWorkVO.getTopWorkNo();
        topWorkVO.setTopWorkNo(fileWorkNo);
        
        return fileMapper.selectFile(topWorkVO);
    }
    
    // SSY proNo로 해당 프로젝트 이름 가져오기
	@Override
	public String getProName(String proNo) {
		return fileMapper.getProName(proNo);
	}

	// SSY 트리 데이터 삽입하기
	@Override
	public int insertRow(FileTreeVO fileTreeVO) {
		return fileMapper.insertRow(fileTreeVO);
	}

	// SSY proNo로 FILE_REAL_NAME 가져오기(프로젝트 자료실)
	@Override
	public List<FileVO> getRealName(Map<String, Object> fileInfoMap) {
		return fileMapper.getRealName(fileInfoMap);
	}
	
	// SSY proNo로 FILE_REAL_NAME 가져오기(내 자료실)
	@Override
	public List<FileVO> getMyRealName(Map<String, Object> fileInfoMap) {
		return fileMapper.getMyRealName(fileInfoMap);
	}
    
    @Override
    public List<FileVO> selectFileSubWork(SubWorkVO subWorkVO) throws Exception {
        String fileWorkNo = "S,"+ subWorkVO.getSubWorkNo();
        subWorkVO.setSubWorkNo(fileWorkNo);
        
        return dao.selectList("selectFileSubWork", subWorkVO);
    }

    @Override
    public List<FileVO> searchFile(Map<String, String> map) throws Exception {
        String comentNo = map.get("key") + "," + map.get("comentNo");
        
        return dao.selectList("searchFile", comentNo);
    }

    @Override
    public List<FileVO> searchComentFile() throws Exception {
        return dao.selectList("searchComentFile");
    }

    @Override
    public void fileDelete(FileVO fileVO) throws Exception {
        dao.update("fileDelete", fileVO);
    }

    @Override
    public List<FileVO> fileListOnlyTopWork(TopWorkVO topWorkVO) throws Exception {
        String fileWorkNo = "T," + topWorkVO.getTopWorkNo();
        topWorkVO.setTopWorkNo(fileWorkNo);
        
        
        return dao.selectList("fileListOnlyTopWork", topWorkVO);
    }

    @Override
    public List<FileVO> fileListOnlySubWork(SubWorkVO subWorkVO) throws Exception {
        String fileWorkNo = "S," + subWorkVO.getSubWorkNo();
        subWorkVO.setSubWorkNo(fileWorkNo);
        
        return dao.selectList("fileListOnlySubWork", subWorkVO);
    }
    
    // SSY MY_FILE 테이블에 내 자료실(담은 파일) 데이터 삽입하기
	@Override
	public int insertMyRepo(MyFileVO myFileVO) {
		return fileMapper.insertMyRepo(myFileVO);
	}

	// SSY MY_FILE 테이블에서 해당 멤버가 담은 파일 가져오기
	@Override
	public List<MyFileVO> getMyRepo(String memberId) {
		return fileMapper.getMyRepo(memberId);
	}

	// SSY MEMBER_ID와 FILE_PATH가 같은 FILE_REAL_NAME 가져오기
	@Override
	public List<MyFileVO> checkMyFile(MyFileVO myFileVO) {
		return fileMapper.checkMyFile(myFileVO);
	}

    @Override
    public void subWorkFileDelete(SubWorkVO subWorkVO) throws Exception {
        String fileWorkNo = "S," + subWorkVO.getSubWorkNo();
        log.debug("파일에서 삭제처리할 fileWorkNo : {}", fileWorkNo);
        subWorkVO.setSubWorkNo(fileWorkNo);
        
        dao.update("subWorkFileDelete", subWorkVO);
    }

    // SSY FILE_PATH와 FILE_REAL_NAME을 이용해 FILE_UPLOADER 가져오기
//	@Override
//	public String getFileUploader(MyFileVO vo) {
//		return fileMapper.getFileUploader(vo);
//	}


}