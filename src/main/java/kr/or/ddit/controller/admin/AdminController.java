package kr.or.ddit.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	//텝화면용 
		@RequestMapping("/adminhome")
		public String adminHome() {
			return "admin/adminhome";
		}
		@RequestMapping("/notice")
		public String adminNoticeHome() {
			return "admin/notice";
		}
		@RequestMapping("/qna")
		public String adminQnAHome() {
			return "admin/Q&A";
		}
		@RequestMapping("/faq")
		public String adminFAQHome() {
			return "admin/FAQ";
		}
		@RequestMapping("/quantity")
		public String adminQuantiHome() {
			return "admin/quantity";
		}
		@RequestMapping("/member")
		public String adminMemberHome() {
			return "admin/member";
		}
		@RequestMapping("/project")
		public String adminProjectHome() {
			return "admin/project";
		}
		
}
