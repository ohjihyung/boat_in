package kr.or.ddit.controller.upload;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.vo.FileTreeVO;
import kr.or.ddit.vo.FileVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MyFileVO;
import kr.or.ddit.vo.ProjectVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/data")
public class MyDataRoomController {
	
	@Autowired
	IFileTreeService fileTreeService;
	
	@Autowired
	IUploadService uploadService;
	
	
	/**
	 * SSY 내 자료실
	 *     - 내 자료실 홈
	 * @return myDataRoom.jsp
	 */
	@GetMapping("/myDataMain")
	public String myDataList() {
		return "content/myDataRoom";
	}
	
	
	/**
	 * SSY 내 자료실(내 프로젝트)
	 *     - 트리 형태로 출력할 데이터 정제하기
	 * @param proNo
	 * @param fileTreeVO
	 * @return 트리 생성에 필요한 데이터가 담긴 리스트
	 * @throws Exception 
	 */
	@PostMapping(value = "/myProDataRoom", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<FileTreeVO> myProFileTree(@RequestParam("memberId") String memberId, 
																 FileTreeVO fileTreeVO, 
																 FileVO fileVO, 
																 MemberVO memberVO, 
																 ProjectVO projectVO
	) throws Exception {
		
		// MEMBER_ID 가져오깅
		log.debug("memberId : {}", memberId);
		projectVO.setMemberId(memberId);
		
		// MEMBER_NAME 가져와서 MemberVO에 담깅
		String memberName = fileTreeService.getMemberName(memberId);
		log.debug("memberName : {}", memberName);
		memberVO.setMemberName(memberName);
		
		// PROJECT_JOIN_STATE 테이블에서 MEMBER_ID로 PRONO 가져와서 Map에 담깅
		// key = proNo , value = memberId
		List<ProjectVO> proNoList = fileTreeService.getProNo(memberId);
		log.debug("proNoList : {}", proNoList.toString());
		
		// FileTreeVO에 proNo로 가져온 데이터 담아서 myFileTreeList에 한 줄씩 넣깅
		String proNo = "";
		for (ProjectVO p : proNoList) {
			// FileTreeVO에 proNo 하나 뽑아서 담깅
			proNo = p.getProNo();
			log.debug("proNo : {}", proNo);
			fileTreeVO.setProNo(proNo);
			projectVO.setProNo(proNo);
			
			// FILE_TREE 테이블에서 proNo에 해당하는 데이터 삭제하깅
			fileTreeService.delData(proNo);
			
			// proNo로 프로젝트 이름 가져오깅
			String proName = uploadService.getProName(proNo);
			log.debug("proName : {}", proName);
			
			// proNo로 해당하는 데이터 리스트 가져오깅(현재 size = 0)
			List<FileTreeVO> myDataList =  fileTreeService.dataList(proNo);
			log.debug("myDataList - 현재 size = 0 : {}", myDataList.toString());
			
			// 최상위루트 넣어주깅 (삽입 후 size = 1)
			fileTreeVO.setProNo(proNo);
			fileTreeVO.setFileId(proNo);
			fileTreeVO.setParentId("#");
			fileTreeVO.setDepth(0);
			fileTreeVO.setFileName(proName);
			myDataList.add(fileTreeVO);
			uploadService.insertRow(fileTreeVO);
			log.debug("myDataList - 최상위루트 삽입 후 : {}", myDataList.toString());
			
			// FILE_TREE 테이블에 데이터가 있는지 여부 확인
			if(myDataList.size() > 1) { // 있으면
				return new ArrayList<FileTreeVO>(myDataList);
			}else{	// 없으면
				// proNo로 FILE_PATH 가져오깅
				List<FileVO> filePathList = fileTreeService.getMyFilePath(projectVO);
				
				// FILE_PATH에서 카테고리 이름과 상위작업 이름 가져오깅
				int cnt = 0;
				String[] seperator;
				String cateName = "";
				String twName = "";
				for (FileVO f : filePathList) {
					seperator = f.getFilePath().split("\\\\");
					cateName = seperator[1];	// 카테고리 이름
					twName = seperator[2];		// 상위작업 이름
					
					if(cnt == 0) {	// cnt == 0이면 일단 카테고리 하나 넣깅
						// 카테고리 담깅 - fileId, fileName
						fileTreeVO.setParentId(proNo);		// parentId : 프로젝트 넘버
						fileTreeVO.setFileId(cateName);		// fileId : 카테고리 이름
						fileTreeVO.setFileName(cateName);	// fileName : 카테고리 이름
						fileTreeVO.setDepth(1);				// depth : 1로 고정
						fileTreeVO.setProNo(proNo);			// proNo : 프로젝트 넘버
						myDataList.add(fileTreeVO);
						uploadService.insertRow(fileTreeVO);
						log.debug("myDataList - 카테고리명 삽입 후 : {}", myDataList.toString());
						
						// 카테고리명 중복 확인
						// 아래 if 조건문 or proNo랑 depth랑 fileId가 일치하는 거 불러와서 그거랑 비교할까? 일단 쿼리는 만들어 놓음ㅇㅇ
						if(fileTreeVO.getFileId().equals(cateName)) {	// 방금 넣은 fileId랑 cateName이랑 같으면 중복이니까
							// 상위작업 담깅
							fileTreeVO.setParentId(cateName);	// parentId : 카테고리 이름
							fileTreeVO.setFileId(twName);		// fileId : 상위작업 이름
							fileTreeVO.setFileName(twName);		// fileName : 상위작업 이름
							fileTreeVO.setDepth(2);				// depth : 2로 고정
							fileTreeVO.setProNo(proNo);			// proNo : 프로젝트 넘버
							myDataList.add(fileTreeVO);
							uploadService.insertRow(fileTreeVO);
							log.debug("myDataList - 상위작업명 삽입 후 : {}", myDataList.toString());
							cnt++;
							continue;
						}
						cnt++;
						
					}else {	// cnt == 0이 아닐 때 (최소 2회차)
						// 카테고리명 중복 확인
						if(!fileTreeVO.getParentId().equals(cateName)) {	// 카테고리명 중복 아닐 때 카테고리명 넣어주깅
							fileTreeVO.setParentId(proNo);		// parentId : 프로젝트 넘버
							fileTreeVO.setFileId(cateName);		// fileId : 카테고리 이름
							fileTreeVO.setFileName(cateName);	// fileName : 카테고리 이름
							fileTreeVO.setDepth(1);				// depth : 1로 고정
							fileTreeVO.setProNo(proNo);			// proNo : 프로젝트 넘버
							myDataList.add(fileTreeVO);
							uploadService.insertRow(fileTreeVO);
							log.debug("myDataList - 카테고리명 삽입 후 : {}", myDataList.toString());
							
							// 카테고리명 중복 확인
							// 아래 if 조건문 or proNo랑 depth랑 fileId가 일치하는 거 불러와서 그거랑 비교할까? 일단 쿼리는 만들어 놓음ㅇㅇ
							if(fileTreeVO.getFileId().equals(cateName)) {	// 방금 넣은 fileId랑 cateName이랑 같으면 중복이니까
								// 상위작업 담깅
								fileTreeVO.setParentId(cateName);	// parentId : 카테고리 이름
								fileTreeVO.setFileId(twName);		// fileId : 상위작업 이름
								fileTreeVO.setFileName(twName);		// fileName : 상위작업 이름
								fileTreeVO.setDepth(2);				// depth : 2로 고정
								fileTreeVO.setProNo(proNo);			// proNo : 프로젝트 넘버
								myDataList.add(fileTreeVO);
								uploadService.insertRow(fileTreeVO);
								log.debug("myDataList - 상위작업명 삽입 후 : {}", myDataList.toString());
								continue;
							}
						}else{	// 카테고리명 중복일 때는 상위작업명 넣어주깅
							// 상위작업명 중복 확인
							if(fileTreeVO.getFileId().equals(twName)) {	// 방금 넣은 fildId랑 twName이랑 같으면 중복이니까~
								continue;
							}else {	// 방금 넣은 fileId랑 twName이랑 다르면 중복이 아니니까~~
								// 상위작업 담깅
								fileTreeVO.setParentId(cateName);	// parentId : 카테고리 이름
								fileTreeVO.setFileId(twName);		// fileId : 상위작업 이름
								fileTreeVO.setFileName(twName);		// fileName : 상위작업 이름
								fileTreeVO.setDepth(2);				// depth : 2로 고정
								fileTreeVO.setProNo(proNo);			// proNo : 프로젝트 넘버
								myDataList.add(fileTreeVO);
								uploadService.insertRow(fileTreeVO);
								log.debug("myDataList - 상위작업명 삽입 후 : {}", myDataList.toString());
							}
							continue;
						}
					}
				}	// end of fore f
			}

		}	// end of fore key
		// FILE_TREE테이블에서 proNo에 해당하는 최종 데이터를 리스트로 가져오기
		List<FileTreeVO> myfinalDataList = fileTreeService.myFinalDataList(memberId);
		log.debug("myfinalDataList : {}", myfinalDataList.toString());

		return new ArrayList<FileTreeVO>(myfinalDataList);
	}
	
	
	/**
	 * SSY 내 자료실(내 프로젝트)
	 *     - 파일트리에서 선택한 노드(프로젝트)의 파일 원본명 가져오기
	 * @param fileName
	 * @param depth
	 * @param parentId
	 * @param proNo
	 * @return 파일 정보가 담긴 리스트
	 * @throws Exception
	 */
	@PostMapping(value = "/myProGallary", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public ArrayList<FileVO> myProGallary(@RequestParam("name") String fileName,
									  	  @RequestParam("depth") int depth,
									  	  @RequestParam("parentId") String parentId,
									  	  @RequestParam("proNo") String proNo
	) throws Exception {
		
		Map<String, Object> fileInfoMap = new HashMap<String, Object>();
		fileInfoMap.put("fileName", fileName);
		fileInfoMap.put("depth", depth);
		fileInfoMap.put("parentId", parentId);
		fileInfoMap.put("proNo", proNo);
		log.debug("fileInfoMap : {}", fileInfoMap.toString());
		
		List<FileVO> list = uploadService.getMyRealName(fileInfoMap);
		log.debug("getRealName_list : {}", list.toString());
		
		String[] seperator1;
		String[] seperator2;
		String realName = "";
		String sliced = "";		// 확장자
		int index;
		String cateName = "";	// 카테고리명
		String twName = "";		// 상위작업명
//		String isImage = "";	// 사진 여부
//		String defaultIcon = "\\resources\\src\\images\\defaultFileImage\\defaultIcon.png";
		List<FileVO> fileInfoList = new ArrayList<FileVO>();
		
		for (FileVO f : list) {
			// FILE_REAL_NAME에서 확장자 지우기
			String path = f.getFilePath();
	//		f.setFilePath("\\resources\\upload\\" + path);
			f.setFilePath(path);
			log.debug("filePath : {}", f.getFilePath());
			log.debug("getFileRealName : {}", f.getFileRealName());
			realName = f.getFileRealName();
			seperator1 = f.getFileRealName().split("\\.");
			log.debug("seperator1 : {}", seperator1.length);
			index  = seperator1.length;
			log.debug("index : {}", index);
			sliced = seperator1[index-1];
			f.setSliced(sliced);
			log.debug("sliced : {}", sliced);
			log.debug("realName : {}", realName);
			f.setFileName(realName);
			
			// FILE_WORK_NO의 T/S로 구분하면 좋겠지만 아직 잘 모르겠으니까
			// FILE_UUID = 카테고리명, FILE_SIZE = 상위작업명    ==>이렇게 넣어서 쓰기~
			seperator2 = f.getFilePath().split("\\\\");
//			cateName = seperator2[4];	// 카테고리명
	//		twName = seperator2[5];	// 상위작업명
			cateName = seperator2[1];	// 카테고리명
			twName = seperator2[2];	// 상위작업명
			f.setUuid(cateName);
			f.setFileSize(twName);
			log.debug("UUID_cateName : {}", f.getUuid());
			log.debug("fileSize_twName : {}", f.getFileSize());
			
			// 파일들 경로 처리
			// FILE_PATH = 원본파일 경로
			// 사진인 경우
//			String path = f.getFilePath();
//			f.setFileSize("\\resources\\upload\\" + path);	// img태그
//			f.setFilePath("\\resources\\upload\\" + path);		// a태그
//			log.debug("fileSize_img태그 : {}", f.getFileSize());
//			log.debug("path_a태그 : {}", f.getFilePath());
//
//			// 사진이 아닌 경우!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ---> 확장자별로 아이콘 분류
//			isImage = f.getImage();
//			if(isImage.equals("false")) {
//				// 디폴트 이미지 출력하기
//				f.setFileSize(defaultIcon);					// img태그
//				// 다운로드용 원본 파일 경로 넣기
//				f.setFilePath("\\resources\\upload\\" + path);	// a태그
//			}
			log.debug("f : {}", f.toString());
			fileInfoList.add(f);
			
		}
		log.debug("fileInfoList {}", fileInfoList.toString());
		
		return new ArrayList<FileVO>(fileInfoList);
	}
	
	
	

	/**
	 * SSY 파일 보관하기
	 * @param data
	 * @param req
	 * @return 성공 메시지
	 * @throws IOException 
	 */
	@PostMapping(value="/putMyRepo", produces="application/json;charset=UTF-8" )
	@ResponseBody
	public String putMyRepo(@RequestBody Map<String, String> data, HttpServletRequest req, MyFileVO myFileVO) throws IOException {
	
	   log.debug("data!!!!!!!!!!!!! : ", data.toString());
	   String myId =  data.get("myId").toString(); 	 		 // a
	   String downPath = data.get("downPath").toString();    // b
	   String fileName = data.get("fileName").toString();	 // c
	   log.debug("*************downPath : ", downPath);
	   MyFileVO vo = new MyFileVO();
	   vo.setFilePath(downPath);
	   vo.setFileRealName(fileName);
//	   String fileUploader = uploadService.getFileUploader(vo);
	   
	   log.debug("myId : {}", myId);
	   log.debug("downPath : {}", downPath);
	   log.debug("fileName : {}", fileName);
//	   log.debug("fileUploader : {}", fileUploader);
	   
//	   String finalDownPath = downPath.substring(17);
//	   log.debug("finalDownPath : {}", finalDownPath);
	
       String path = req.getSession().getServletContext().getRealPath("resources/upload/");
       log.debug("path : {}", path);
       File originalFile = new File(path + downPath);
       File newFile = new File(path + myId + "\\" + fileName);
       log.debug("originalFile : {}", originalFile);
       log.debug("newFile : {}", newFile);
       String finalMyPath = path + myId + "\\" + fileName;
       
       // 이미지 여부 확인
       String isImage = "";
       if(!checkImageType(originalFile)) {	// 이미지가 아니면
    	   isImage = "false";
       }else {	// 이미지가 맞으면
    	   isImage = "true";
       }
        
       // 이미지 복사하기
       FileUtils.copyFile(originalFile, newFile);
       
       // MyFileVO에 담기
       myFileVO.setMemberId(myId);
       myFileVO.setFilePath(finalMyPath);
       myFileVO.setFileRealName(fileName);
       myFileVO.setIsImage(isImage);
//       myFileVO.setFileUploader(fileUploader);
       
       // 중복 파일이 없는 경우에만 MY_FILE 테이블에 데이터 넣기
       List<MyFileVO> check = uploadService.checkMyFile(myFileVO);
       
       if(check.size() == 0) {
    	   uploadService.insertMyRepo(myFileVO);
       }
       
       return "내 폴더 업로드 성공~";
	}
	
	
	/**
	 * OJH 이미지 여부 확인하기
	 * @param file
	 * @return true/false
	 */
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");	//	이미지가 맞으면 true 반환
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;	// 이미지가 아니면 false 반환
	}
	
	
	/**
	 * SSY 내 자료실(내 보관함)
	 *     - 내가 담은 파일들의 원본명 가져오기
	 * @param memberId
	 * @param myFileVO
	 * @return 파일 정보가 담긴 리스트
	 */
	@PostMapping(value = "/myRepoGallary", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<MyFileVO> myRepoGallary(@RequestParam("memberId") String memberId, MyFileVO myFileVO) {
		log.debug("myRepoGallary - memberId : {}", memberId);
		List<MyFileVO> list = uploadService.getMyRepo(memberId);
		log.debug("myRepoGallary - list : {}", list);
		List<MyFileVO> finalList = new ArrayList<MyFileVO>();

		String defaultIcon = "\\resources\\src\\images\\defaultFileImage\\defaultIcon.png";
		
		for (MyFileVO f : list) {
			MyFileVO vo = new MyFileVO();
			
			String filePath = f.getFilePath().substring(f.getFilePath().indexOf("\\resources"));
			String fileRealName = f.getFileRealName();
			String isImage = f.getIsImage();
//			String fileUploader = f.getFileUploader();
			
			vo.setFilePath(filePath);
			vo.setMemberId(memberId);
			vo.setFileRealName(fileRealName);
//			vo.setFileUploader(fileUploader);
			if(isImage == "false") {
				vo.setFilePath(defaultIcon);
			}
			
			finalList.add(vo);
		}
		log.debug("finalList : {}", finalList);
		
		return new ArrayList<MyFileVO>(finalList);
	}
	
}
