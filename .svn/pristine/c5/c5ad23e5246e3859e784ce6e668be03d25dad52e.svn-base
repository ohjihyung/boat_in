package kr.or.ddit.controller.admin;

import java.util.AbstractSequentialList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.common.CommonDao;
import kr.or.ddit.controller.admin.service.IAdminService;
import kr.or.ddit.vo.AdminQuantiVO;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/adminquanti")
@Slf4j
public class AdminQuantiController {
	
	@Inject
	CommonDao dao ;
	
	@PostMapping("/adminemailcnt")
	@ResponseBody
	public List<AdminQuantiVO> adminEmailCnt() throws Exception {
		log.debug("adminEmailCnt 들어옴 ");
		List<AdminQuantiVO> list =  dao.selectList("adminEmailCnt");
		log.debug("adminEmailCnt 반환값  list  : {} ", list);
		return list;
	}
	
	@PostMapping("/adminmemregdate")
	@ResponseBody
	public List<AdminQuantiVO> adminMemRegdate() throws Exception {
		log.debug("adminMemRegdate 들어옴 ");
		List<AdminQuantiVO> list =  dao.selectList("adminMemRegdate");
		log.debug("adminMemRegdate 반환값  list  : {} ", list);
		return list;
	}
	@PostMapping("/adminprotype")
	@ResponseBody
	public List<AdminQuantiVO> adminProtype() throws Exception {
		log.debug("adminProtype 들어옴 ");
		List<AdminQuantiVO> list =  dao.selectList("adminProtype");
		log.debug("adminProtype 반환값  list  : {} ", list);
		return list;
	}
	@PostMapping("/adminprotopworkcnt")
	@ResponseBody
	public List<AdminQuantiVO> adminProTopworkCnt() throws Exception {
		log.debug("adminProTopworkCnt 들어옴 ");
		List<AdminQuantiVO> list =  dao.selectList("adminProTopworkCnt");
		log.debug("adminProTopworkCnt 반환값  list  : {} ", list);
		return list;
	}
	
	@PostMapping("/adminfiletypecnt")
	@ResponseBody
	public List<AdminQuantiVO> adminFileTypeCnt() throws Exception {
		log.debug("adminFileTypeCnt 들어옴 ");
		List<AdminQuantiVO> list =  dao.selectList("adminFileTypeCnt");
		log.debug("adminFileTypeCnt 반환값  list  : {} ", list);
		return list;
	}
	
	@PostMapping("/adminfilesize")
	@ResponseBody
	public List<AdminQuantiVO> adminFileSize() throws Exception {
		log.debug("adminFileSize 들어옴 ");
		List<AdminQuantiVO> list =  dao.selectList("adminFileSize");
		log.debug("adminFileSize 반환값  list  : {} ", list);
		return list;
	}
	
	@PostMapping("/adminproperiod")
	@ResponseBody
	public List<AdminQuantiVO> adminProPeriod() throws Exception {
		log.debug("adminProPeriod 들어옴 ");
		List<AdminQuantiVO> list =  dao.selectList("adminProPeriod");
		log.debug("adminProPeriod 반환값  list  : {} ", list);
		return list;
	}
	
	@PostMapping("/adminproavgmem")
	@ResponseBody
	public List<AdminQuantiVO> adminProAvgMem() throws Exception {
		log.debug("adminProAvgMem 들어옴 ");
		List<AdminQuantiVO> list =  dao.selectList("adminProAvgMem");
		log.debug("adminProAvgMem 반환값  list  : {} ", list);
		return list;
	}
	@PostMapping("/adminwidgetcnt")
	@ResponseBody
	public List<AdminQuantiVO> adminWidgetCnt() throws Exception {
		log.debug("adminWidgetCnt 들어옴 ");
		List<AdminQuantiVO> list =  dao.selectList("adminWidgetCnt");
		log.debug("adminWidgetCnt 반환값  list  : {} ", list);
		return list;
	}
	@PostMapping("/adminqnacnt")
	@ResponseBody
	public List<AdminQuantiVO> adminQnaCnt() throws Exception {
		log.debug("adminQnaCnt 들어옴 ");
		List<AdminQuantiVO> list =  dao.selectList("adminQnaCnt");
		log.debug("adminQnaCnt 반환값  list  : {} ", list);
		return list;
	}
	@PostMapping("/adminnologin")
	@ResponseBody
	public List<AdminQuantiVO> adminNologin() throws Exception {
		log.debug("adminNologin 들어옴 ");
		List<AdminQuantiVO> list =  dao.selectList("adminNologin");
		log.debug("adminNologin 반환값  list  : {} ", list);
		return list;
	}
	
}
