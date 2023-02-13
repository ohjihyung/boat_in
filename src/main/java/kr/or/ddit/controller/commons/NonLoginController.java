package kr.or.ddit.controller.commons;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NonLoginController {

		@GetMapping("/boatin")
		public String start() {
			return "commons/start";
		}
		
		@GetMapping("/boatinmain")
		public String nonLoginMain() {
			return "commons/main";
		}
}
