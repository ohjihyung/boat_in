package kr.or.ddit.controller.project;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import kr.or.ddit.controller.project.service.IProjectNoticeService;
import kr.or.ddit.controller.upload.IFileTreeService;
import kr.or.ddit.controller.upload.IUploadService;
import kr.or.ddit.vo.DevinComentVO;
import kr.or.ddit.vo.DevinVO;
import kr.or.ddit.vo.FileLocationVO;
import kr.or.ddit.vo.FileVO;
import kr.or.ddit.vo.ProjectNoticeVO;
import kr.or.ddit.vo.TopWorkVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/projectNotice")
public class ProjectNoticeController {
	
	@Inject
	private IProjectNoticeService service;
	
	@Autowired
	IFileTreeService fileTreeService;
	@Autowired
	IUploadService uploadservice;
	
	/**
	 * 채진영
	 * 여기가 getMapping 이니까 url에서 proNo를 가져올 수 있는 것임! @RequestParam으로~
	 * @param proNo
	 * @return 해당 프로젝트의 전체 게시물 List 가져오기
	 * @throws Exception
	 */
	@GetMapping(value = "/projectNoticeList", produces = "application/json; chartset=utf-8")
	@ResponseBody
	public List<ProjectNoticeVO> projectNoticeList(@RequestParam(name = "proNo", required = false) String proNo) throws Exception {
		log.debug("proNo :::::{} " , proNo);
		
//		String selectProjectManagerId = service.selectProjectManagerId(proNo);
//		log.debug("selectProjectManagerId: {}",selectProjectManagerId);
		
		
		
		List<ProjectNoticeVO> projectNoticeList = service.selectList(proNo);
//		projectNoticeList.add(e)
		log.debug("projectNoticeList(리스트뿌려주기):proNo가지고가니?: {} ", projectNoticeList);
		
		return projectNoticeList;
	
	}
	
