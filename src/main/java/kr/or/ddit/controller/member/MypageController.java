package kr.or.ddit.controller.member;


import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.eclipse.jdt.internal.compiler.lookup.MemberTypeBinding;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.controller.member.service.IMypageService;
import kr.or.ddit.vo.DevinVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.QnAVO;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Inject
	IMypageService mypageService;
	
	@GetMapping("/home")
	public String StartMypage() {
		
		return "content/mypage";
	}
	
	@GetMapping("/member")
	@ResponseBody
	public MemberVO selectMember( String memberId, Model model) {
//		log.debug("memberId: " + memberId);
		MemberVO selectMember = mypageService.selectMember(memberId);
		
		if(selectMember.getMemberInfo() != null) {
			String memberInfo = selectMember.getMemberInfo();
			memberInfo = memberInfo.replaceAll("\r\n", "<br>");
			selectMember.setMemberInfo(memberInfo);
		}
		
		model.addAttribute("selectMember", selectMember);
		
		return selectMember;
	}
	
	@PostMapping(value ="/profileUpdate", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String updateMember(MemberVO memberVO, HttpServletRequest req) throws Exception {
//		log.debug("memberVO" + memberVO);
		
		MemberVO selectMember = mypageService.selectMember(memberVO.getMemberId());
		
		
		String selectPicRes = selectMember.getMemberPic();
//		log.debug(selectPicRes);
		
		String basicProfile = memberVO.getMemberPic();
//		log.debug(basicProfile);
		
		String updateBasicPic = "0";
		
		//기본이미지로 수정
		if(basicProfile.equals("/resources/dist/assets/images/users/blank_progile.png")) {
			memberVO.setMemberPic(updateBasicPic);
//			log.debug(memberVO.getMemberPic());
		//원래 가지고 있던 이미지로 수정
		}else {
			memberVO.setMemberPic(selectPicRes);
//			log.debug(memberVO.getMemberPic());
		}
		
		//webapp의 관리자
		ServletContext sc = req.getSession().getServletContext();
		//resources는 webapp의 resources에 있는 profileImg폴더 찾아라
		String realPath = sc.getRealPath("/resources/profileImg");
		
		if(memberVO.getProfileImgFile().getSize()  > 0) {
			memberVO.getProfileImgFile().transferTo(new File(realPath + "/" + memberVO.getProfileImgFile().getOriginalFilename()));
			
			//내가 원하는 경로를 써주기 realPath 써주면 내 드라이브값까지 들어가서 안됨!!
			memberVO.setMemberPic("/resources/profileImg" +  "/" + memberVO.getProfileImgFile().getOriginalFilename());
		}
		
		int cnt = mypageService.updateMember(memberVO);
		
		if(cnt > 0) {
			return "OK";
		}else {
			return "NO";
		}
	}
	
	
	@PostMapping(value = "/memberInfoUpdate", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String updateMemberInfo(MemberVO memberVO) {
		
		log.debug("내 소개memberVO" + memberVO);
		
		int cnt = mypageService.updateMemberInfo(memberVO);
		
		if(cnt > 0) {
			return "OK";
		}
		return "NO";
	}
	
	@PostMapping(value = "/timeOfBoatIn", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String updateMemberStateOfTime(String memberId) {
		
		log.debug("memberId:" + memberId);
		
		int cnt = mypageService.updateMemberStateOfTime(memberId);
		
		if(cnt > 0) {
			return "OK";
		}
		return "NO";
	}
	
	@PostMapping(value = "/endTimeOfBoatIn", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String updateMemberStateOfTimeEnd(String memberId) {
		
		log.debug("memberId:" + memberId);
		
		int cnt = mypageService.updateMemberStateOfTimeEnd(memberId);
		
		if(cnt > 0) {
			return "OK";
		}
		return "NO";
	}
	
	@GetMapping(value = "/myProjectName", produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<ProjectVO> selectMyProjetInMypage(String memberId) {
		log.debug("memberId:" + memberId);
		
		List<ProjectVO> selectMyProjectList = mypageService.selectMyProjetInMypage(memberId);
		
		return selectMyProjectList;

	}
	
	@GetMapping(value = "/selectMyQnA", produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<QnAVO> selectMyQnAFromMypage(String memberId) {
		log.debug("memberId:" + memberId);
		
		List<QnAVO> selectMyQnAList= mypageService.selectMyQnAList(memberId);
		
		return selectMyQnAList;
	}
	
	@GetMapping(value = "/selectMyDevInList", produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<DevinVO> selectMyDevInFromMypage(String memberId) {
		log.debug("memberId:" + memberId);
		
		List<DevinVO> selectMyDevInList= mypageService.selectMyDevInList(memberId);
		
		
		
		return selectMyDevInList;
	}
	
	@PostMapping(value = "/deleteMyQna", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String deleteMyQna(String qnaNo) {
//		log.debug(qnaNo);
		
		int cnt = mypageService.deleteMyQna(qnaNo);
		
		if(cnt >0) {
			return "성공";
		}else {
			return "실패";
		}
		
	}
	
	
}
