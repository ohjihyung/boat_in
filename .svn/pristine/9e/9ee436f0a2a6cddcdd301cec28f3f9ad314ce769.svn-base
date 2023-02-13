package kr.or.ddit.controller.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import lombok.extern.slf4j.Slf4j;

//AccessDeniedHandler: 스프링 시큐리티에서 주어지는 인터페이스(접근 거부 처리자)
// 사용자 정의 접근 거부 처리자
@Slf4j
public class CustomAccessDeniedHandler  implements AccessDeniedHandler {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		log.info("handle");
		
		
		response.sendRedirect("/accessError");
		
		
	}

}