	/**
	 * @param globalProNo
	 * @return 해당 공지사항을 쓸수있는 프로젝트 관리자의 id
	 */
	@PostMapping(value = "/selectProjectManagerId", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String selectProjectManagerId(@RequestParam(name="proNo", required = false) String globalProNo) {
		log.debug("/selectProjectManagerId 공지사항에 쓸 프로젝트의 proNo ::: {} " , globalProNo);
		String selectProjectManagerId = service.selectProjectManagerId(globalProNo);
		log.debug("selectProjectManagerId ::: {} ", selectProjectManagerId);
		
		return selectProjectManagerId;
	}
	
	/**
	 * 채진영
	 * @param projectNoticeVO
	 * @return 조회할 공지사항 게시글 번호 1개
	 * @throws Exception
	 */
	@PostMapping(value = "/select", produces = "application/json; charset=utf-8")
	@ResponseBody
	public ProjectNoticeVO ProjectNoticeSelect(@RequestBody ProjectNoticeVO projectNoticeVO) throws Exception {
	    log.debug("받은 객체(조회할 게시글 번호 1개) : {}"+ projectNoticeVO);
		
	    ProjectNoticeVO vo = service.select(projectNoticeVO.getProNoticeNo());
	    log.debug("그 게시글 한줄 받아온것 ProjectNoticeVO : {}"+ vo);
	    
	    return vo;
	    
	    
	}
	
	/**
	 * shift+alt+j 하면 주석 고고링
	 * 채진영 
	 * @param projectNoticeVO
	 * @return 인서트 성공 1 "OK"=>"그번호 가지고 디테일!" , 실패 0 "NG"=> "null"
	 * @throws Exception
	 */
	@PostMapping(value = "/insert", produces = "application/json; charset=utf-8")
	@ResponseBody
	public ProjectNoticeVO ProjectNoticeInsert(@RequestParam("sendData") String data, MultipartFile noticeFile, HttpServletRequest req) throws Exception  {
		// formData_C 에는 현재 파일과 그외 글의 내용이 담겨있음... 그걸 sendData라는 걸로 보냈음
		
//		System.out.println(noticeVO.toString());
		
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(data);
		String memberId =  element.getAsJsonObject().get("memberId").getAsString();
		String proNo =  element.getAsJsonObject().get("proNo").getAsString();
		String proNoticeTitle =  element.getAsJsonObject().get("proNoticeTitle").getAsString();
		String proNoticeContent =  element.getAsJsonObject().get("proNoticeContent").getAsString();
		// 파일은 어떻게 처리해야하는가?
		
		// 진짜 파일이 생기는 경로를 찾아서 만들어주기
		String path = req.getSession().getServletContext().getRealPath("resources/upload");
		log.debug("채진영 path : " + path);
		log.debug("파일 있냐? noticeFile : pp"+ noticeFile +"pp");
		
		//경로에 proNo추가하고 공지사항도 추가하고!
		File fileJ = new File(path, makeFolder(proNo, "공지사항"));
		
		// 폴더 없으면 만들어줘라
		if(!fileJ.exists()) {
			fileJ.mkdirs();
		}
		
		
		ProjectNoticeVO noticeVO = new ProjectNoticeVO();
		noticeVO.setMemberId(memberId);
		noticeVO.setProNoticeTitle(proNoticeTitle);
		noticeVO.setProNoticeContent(proNoticeContent);
		noticeVO.setProNo(proNo);
		
		if(noticeFile != null) {
			
			noticeVO.setProNoticeFile(noticeFile.getOriginalFilename());
			log.debug("noticeVO>>>>>>>>>>>>>>>>>>>>>",noticeVO);
			
			
			service.insert(noticeVO); // 인서트해야지 이것저것 내용들
			
			// 프로젝트공지사항넘버 들어가야함 폴더로 다시 만들어
			File afterFile = new File(fileJ.getPath() + "/" + noticeVO.getProNoticeNo());
			if(!afterFile.exists()) {
				afterFile.mkdirs();
			}
			String proNoticeNoNo = noticeVO.getProNoticeNo();
			String proNoticeFileName= noticeFile.getOriginalFilename();
			
			
			String realpath = "\\resources\\upload\\" + proNo + "\\공지사항\\" + proNoticeNoNo +"\\"+ proNoticeFileName ;
			System.out.println("!!!!!!!!!!realpathrealpathrealpathrealpathrealpathrealpath:::: "+ realpath);
			
			noticeVO.setProNoticePath(realpath); // 이건 진짜경로를 그냥 넣어본다 찾아보기
			service.updateRealPath(noticeVO); // 진짜경로.....
			
			// 진짜 이름 파일 저장하기
			File readFile = new File(afterFile, noticeFile.getOriginalFilename());
			noticeFile.transferTo(readFile);
			log.debug("readFile>>>>>>>>>>>>>>>>>>>>>",readFile);
			
			// 파일경로 담을 빈 리스트
			List<ProjectNoticeVO> filePathList = new ArrayList<ProjectNoticeVO>();	 	// 파일경로 담을 빈 리스트 원래 여러개였다가...하나했으니까..
		}else {
			
			noticeVO.setProNoticeFile("");
			service.insert(noticeVO); 
		}
		
		
		// 내가 만든 공지사항 폴더에서 파일 객체를 내가 만든 경로에 넣는 작업
//		for (MultipartFile multipartFile : uploadFile) {
//			try {
//				File saveFile = new File(fileJ, multipartFile.getOriginalFilename());
//				multipartFile.transferTo(saveFile); // 진짜 경로에다가 파일 넣은것 
//				//그 후에 여기서 insert처리
//				ProjectNoticeVO vo = new ProjectNoticeVO();
//				vo.setProNoticeFile(saveFile.getPath());
//				//newvo.setProNoticeFile(saveFile.getPath());
//				//service.insert(projectNoticeVO)
//				log.debug("파일경로 : {}", saveFile.getAbsolutePath());
//				log.debug("파일경로 : {}", saveFile.getPath());
//			} catch (Exception e) {
//				log.error(e.getMessage());
//			}
//			
//		}
		
//		log.debug("===========================");
//		log.debug("memberId : {}", memberId);
//		log.debug("proNo : {}", proNo);
//		log.debug("proNoticeTitle : {}", proNoticeTitle);
//		log.debug("proNoticeContent : {}", proNoticeContent);
//		log.debug("===========================");
	
		// 여기서 각각 꺼내서 인서트 해줘야함! 여기서 그 파일의 경로를 저장해주자
		// 여기서 폼데이타의 사진도 경로를 진짜를 해서 넣어주기
		
		/*
		 * log.debug("projectNoticeVO 인서트할거 모음: {}"+projectNoticeVO);
		 * 
		 * int cnt=service.insert(projectNoticeVO); log.debug("인서트한 cnt :"+cnt);
		 * log.debug("ProNoticeNo(공지사항번호) :"+projectNoticeVO.getProNoticeNo());
		 * 
		 * if(cnt > 0) { ProjectNoticeVO vo =
		 * service.select(projectNoticeVO.getProNoticeNo());
		 * log.debug("ProjectNoticeVO: {}" + vo); return vo; } return null;
		 */
			
		return noticeVO;
	}
	
	/**
	 * shift+alt+j 하면 주석 고고링
	 * 채진영 
	 * @param vo
	 * @return 업데이트 성공 1 "OK"=>"그번호 가지고 디테일!" , 실패 0 "NG"=> "null"
	 * @throws Exception
	 */
	@PostMapping(value = "/update", produces = "application/json; charset=utf-8")
	@ResponseBody
	public ProjectNoticeVO ProjectNoticeUpdate(@RequestParam("sendData") String data, MultipartFile noticeFile, HttpServletRequest req) throws Exception	{

		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(data);
		String memberId =  element.getAsJsonObject().get("memberId").getAsString();
		String proNo =  element.getAsJsonObject().get("proNo").getAsString();
		String proNoticeNo =  element.getAsJsonObject().get("proNoticeNo").getAsString();
		String proNoticeTitle =  element.getAsJsonObject().get("proNoticeTitle").getAsString();
		String proNoticeContent =  element.getAsJsonObject().get("proNoticeContent").getAsString();
		// 파일은 어떻게 처리해야하는가?
		
		// 진짜 파일이 생기는 경로를 찾아서 만들어주기
		String path = req.getSession().getServletContext().getRealPath("resources/upload");
		log.debug("채진영 path : " + path);
		log.debug("파일 있냐? noticeFile : pp"+ noticeFile +"pp");
		
		//경로에 proNo추가하고 공지사항도 추가하고!
		File fileJ = new File(path, makeFolder(proNo, "공지사항"));
		
		// 폴더 없으면 만들어줘라
		if(!fileJ.exists()) {
			fileJ.mkdirs();
		}
		
		
		ProjectNoticeVO noticeVO = new ProjectNoticeVO();
		noticeVO.setMemberId(memberId);
		noticeVO.setProNoticeTitle(proNoticeTitle);
		noticeVO.setProNoticeContent(proNoticeContent);
		noticeVO.setProNo(proNo);
		noticeVO.setProNoticeNo(proNoticeNo);
		
		if(noticeFile != null) {
			
			noticeVO.setProNoticeFile(noticeFile.getOriginalFilename());
			log.debug("noticeVO>>>>>>>>>>>>>>>>>>>>>",noticeVO);
			
			
			service.update(noticeVO); // 업데이트 해야지 이것저것 내용들
			
			// 프로젝트공지사항넘버 들어가야함 폴더로 다시 만들어
			File afterFile = new File(fileJ.getPath() + "/" + noticeVO.getProNoticeNo());
			if(!afterFile.exists()) {
				afterFile.mkdirs();
			}
			String proNoticeNoNo = noticeVO.getProNoticeNo();
			String proNoticeFileName= noticeFile.getOriginalFilename();
			
			
			String realpath = "\\resources\\upload\\" + proNo + "\\공지사항\\" + proNoticeNoNo +"\\"+ proNoticeFileName ;
			System.out.println("!!!!!!!!!!realpathrealpathrealpathrealpathrealpathrealpath:::: "+ realpath);
			
			noticeVO.setProNoticePath(realpath); // 이건 진짜경로를 그냥 넣어본다 찾아보기
			service.updateRealPath(noticeVO); // 진짜경로.....
			
			// 진짜 이름 파일 저장하기
			File readFile = new File(afterFile, noticeFile.getOriginalFilename());
			noticeFile.transferTo(readFile);
			log.debug("readFile>>>>>>>>>>>>>>>>>>>>>",readFile);
			
			// 파일경로 담을 빈 리스트
			List<ProjectNoticeVO> filePathList = new ArrayList<ProjectNoticeVO>();	 	// 파일경로 담을 빈 리스트 원래 여러개였다가...하나했으니까..
		}else {
			
			noticeVO.setProNoticeFile("");
			service.update(noticeVO); 
		}
		
		return noticeVO;
		
//		log.debug("projectNoticeVO 업데이트용: {}", projectNoticeVO);
//		
//		int cnt=service.update(projectNoticeVO);
//		log.debug("업데이트한 cnt :"+cnt);
//		log.debug("업데이트용 ProNoticeNo(공지사항번호):"+projectNoticeVO.getProNoticeNo());
//
//		if(cnt > 0) {
//			ProjectNoticeVO vo = service.select(projectNoticeVO.getProNoticeNo());
//			log.debug("ProjectNoticeVO 업데이트용 내용 전체 devInVO: {}", vo);
//			return vo;
//		}
//		
//		return null;
	}
	
	/**
	 * 채진영
	 * @param vo
	 * @return 프로젝트공지사항 삭제
	 */
	@PostMapping(value = "/delete", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String ProjectNoticeDelete(@RequestBody ProjectNoticeVO projectNoticeVO) throws Exception {
		log.debug("삭제할 객체 : {}", projectNoticeVO);
		service.delete(projectNoticeVO);
		
		return "삭제 성공";
	}
	
	/**
	 * 채진영
	 * 여기가 getMapping 이니까 url에서 proNo를 가져올 수 있는 것임! @RequestParam으로~
	 * @param proNo
	 * @return 해당 프로젝트의 참여가 1인 멤버 List 가져오기
	 * @throws Exception
	 */
	@PostMapping(value = "/selectJoinMemberList", produces = "application/json; chartset=utf-8")
	@ResponseBody
	public List<ProjectNoticeVO> selectJoinMemberList(@RequestParam(name = "proNo", required = false) String proNo) throws Exception {
		log.debug("proNo ::: {} " , proNo);
		List<ProjectNoticeVO> selectJoinMemberList = service.selectJoinMemberList(proNo);
		log.debug("selectJoinMemberList ::: {} ", selectJoinMemberList);
		
		return selectJoinMemberList;
	
	}
	
	// 파일하는거 채진영용 따로 파기..하나
	// 파일업로드시 진짜 폴더에 저장하는 메서드
//	@PostMapping(value = "/uploadAjaxAction", produces = "application/json; charset=UTF8")
//	@ResponseBody
//	public String uploadAjaxPost(HttpServletRequest req, ProjectNoticeVO projectNoticeVO, MultipartFile[] uploadFile) throws Exception {
//		log.debug("채진영projectNoticeVO(가져오는 파일 및 내용 전체?) ::: {} " , projectNoticeVO);
//	
//		// 진짜 파일이 생기는 경로를 찾아서 만들어주기
//		String path = req.getSession().getServletContext().getRealPath("resources/upload");
//		log.debug("채진영 path : " + path);
//		File fileJ = new File(path, makeFolder(projectNoticeVO.getProNo(), "공지사항")); // 이름 만들어주는 방법 경로
//		
//		if(!fileJ.exists()) {
//			fileJ.mkdirs();
//		}
//		
//		
//		 // 파일경로 담을 빈 리스트
//		List<ProjectNoticeVO> filePathList = new ArrayList<ProjectNoticeVO>();	 	// 파일경로 담을 빈 리스트
//		
//		// 내가 만든 공지사항 폴더에서 파일 객체를 내가 만든 경로에 넣는 작업
//		for (MultipartFile multipartFile : uploadFile) {
//			try {
//				File saveFile = new File(fileJ, multipartFile.getOriginalFilename());
//				multipartFile.transferTo(saveFile); // 진짜 경로에다가 파일 넣은것 
//				//그 후에 여기서 insert처리
//				ProjectNoticeVO vo = new ProjectNoticeVO();
//				vo.setProNoticeFile(saveFile.getPath());
//				//newvo.setProNoticeFile(saveFile.getPath());
//				//service.insert(projectNoticeVO)
//				log.debug("파일경로 : {}", saveFile.getAbsolutePath());
//				log.debug("파일경로 : {}", saveFile.getPath());
//			} catch (Exception e) {
//				log.error(e.getMessage());
//			}
//			
//		}
//		
//		return ""; 	// 클라이언트 쪽에서 사용하기 위해서 Path리턴!
//	}
	
	// 프로젝트 id와 카테고리를 받아와서 폴더 형태 / 로 만들어주는 메소드
		private String makeFolder(String a, String b) {
			String str = a + "-" + b;
			return str.replace("-", File.separator);
		}
	
}
