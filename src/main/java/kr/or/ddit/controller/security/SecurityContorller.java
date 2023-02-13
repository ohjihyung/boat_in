package kr.or.ddit.controller.security;

import java.io.IOException;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.tribes.tipis.AbstractReplicatedMap.MapOwner;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import kr.common.CommonDao;
import kr.or.ddit.controller.member.service.IMemberService;
import kr.or.ddit.controller.security.service.ISecurityService;
import kr.or.ddit.vo.LetterVO;
import kr.or.ddit.vo.LoginLogVO;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SecurityContorller {
	@Inject
	private IMemberService memberService;
	@Inject
	private ISecurityService service;
	@Inject
	private CommonDao dao;

	@GetMapping("/login")
	public String loginForm() {
		log.debug("로그인 Form::::");

		return "commons/login";
	}

	/**
	 * 로그인 처리 컨트롤러 아이디와 비밀번호가 일치하거나, 아이디와 토큰번호가 일치하다면 로그인처리가 된다. 소셜로그인처리 구상할것 로그인이
	 * 완료되면 내홈으로 간다 . 자동로그인시 로컬에 정보저장 구상 로그인 아이피 기록하기
	 * 
	 * @param memberVO : 로그인 시도한 정보들을 memberVO 객체에 담아 비교한다 . member : DB에서 불러온 회원의
	 *                 정보
	 * @return
	 */
//	@PreAuthorize(value = "hasRole('ROLE_MEMBER')")
	@RequestMapping(value = "/main")
	public String loginConfirm(MemberVO memberVO) throws Exception{
		log.debug("로그인한 회원정보 ::{} " , memberVO);
		
		//로그인한 ip주소 저장
		HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
				.getRequest();
		String ip = req.getHeader("X-FORWARDED-FOR");
		if (ip == null) {
			ip = req.getRemoteAddr();
			//로그기록 생성 및 저장
			LoginLogVO loginLogVO = new LoginLogVO();
			loginLogVO.setLoginIp(ip);
			loginLogVO.setMemberId(memberVO.getMemberId());
			service.loginLog(loginLogVO);
			
		}
		// 0:0:0:0:0:0:0:1 == 127.0.0.1 과 같은정보
		log.debug("로그인시도한 ip 정보  : {} ", ip);
		memberVO.setMemberState("1");
		int res = dao.update("updateState", memberVO);
		log.debug(" 로그인상태값 업데이트 : {} ",res);
		
		return "content/myhome";
	}
	
	//임의 메인페이지 대쉬보드 
	@PreAuthorize(value = "hasRole('ROLE_MEMBER')")
	@GetMapping("/dashboard")
	public String mainPage( MemberVO memberVO, String msg) {
		log.debug("로그인완료 대쉬보드 ---  가져온정보 : {} ",memberVO);
		log.debug(msg);
		return "content/dashboard";
	}
	
	
	
	//로그인체크
	@PostMapping(value = "/login", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> loginCheck(@RequestBody  MemberVO loginInfo ) {
		log.debug(" 일반로그인체크 받은로그인정보  : {} {} ",loginInfo);
		Map<String, Object> map = new HashedMap();
		MemberVO member = memberService.selectOne(loginInfo.getMemberId());
		if (member == null) {
			map.put("msg", "fail");
			return map;
		}
		String loginId = loginInfo.getMemberId();
		String loginPw = loginInfo.getMemberPw();
		String loginToken = loginInfo.getMemberToken();
		String loginName = loginInfo.getMemberName();
		// 로그인 토큰의경우 소셜을 제외하고는 null이기에 null처리
		if (loginToken == null) {
			loginToken = " ";
		}
		log.debug("로그인아이디 : {} , 비밀번호 : {}", loginId, loginPw);
		log.debug("로그인 토큰 : {} 이름 : {} ", loginToken, loginName);
		
		
		//db에 회원정보가 있는지 체크 
		String memberId = member.getMemberId();
		String memberPw = member.getMemberPw();
		String memberToken = member.getMemberToken();
		log.debug("로그인한 아이디의 db에 있는 회원정보:{}  " ,member);
		
		//로그인 성공 로직
		if (loginId.equals(memberId) && loginPw.equals(memberPw)
				|| loginId.equals(memberId) && loginToken.equals(memberToken)) {
			map.put("msg", "success");
			map.put("memberVO", member);
			//로그인 상태여부 업데이트 접속1 비접속 4
		
			return map;
		} else

			map.put("msg", "fail");
		return map;
	}
	
	
	/**
	 * 소셜 로그인 체크 기능 
	 * 일반 로그인과 같이 썻었으나..
	 * token의 환경조건 때문에 따로 로직을 구현..  
	 * @param loginInfo 로그인한 회원정보들 
	 * @return String 성공 실패 최초 로그인시 회원가입 비밀번호 설정
	 */
	@RequestMapping(value = "socaillogincheck", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String socailLoginCheck	(@RequestBody  MemberVO loginInfo ) {
		log.debug(" 로그인정보  : {} {} ",loginInfo);
		
		
		//로그인한 정보들
		String loginId = loginInfo.getMemberId();
		String loginPw = loginInfo.getMemberPw();
		String loginToken = loginInfo.getMemberToken();
		String loginName = loginInfo.getMemberName();

		
		log.debug("로그인정보=== 로그인아이디 : {} , 비밀번호 : {}", loginId, loginPw);
		log.debug("토큰 : {} 이름 : {} ", loginToken, loginName);
		
		//db에 회원정보가 있는지 체크 
		MemberVO member = memberService.selectOne(loginInfo.getMemberId());
		if (member == null) {
			//회원정보가 없으므로 소셜 가입 바로넘어가기 위해 
			return "setPw";
		}
		if (loginId == member.getMemberId()) {
			return "already";
		}
		String memberId = member.getMemberId();
		String memberPw = member.getMemberPw();
		String memberToken = member.getMemberToken();
		log.debug("접속시도 아이디 db 회원 정보:{}  " ,member);
		
		//최초 소셜로그인시 비밀번호가 없음 다시설정 
		if (memberPw == null || memberPw == "") {
			log.debug("소셜로그인 비밀번호 설정 ");
			return "setPw";
		}
		

		
		//로그인 유효성 체크를 위한 널값 초기화
		if (loginPw == null || loginPw == "") {
			loginPw = " ";
		}else if (loginToken == null || loginToken == "") {
			loginToken =" ";
		}
		
		//*****로그인 성공 로직*********
		if (loginId.equals(memberId) && loginPw.equals(memberPw)
				|| loginId.equals(memberId) && loginToken.equals(memberToken)) {
			return "success";
		} 
			
		return "fail";
	}
	
	@PostMapping(value = "/logout" ,produces ="application/json; charset=utf-8" )
	@ResponseBody
	public String memberLogout(@RequestBody MemberVO memberVO) {
			log.debug("로그아웃 : {}",memberVO);
			memberVO.setMemberState("4");
			int res = dao.update("updateState", memberVO);
			log.debug(" 로그인상태값 업데이트 : {} ",res);
		return "OK";
	}
	
	

}
