package kr.or.ddit.controller.project;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.controller.project.service.IGdocsService;
import kr.or.ddit.controller.project.service.IProjectService;
import kr.or.ddit.vo.GdocsVO;
import kr.or.ddit.vo.ProjectVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/gdocs")
@Controller
public class GdocsController {
	
	@Inject
    private IProjectService projectService;
	@Inject
	private IGdocsService gdocsService;
	
	@PostMapping("/gdocsSheet")
	public String createGSheet(String sheetId) {
		log.debug("gdocs new sheet id : {} ",sheetId);
		
		
		return "OK";
	}
	
	
	@GetMapping(value = "/getproname" , produces = "application/json;charset=utf-8")
	@ResponseBody
	public String getProName(String proNo) throws Exception {
		log.debug("getProName  pro_no: {}" ,proNo);
		ProjectVO proVo= projectService.selectOne(proNo);
		String proName = proVo.getProName(); 
		
		return proName;
	}
	
	@PutMapping(value = "/createDocs", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String createDocs(@RequestBody GdocsVO gdocsVO) throws Exception {
		log.debug("구글인증후 받은값  gdocsVO: {}" ,gdocsVO);
		 
		int res = gdocsService.certifyDocs(gdocsVO);
		log.debug("업데이트 개수 : {} " ,res );
		if (res < 1 ) {
			
			return "NO";
		}
		
		return "OK";
	}
	@GetMapping(value = "/getGdocsOne", produces = "application/json;charset=utf-8")
	@ResponseBody
	public GdocsVO getGdocsOne(@RequestParam String proNo) throws Exception {
		log.debug("getGdocsOne 받은값 : {}" ,proNo);
		
		GdocsVO vo = gdocsService.selectOne(proNo);
		log.debug("가져온값 : {} " ,vo );
			
		
		return vo;
	}
	
	
}
