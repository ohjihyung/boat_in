
package kr.or.ddit.controller.upload;

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import kr.or.ddit.controller.topwork.service.ITopWorkService;
import kr.or.ddit.vo.FileLocationVO;
import kr.or.ddit.vo.FileTreeVO;
import kr.or.ddit.vo.FileVO;
import kr.or.ddit.vo.SubWorkVO;
import kr.or.ddit.vo.TopWorkVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UploadController {

	@Autowired
	IFileTreeService fileTreeService;
	@Autowired
	IUploadService uploadservice;
	@Autowired
	ITopWorkService topworkservice;

	@PostMapping(value = "/topworkUpdate_O", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String topworkUpdate_O(@RequestBody Map<String, String> data, HttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("resources/upload/");
//	   log.debug("topworkUpdate 잘들어왔음");
//	   log.debug("상위작업 no : {}",data.get("topWorkNo"));
//	   log.debug("바뀐 topwork 타이틀 : {}", data.get("topWorkTitle")); // 이걸로 상위작업이름 수정해야됨 ,db
//	   log.debug("바뀐 카테고리 넘버 : {}",data.get("twCategoryNo")); // 이걸로 카테고리 경로 바꿔줘야함
		String topWorkNo = data.get("topWorkNo");
		String beforeTopWorkTitle = data.get("beforeTopWorkTitle");
		String afterTopWorkTitle = data.get("topWorkTitle");
		String categoryNo = data.get("twCategoryNo");
		String twCategoryName = topworkservice.getCategoryName(categoryNo);

		log.debug("topWorkNo: {}", topWorkNo);
		log.debug("beforeTopWorkTitle : {}", beforeTopWorkTitle);
		log.debug("afterTopWorkTitle : {}", afterTopWorkTitle);
		log.debug("categoryNo : {}", categoryNo);
		log.debug("twCategoryName : {}", twCategoryName);
		log.debug("=============================================================");
		TopWorkVO topWorkVO = new TopWorkVO();
		topWorkVO.setTopWorkNo(topWorkNo);
		List<FileVO> files = uploadservice.getFilePath(topWorkVO);

		if(files.size() == 0) {
			return "안에 파일 없음~";
		}
		int cnt = 0;
		String beforeCName = "";
		String projectName = "";
		String topWorkName = "";
		for (FileVO f : files) {
			log.debug("해당 파일 이전 경로 : {}", f.getFilePath()); // 81\b\b1\6d14c35b-1922-417a-9b59-58083e332718_소극장 메모.txt
			String[] fileSeperate = f.getFilePath().split("\\\\");
			String afterPath = f.getFilePath().replace(fileSeperate[1], twCategoryName);
			afterPath = afterPath.replace(fileSeperate[2], afterTopWorkTitle);
			f.setFilePath(afterPath);
			log.debug("해당 파일 이후 경로 : {}", f.getFilePath());
			log.debug("파일 file_Name : {}", f.getFileName());

			// 여기서 업데이트 해주기
			int updateFilePath = uploadservice.updateFilePath(f);

			if (cnt == 0) {
				projectName = fileSeperate[0];
				beforeCName = fileSeperate[1];
				topWorkName = fileSeperate[2];
			}
			cnt++;
		}
		if(files.size() == 0) {
			return "안에 파일 없음~";
		}
		log.debug("프로젝트 이름 : {}", projectName);
		log.debug("카테고리 이전 이름 : {} ", beforeCName);
		log.debug("카테고리 이후 이름 : {} ", twCategoryName);
		log.debug("상위작업이름 : {}", topWorkName);
		File from = new File(path + projectName + "\\" + beforeCName + "\\" + topWorkName); // resources/upload/100/test1/1234
		File to = new File(path + projectName + "\\" + twCategoryName + "\\" + afterTopWorkTitle); // resources/upload/100/test2/1234
		try {
			if (!from.getPath().equals(to.getPath())) {
			    if (beforeCName != "" || beforeCName != null) {
			        FileUtils.moveDirectory(from, to);
			    }
			 }
			} catch (Exception e) {
			e.printStackTrace();
		}
		// 이전 경로 : 100/test1/진짜마지막테스트1/ 파일명.png
		// 바꿔줘야할 경로: 100/test2/진짜마지막테스트2/ 파일명

		return "수정중";
	}
	/**
	 * * SSY 프로젝트 자료실
	 *    - 트리 형태로 출력할 데이터 정제하기
	 * @param proNo
	 * @param fileTreeVO
	 * @return 트리 생성에 필요한 데이터가 담긴 리스트
	 * @throws Exception
	 */
	@PostMapping(value = "/filetree", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<FileTreeVO> fileTree(@RequestParam("projectNo") String proNo, FileTreeVO fileTreeVO) throws Exception {

		int cnt = 0;
		int i = 0;

		// dataRoom.jsp에서 proNo 받아오기
//		log.debug("UploadController-filetree-ProNo : {}", proNo);

		// FILE_TREE 테이블에서 proNo에 해당하는 데이터 삭제하기
		fileTreeService.delData(proNo);

		// FILE_TREE테이블에서 proNo에 해당하는 데이터를 리스트로 가져오기
		List<FileTreeVO> fileTreeList = fileTreeService.dataList(proNo);

		// 프로젝트 이름 가져오기
		String proName = uploadservice.getProName(proNo);
//		log.debug("프로젝트 이름 : {}", proName);
		// 여기에 최상위루트 만들기
		// proNo   fileId   parentId  depth  file_name
		//  102     102         #       0    프로젝트명
		fileTreeVO.setProNo(proNo);
		fileTreeVO.setFileId(proNo);
		fileTreeVO.setParentId("#");
		fileTreeVO.setDepth(0);
		fileTreeVO.setFileName(proName);
		fileTreeList.add(fileTreeVO);

		// 최상위루트 데이터 삽입
		uploadservice.insertRow(fileTreeVO);

//		log.debug("최상위 루트 생성? : {}", fileTreeVO.toString());
//		log.debug("fileTreeList - toString : {}", fileTreeList.toString());

		// 트리데이터가 있는지 여부 확인
		if(fileTreeList.size() > 1) {	// 있으면
//			log.debug("fileTreeList.size() > 1");
			return new ArrayList<FileTreeVO>(fileTreeList);
		}else { // 없으면
			// filePath들 가져오기(isDeleted : F)
			List<FileVO> filePath = uploadservice.getFilePathWP(proNo);

//			log.debug("fileTreeList.size() <= 1");
			String[] cateName = new String[100];
			String[] seperator;
			String sep1 = "";
			String sep2 = "";

			// 배열을 LinkedHashSet으로 변환
			LinkedHashSet<String> linkedHashSet = new LinkedHashSet<>(Arrays.asList(cateName));

			// LinkedHashSet을 배열로 변환
			String[] rsltCateName = linkedHashSet.toArray(new String[filePath.size()]);

			String firstCategoryName = "";

			for(FileVO f : filePath) { 	  // filePath =  102/상위작업/파일

//				log.debug("파일 경로 전체 : {}", filePath.toString());
//				log.debug("파일 경로 : {}", filePath.get(i).toString());

				seperator = f.getFilePath().split("\\\\");

		        // 중복이 제거된 배열 출력
//		        log.debug("카테고리명 배열 - length : {}", rsltCateName.length);
//		        log.debug("카테고리명 배열 - 배열 현황 : {}", Arrays.toString(rsltCateName));

		        sep1 = seperator[1];  // 카테고리1
		        sep2 = seperator[2];  // 상위작업1

		        if(rsltCateName[i] == null) {	// 배열의 i번째가 null이라면
		        	rsltCateName[i] = sep1;
		        }else {
		        	if(!rsltCateName[i].equals(sep1)) { // 배열의 i번째와 sep1이 같지 않다면
		        		rsltCateName[++i] = sep1;
		        	}
		        }

//		       log.debug("파일 경로 : {}", filePath.get(i).toString());

		       if(cnt == 0) {	// cnt가 0일 경우 --> 카테고리명 설정 (첫 카테고리명 설정)
		    	   firstCategoryName = sep1;
		    	   fileTreeVO.setParentId(proNo);	// 최상위루트의 fileId와 일치해야 함
		    	   fileTreeVO.setFileId(sep1);		// 그냥 카테고리 이름으로 하자
		    	   fileTreeVO.setDepth(1);			// 카테고리 계층 : 1로 고정
		    	   fileTreeVO.setFileName(sep1);	// 카테고리 이름
//		    	   log.debug("카테고리명 설정 후 : {}", fileTreeList.toString());
		    	   uploadservice.insertRow(fileTreeVO);
		    	   cnt++;

//		    	   log.debug("seperator[1] : {}", seperator[1].toString());
					if(sep1 == seperator[1]) {	// 카테고리명 중복이면 --> 상위작업명 설정
						fileTreeVO.setParentId(fileTreeVO.getFileId());	// 카테고리의 fileId와 일치해야 함
						fileTreeVO.setFileId(sep2);						// 그냥 상위작업 이름으로 하자
						fileTreeVO.setDepth(2);							// 상위작업 계층 : 2로 고정
						fileTreeVO.setFileName(sep2);					// 상위작업 이름
//						log.debug("상위작업명 설정 후 : {}", fileTreeList.get(0).getFileId());
						uploadservice.insertRow(fileTreeVO);
					}

		       }else {	// cnt가 0이 아닐 경우 카테고리명 설정
//		    	   log.debug("firstCategoryName : {}", firstCategoryName);
		    	   if(!firstCategoryName.equals(sep1)) {	// 첫 번째로 삽입한 카테고리명과 중복이 아니라면 --> 카테고리명 설정
		    		   fileTreeVO.setParentId(proNo);		// 최상위루트의 fileId와 일치해야 함
			    	   fileTreeVO.setFileId(sep1);			// 그냥 카테고리 이름으로 하자
			    	   fileTreeVO.setDepth(1);				// 카테고리 계층 : 1로 고정
			    	   fileTreeVO.setFileName(sep1);		// 카테고리 이름
//			    	   log.debug("카테고리명 설정 후 : {}", fileTreeList.toString());
			    	   uploadservice.insertRow(fileTreeVO);
		    		}
		       }
//		       log.debug("seperator[1] : {}", seperator[1].toString());
//		       log.debug("seperator[2] : {}", seperator[2].toString());

		       String curFileName = fileTreeVO.getFileName();
//		       log.debug("curFileName : {}", curFileName);

		       if(sep1 == seperator[1] & sep2 != curFileName) {	// 카테고리명이 같고 상위작업명이 다를 때 --> 상위작업명 설정
		    		   fileTreeVO.setParentId(sep1);	// 카테고리의 fileId와 일치해야 함
		    		   fileTreeVO.setFileId(sep2);		// 그냥 상위작업 이름으로 하자
		    		   fileTreeVO.setDepth(2);			// 상위작업 계층 : 2로 고정
		    		   fileTreeVO.setFileName(sep2);	// 상위작업 이름
//		    		   log.debug("상위작업명 설정 후 : {}", fileTreeList.get(0).getFileId());
		    		   uploadservice.insertRow(fileTreeVO);
		       }
		       continue;	// 카테고리명 중복이면 위로 올라가랏
			} // end of fore
		} // end of else

		// FILE_TREE테이블에서 proNo에 해당하는 최종 데이터를 리스트로 가져오기
		List<FileTreeVO> finalDataList = fileTreeService.finalDataList(proNo);

//		log.debug("파일리스트 체크 - 최종 : {}", finalDataList.toString());
		return new ArrayList<FileTreeVO>(finalDataList);
	}

	/**
	 * SSY 프로젝트 자료실
	 *    - 파일트리에서 선택한 노드(상위작업)의 파일 원본명 가져오기
	 * @param fileName
	 * @param depth
	 * @param parentId
	 * @param proNo
	 * @return 파일 정보가 담긴 리스트
	 * @throws Exception
	 */
	@PostMapping(value = "/gallary", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<FileVO> gallary(
						@RequestParam("name") String fileName,
						@RequestParam("depth") int depth,
						@RequestParam("parentId") String parentId,
						@RequestParam("proNo") String proNo
	) throws Exception	{

		Map<String, Object> fileInfoMap = new HashMap<String, Object>();
		fileInfoMap.put("fileName", fileName);
		fileInfoMap.put("depth", depth);
		fileInfoMap.put("parentId", parentId);
		fileInfoMap.put("proNo", proNo);
		log.debug("fileInfoMap : {}", fileInfoMap.toString());

		List<FileVO> list = uploadservice.getRealName(fileInfoMap);
		log.debug("getRealName_list : {}", list.toString());

		String[] seperator;
		String realName = "";
		String sliced = "";
		int index;
		String isImage = "";
		String defaultIcon = "\\resources\\src\\images\\defaultFileImage\\defaultIcon.png";
		List<FileVO> fileInfoList = new ArrayList<FileVO>();

		for (FileVO f : list) {
			// FILE_REAL_NAME에서 확장자 지우기
			log.debug("getFileRealName : {}", f.getFileRealName());
			realName = f.getFileRealName();
			seperator = f.getFileRealName().split("\\.");
			log.debug("seperator : {}", seperator.length);
			index = seperator.length;
			log.debug("index : {}", index);
			sliced = seperator[index-1];
			log.debug("sliced : {}", sliced);
			log.debug("realName : {}", realName);
			f.setFileName(realName);

			// 파일들 경로 처리
			// 사진인 경우
			String path = f.getFilePath();
			log.debug("그냥 path : {}", path);
			f.setFileUploader("\\resources\\upload\\" + path);	// a태그
			f.setFilePath("\\resources\\upload\\" + path);		// img태그
			log.debug("path : {}", f.getFilePath());

			// 사진이 아닌 경우
			isImage = f.getImage();
			if(isImage.equals("false")) {
				// 디폴트이미지 출력하기
				f.setFileUploader(defaultIcon);					// img태그
				// 다운로드용 원본 파일 경로 넣기
				f.setFilePath("\\resources\\upload\\" + path);	// a태그
			}
			log.debug("f : {}", f.toString());
			fileInfoList.add(f);

		}
		log.debug("fileInfoList : {}", fileInfoList.toString());

		return new ArrayList<FileVO>(fileInfoList);
	}


	@PostMapping(value = "/topWorkMovedUpdate", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String topWorkMovedUpdate(@RequestBody Map<String, String> data, HttpServletRequest req) throws Exception {

		log.debug("topWorkNo : {}", data.get("topWorkNo")); // 310
		log.debug("이동전 카테고리 : {}", data.get("beforeTwCategoryNo")); // 94
		log.debug("이동후 카테고리 : {}", data.get("twCategoryNo")); // 93


		String topWorkNo = data.get("topWorkNo");
		String beforeTwCategory = data.get("beforeTwCategoryNo");
		String movedCategory = data.get("twCategoryNo");
		TopWorkVO topWorkVO = new TopWorkVO();
		topWorkVO.setTopWorkNo(topWorkNo);

		// 카테고리 이름 가져오는 거
		String beforetwCategoryName = topworkservice.getCategoryName(beforeTwCategory);
		log.debug("바뀌기전  카테고리 이름 : {}", beforetwCategoryName);
		String twCategoryName = topworkservice.getCategoryName(movedCategory);
		log.debug("바뀐 카테고리 이름 : {}", twCategoryName);
		String proNo = topworkservice.getProNobyTopWork(topWorkNo);
		log.debug("proNo : " + proNo);
		String topworkName = topworkservice.getTopWorkTitle(topWorkNo);


		// 2.DB 파일경로 바꿔주기
		// resources/upload/projectId/카테고리/
		// 탑워크넘버로 topworkfile 값을 가져와 해당 file_l_no의 값의 경로를 뽑아온다
		// 뽑아온 것들을 list<fileVO>로 담아 각각
		String path = req.getSession().getServletContext().getRealPath("resources/upload/");
		List<FileVO> files = new ArrayList<FileVO>();
		// 해당 상위작업 no를 가지고 그에 해당하는 파일들 목록 가져오기
		files = uploadservice.getFilePath(topWorkVO);

		//안에 파일이 없을 때
		if(files.size() == 0) {
			return "안에 파일 없음~";
		}

		int cnt = 0;
		String beforeCName = "";
		String projectName = "";
		String topWorkName = "";
		for (FileVO f : files) {
			log.debug("해당 파일 이전 경로 : {}", f.getFilePath()); // 81\b\b1\6d14c35b-1922-417a-9b59-58083e332718_소극장 메모.txt
			String[] fileSeperate = f.getFilePath().split("\\\\");
			// log.debug("프로젝트 이름 : {}",fileSeperate[0]); // 81
			// log.debug("카테고리 이름 : {}", fileSeperate[1]); // b
			String afterPath = f.getFilePath().replace(fileSeperate[1], twCategoryName);
			// log.debug("바뀐 경로 이름 : {}", afterPath);
			f.setFilePath(afterPath);
			// log.debug("해당 파일 이후 경로 : {}", f.getFilePath());
			// log.debug("파일 file_Name : {}",f.getFileName());

			// 여기서 업데이트 해주기
			int updateFilePath = uploadservice.updateFilePath(f);

			if (cnt == 0) {
				projectName = fileSeperate[0];
				beforeCName = fileSeperate[1];
				topWorkName = fileSeperate[2];
			}
			cnt++;
		}

		log.debug("프로젝트 이름 : {}", projectName);
		log.debug("카테고리 이전 이름 : {} A" + beforeCName + "A");
		log.debug("카테고리 이후 이름 : {} ", twCategoryName);
		File from = new File(path + projectName + "\\" + beforeCName + "\\" + topWorkName); // resources/upload/100/test1/1234
		File to = new File(path + projectName + "\\" + twCategoryName + "\\" + topWorkName); // resources/upload/100/test2/1234
		try {
			if (!from.getPath().equals(to.getPath())) {

			    if (beforeCName != "") {
			        FileUtils.moveDirectory(from, to);
			    }
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "수정완료~OJH";
	}

	@PostMapping(value = "/topWorkDelFile", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String topWorkDelFile(String topWorkNo) {
		log.debug("topworkNo : {}", topWorkNo);
		TopWorkVO topwork = new TopWorkVO();
		topwork.setTopWorkNo(topWorkNo);
		// topwork에 걍 넣어서 file_l_no 찾아서 f로 변경
		int result = uploadservice.topworkFileDel(topwork);

		return "해당 상위작업 파일들 삭제 상태 T로 바꿈";
	}

	@PostMapping(value = "/deleteCategoryFile", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String deleteCategoryFile(String twCategoryNo) {
		log.debug("twCategoryNo : {}", twCategoryNo);

		// 해당 카테고리 관련된 모든 폴더 파일 다 삭제 상태로 바꿔줘야함
		// 1. fileLocationVO에서 file_l_no 가져오기
		List<FileLocationVO> locations = uploadservice.getfileLocations(twCategoryNo);
		for (FileLocationVO f : locations) {
			log.debug("file_l_no : {}", f.getFileLNo());
			// 각각 가져온 file_l_no로 file_location 상태 false로 변경
			uploadservice.setLocationisDel(f.getFileLNo());
			// 2. 해당 카테고리의 상위작업들 파일 상태 false로 바꿔줌
			uploadservice.setFileisDel(f.getFileLNo());
		}
		return "왔다감";
	}

	// 카테고리 수정시 진짜 폴더이름도 수정하는 메서드
	@PostMapping(value = "/updateCategoryFileLocation", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public ResponseEntity<String> updateCategoryFileLocation(String beforeCategory, String updateCategory, String proNo,
			String twCategoryNo, HttpServletRequest req) throws Exception {
		log.debug("이전 카테고리 이름 : {}", beforeCategory); // 이전 카테고리 이름
		log.debug("바뀐 카테고리 이름 : {}", updateCategory); // 바뀐 카테고리 이름
		log.debug("프로젝트 이름 : {}", proNo); // 프로젝트 이름
		log.debug("카테고리 번호 : {} ", twCategoryNo); // 카테고리 번호
		log.debug("카테고리 번호 타입 : {}", twCategoryNo.getClass().getTypeName());
		// 해당 카테고리에 있는 모든 파일 자료들 가져오기
		List<FileVO> categoryFiles = uploadservice.getCategoryFiles(twCategoryNo);
		for (FileVO file : categoryFiles) {
			log.debug("파일 경로 : {}", file.getFilePath());
			String changedFilePath = file.getFilePath().replaceFirst(beforeCategory, updateCategory);
			log.debug("파일 바뀐 경로 : {}", changedFilePath);
			FileVO cfile = new FileVO();
			cfile.setFilePath(changedFilePath);
			cfile.setFileName(file.getFileName());

			// 바꾼 정보 db 수정
			uploadservice.changeFilePath(cfile);

		}

		String path = req.getSession().getServletContext().getRealPath("resources/upload/");

		String beforeFileLocation = getFolder(proNo, beforeCategory); // 프로젝트명/이전 카테고리
		String afterFileLocation = getFolder(proNo, updateCategory); // 프로젝트명/ 바뀐 카테고리

		File file = new File(path + beforeFileLocation);
		File newFile = new File(path + afterFileLocation);
		log.debug("이전경로 : {}", file.getPath());
		log.debug("새로운 경로 : {}", newFile.getPath());

		boolean result = file.renameTo(newFile);
		log.debug("result");

		return new ResponseEntity<String>("폴더이름수정!", HttpStatus.OK);
	}

	// 파일업로드시 진짜 폴더에 저장하는 메서드
	@PostMapping(value = "/uploadAjaxAction", produces = "application/json; charset=UTF8")
	@ResponseBody
	public ResponseEntity<List<FileVO>> uploadAjaxPost(MultipartFile[] uploadFile,
			@RequestParam("jsonData") String data, HttpServletRequest req) throws Exception {

		String path = req.getSession().getServletContext().getRealPath("resources/upload");
		log.debug("path : " + path);
		List<FileVO> list = new ArrayList<FileVO>();

		log.debug("data : {} ", data);
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(data);

		String projectId = element.getAsJsonObject().get("projectId").getAsString(); // 프로젝트명
		String pathLocation = element.getAsJsonObject().get("categoryName").getAsString(); // 카테고리
		String pathUnderLocation = element.getAsJsonObject().get("topWorkTitle").getAsString(); // 상위작업 //topWorkTitle
		String topWorkNo = element.getAsJsonObject().get("topWorkNo").getAsString(); // 해당 작업 topWorkNo
		String fileLocation = element.getAsJsonObject().get("mode").getAsString(); // top인지 sub인지
		String uploader = element.getAsJsonObject().get("uploader").getAsString(); // 업로더
		
		String uploadFolderPath = getFolder(projectId, pathLocation);
		log.debug("===========================");
		log.debug("mode(fileLocation) : {}", fileLocation);
		log.debug("===========================");

		//이거를 FILE테이블의 FILE_COMENT_NO로 해야함. T, 넘버 / S, 넘버 이런식으로
		String fileComentNo = "0";
		//이거를 FILE테이블의 FILE_WORK_NO로 해야함. T, 넘버 / S, 넘버 이런식으로
		String fileWorkNo = "0";

		if (fileLocation.equals("TopWork")) {
		    fileWorkNo = "T," + topWorkNo;
		    log.debug("상위에서 왓따 - 상위작업번호 : {}", fileWorkNo);
		}

		if (fileLocation.equals("SubWork")) {
		    fileWorkNo = "S," + element.getAsJsonObject().get("subWorkNo").getAsString();
		    log.debug("하위에서 왓따 - 하위작업번호 : {}", fileWorkNo);
		}

		if (fileLocation.equals("TopWorkComent")) {
		    fileComentNo = "T," + element.getAsJsonObject().get("comentNo").getAsString();
		    fileWorkNo = "T," + topWorkNo;
		    log.debug("상위작업댓글 : {}", fileComentNo);
		}

		if (fileLocation.equals("SubWorkComent")) {
		    fileComentNo = "S," + element.getAsJsonObject().get("comentNo").getAsString();
		    fileWorkNo = "S," + element.getAsJsonObject().get("subWorkNo").getAsString();
		    log.debug("하위작업댓글 : {}", fileComentNo);
		    //이거를 FILE테이블의 FILE_COMENT로 해야함. T, 넘버 / S, 넘버 이런식으로
		}


		// 검색해서 topWorkFile이 0이면 로케이션 생성, 아니면 생성x
		TopWorkVO searchTopWorkVO = new TopWorkVO();
		searchTopWorkVO.setTopWorkNo(topWorkNo);
		TopWorkVO resultTopWorkVO = topworkservice.select(searchTopWorkVO);
		String topWorkFileNo = resultTopWorkVO.getTopWorkFile();

		log.debug("탑워크 검색 결과 : {}", resultTopWorkVO);

		int fileNo = 0;

		if (topWorkFileNo.equals("0")) {
		    // 작업에 한번도 파일이 추가가 안된 경우.(로케이션 번호가 없음)
		    // 새로운 fileLocationVO를 생성해줘야함
		    // 일단 FileLocation 집어넣자
		    FileLocationVO fileLocationVO = new FileLocationVO();
		    fileLocationVO.setFileLocation(fileLocation);

		    uploadservice.insertFileLocation(fileLocationVO);

		    fileNo = fileLocationVO.getFileLNo();

		    // 등록한 시퀀스 가져오기
		    log.debug("fileNo : {}", fileNo);
		    // 해당 생성된 상위작업에 첨부위치번호 넣어주기 topwork <-> fileLocation
		    Map<String, String> uploadData = new HashMap<String, String>();
		    uploadData.put("topWorkNo", topWorkNo);
		    uploadData.put("fileNo", String.valueOf(fileNo));
		    log.debug("파일번호 등록할 놈 : {}", uploadData);
		    topworkservice.updateTopworkFile(uploadData); // 첨부 위치번호 연결 성공

		} else {
		    //작업에 파일이 추가된 적 있는 경우 (이미 로케이션 번호가 있음.)
		    fileNo = Integer.parseInt(topWorkFileNo);
		}


		log.debug("프로젝트 번호 : {}", projectId);
		log.debug("프로젝트 작업 목록 : {}", pathLocation);
		File uploadPathunder = new File(path, getFolder(uploadFolderPath, pathUnderLocation));
		log.debug("uploadPath :{}", uploadPathunder); // 받아온 데이터로 폴더를 생성

		if (!uploadPathunder.exists()) {
			uploadPathunder.mkdirs();
		}
		for (MultipartFile multipartFile : uploadFile) {

			FileVO fileVO = new FileVO();
			fileVO.setFileUploader(uploader);

			// UUID 로 파일 중복 방지
			String uploadFileName = multipartFile.getOriginalFilename();
			fileVO.setFileRealName(uploadFileName); // 진짜 이름 설정

			String uploadFileSize = String.valueOf(multipartFile.getSize());
			fileVO.setFileSize(uploadFileSize); // 파일 사이즈 설정

			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);

			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName; // 2lkwake9fdslafk;la_남성이미지.png
			fileVO.setFileName(uploadFileName);

			try {
				File saveFile = new File(uploadPathunder, uploadFileName);
				multipartFile.transferTo(saveFile);
				fileVO.setUuid(uuid.toString()); // 12dsakj12jkldsakldd21
				fileVO.setFilePath(uploadFolderPath + "\\" + pathUnderLocation + "\\" + uploadFileName);

				fileVO.setFileLNo(fileNo);
				if (checkImageType(saveFile)) {
					fileVO.setImage("true");
//               // 썸내일 만드는 것
//               FileOutputStream thumbnail = new FileOutputStream(new File(uploadPathunder, "s_"+uploadFileName));
//               Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 50, 50);
//               thumbnail.close();
				} else {
					fileVO.setImage("false");
				}
				log.debug(fileVO.toString());

				//김진호 - 코멘트에서 달린 파일인지 구분가능 (아니면 0, 맞으면 PK)
				fileVO.setFileComentNo(fileComentNo);
				fileVO.setFileWorkNo(fileWorkNo);

				uploadservice.insertFile(fileVO);
				list.add(fileVO);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}

		// 리스트에 다 담으면 해당 파일 넣기
		// int uploadCnt = uploadservice.insertFiles(list);

		log.debug("보내는 리스트 출력 : {}", list.toString());
		return new ResponseEntity<List<FileVO>>(list, HttpStatus.OK);
	}

	// 프로젝트 id와 카테고리를 받아와서 폴더 형태 / 로 만들어주는 메소드
	private String getFolder(String projectId, String pathLocation) {
		String str = projectId + "-" + pathLocation;
		return str.replace("-", File.separator);
	}

	// 파일인지 이미지인지 구별해주는 메서드
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			log.debug("contentType : {}", contentType);
			return contentType.startsWith("image");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 김진호
	 *
	 * @param topWorkVO
	 * @return 조회할 게시물의 첨부파일 목록
	 * @throws Exception
	 */
	@PostMapping(value = "/selectFile", produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<FileVO> selectFile(@RequestBody TopWorkVO topWorkVO) throws Exception {
	    log.debug("셀렉트파일이 에러야? {}", topWorkVO);
		List<FileVO> fileList = uploadservice.selectFile(topWorkVO);

		return fileList;
	}

    @PostMapping(value = "/selectFileSubWork", produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<FileVO> selectFileSubWork(@RequestBody SubWorkVO subWorkVO) throws Exception {
	    log.debug("서브워크 셀렉 파일 : {}", subWorkVO);
	    List<FileVO> selectFileList = uploadservice.selectFileSubWork(subWorkVO);

	    return selectFileList;
	}

    @PostMapping(value = "/searchFile", produces = "application/json; charset=utf-8")
    @ResponseBody
    public List<FileVO> searchFile(@RequestBody Map<String, String> map) throws Exception {
        log.debug("키 : {}, 값 : {}", map.get("key"), map.get("comentNo"));


        List<FileVO> fileList =  uploadservice.searchFile(map);

        return fileList;
    }

    /**
     * @return FILE_COMENT_NO 가 0이 아닌 모든 리스트
     * @throws Exception
     */
    @PostMapping(value = "/searchComentFile", produces = "application/json; charset=utf-8")
    @ResponseBody
    public List<FileVO> searchComentFile() throws Exception {
        List<FileVO> fileList =  uploadservice.searchComentFile();

        return fileList;
    }

    /**
     * 김진호
     * 파일 삭제(상태값 업데이트)
     * @param fileVO
     * @throws Exception
     */
    @PostMapping(value = "/fileDelete", produces = "application/json; charset=utf-8")
    @ResponseBody
    public String fileDelete(@RequestBody FileVO fileVO) throws Exception {
        log.debug("삭제할 파일 : {}", fileVO);
        uploadservice.fileDelete(fileVO);

        return "삭제 성공";
    }

    @PostMapping(value = "/fileListOnlyTopWork", produces = "application/json; charset=utf-8")
    @ResponseBody
    public List<FileVO> fileListOnlyTopWork(@RequestBody TopWorkVO topWorkVO) throws Exception {
        log.debug("파일 검색할 작업 : {}", topWorkVO);
        List<FileVO> list = uploadservice.fileListOnlyTopWork(topWorkVO);

        return list;
    }

    @PostMapping(value = "/fileListOnlySubWork", produces = "application/json; charset=utf-8")
    @ResponseBody
    public List<FileVO> fileListOnlySubWork(@RequestBody SubWorkVO subWorkVO) throws Exception {
        log.debug("파일 검색할 작업 : {}", subWorkVO);
        List<FileVO> list = uploadservice.fileListOnlySubWork(subWorkVO);

        return list;
    }

    @PostMapping(value = "/subWorkFileDelete", produces = "text/plain; charset=utf-8")
    @ResponseBody
    public String subWorkFileDelete(@RequestBody SubWorkVO subWorkVO) throws Exception {
        log.debug("파일 삭제처리할 subWorkNo : {}", subWorkVO.getSubWorkNo());
        uploadservice.subWorkFileDelete(subWorkVO);

        return "하위작업 파일 삭제 성공";
    }

    //허나훔 쪽지 파일업로드

	// 파일업로드시 진짜 폴더에 저장하는 메서드
	@PostMapping(value = "/uploadletterfile", produces = "application/json; charset=UTF8")
	@ResponseBody
	public ResponseEntity<List<FileVO>> uploadLetterFile(MultipartFile[] uploadFile,
			@RequestParam("jsonData") String data, HttpServletRequest req) throws Exception {
		log.debug("파일업로드들어옴 : {} ", uploadFile );
		log.debug("파일업로드들어옴 : {} ", req );
		String path = req.getSession().getServletContext().getRealPath("resources/upload");
		log.debug("path : " + path);
		List<FileVO> list = new ArrayList<FileVO>();

		log.debug("data : {} ", data);
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(data);

		String letterSender = element.getAsJsonObject().get("letterSender").getAsString(); // 프로젝트명
		String memberId = element.getAsJsonObject().get("memberId").getAsString(); // 카테고리
		String pathUnderLocation = element.getAsJsonObject().get("letterTitle").getAsString(); // 상위작업 //topWorkTitle
		String letterContent = element.getAsJsonObject().get("letterContent").getAsString(); // 해당 작업 topWorkNo
		String fileLocation = element.getAsJsonObject().get("mode").getAsString(); // top인지 sub인지
		String uploadFolderPath = getFolder(letterSender, memberId);
		log.debug("===========================");
		log.debug("mode(fileLocation) : {}", fileLocation);
		log.debug("===========================");



		int fileNo=0;

		File uploadPathunder = new File(path, getFolder(uploadFolderPath, pathUnderLocation));
		log.debug("uploadPath :{}", uploadPathunder); // 받아온 데이터로 폴더를 생성

		if (!uploadPathunder.exists()) {
			uploadPathunder.mkdirs();
		}
		for (MultipartFile multipartFile : uploadFile) {

			FileVO fileVO = new FileVO();

			// UUID 로 파일 중복 방지
			String uploadFileName = multipartFile.getOriginalFilename();
			fileVO.setFileRealName(uploadFileName); // 진짜 이름 설정

			String uploadFileSize = String.valueOf(multipartFile.getSize());
			fileVO.setFileSize(uploadFileSize); // 파일 사이즈 설정

			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);

			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName; // 2lkwake9fdslafk;la_남성이미지.png
			fileVO.setFileName(uploadFileName);

			try {
				File saveFile = new File(uploadPathunder, uploadFileName);
				multipartFile.transferTo(saveFile);

				fileVO.setUuid(uuid.toString()); // 12dsakj12jkldsakldd21
				fileVO.setFilePath(uploadFolderPath + "\\" + pathUnderLocation + "\\" + uploadFileName);

				fileVO.setFileLNo(fileNo);
				if (checkImageType(saveFile)) {
					fileVO.setImage("true");
//               // 썸내일 만드는 것
//               FileOutputStream thumbnail = new FileOutputStream(new File(uploadPathunder, "s_"+uploadFileName));
//               Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 50, 50);
//               thumbnail.close();
				} else {
					fileVO.setImage("false");
				}
				log.debug(fileVO.toString());

				//김진호 - 코멘트에서 달린 파일인지 구분가능 (아니면 0, 맞으면 PK)
//				fileVO.setFileComentNo(fileComentNo);

				uploadservice.insertFile(fileVO);
				list.add(fileVO);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}

		// 리스트에 다 담으면 해당 파일 넣기
		// int uploadCnt = uploadservice.insertFiles(list);

		log.debug("보내는 리스트 출력 : {}", list.toString());
		return new ResponseEntity<List<FileVO>>(list, HttpStatus.OK);
	}



}