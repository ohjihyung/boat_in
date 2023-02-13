package kr.or.ddit.controller.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import lombok.extern.slf4j.Slf4j;

//
//	
/**
 * 인증 (로그인) 전에 접근을 시도한 URL로 리다이렉트(URL재요청) 하는 기능을 가지고 있음
 * 
 * 스프링  시큐리티에서 기본적으로 사용되는 구현 클래스
 * @author 김진호
 *
 */
@Slf4j
public class CustomLoginSuccessHandler extends 
	SavedRequestAwareAuthenticationSuccessHandler{
	
	//매서드 재정의
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws ServletException, IOException {
		log.warn("onAuthenticationSuccess");
		//로그인 성공 ( 아이디, 비밀번호, 권한정보)
		// 로그인을 시큐리티에서 관리를해줌 
		//이제부터 로그인 관련된 정보 / 엑션들은 스프링 시큐리티에서 관리하게됨.
		User customUser =  (User) auth.getPrincipal();
		super.onAuthenticationSuccess(request, response, auth);
	}
}
