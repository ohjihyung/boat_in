package kr.or.ddit.controller.security;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class CommonController {

	
	// <security:access-denied-handler error-page="/accessError" />
	// RequestMapping은 속성이 하나면 속성명을 생략가능. val
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth , Model model) {
		log.info("accessDenied !! : " + auth );
		model.addAttribute("msg", "Access Denined");

		// void 면은 return "accessError" 와 같음 
		// /WEB-INF/views/accessError.jsp
	}
}
