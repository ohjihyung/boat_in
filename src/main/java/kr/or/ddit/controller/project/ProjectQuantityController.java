package kr.or.ddit.controller.project;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.common.CommonDao;
import kr.or.ddit.vo.ProjectJoinStateVO;
import kr.or.ddit.vo.ProjectLogVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.TopWorkVO;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/proquanti")
@Controller
@Slf4j
public class ProjectQuantityController {
	
	@Inject
	private CommonDao dao;
	
	@GetMapping("/home")
	public String proQuantityHome() {
		
		return "content/projectQuantity";
	}
	
	@PostMapping("/totalcnt")
	@ResponseBody
	public String proQuantiTotalCnt(@RequestBody TopWorkVO topworkVO) throws Exception {
		log.debug("totalcnt 받은객체 :{} ",topworkVO);
		String res = dao.select("proQuantiTotalCnt", topworkVO);
		return res;
	}
	
	@PostMapping("/statecnt")
	@ResponseBody
	public String proQuantiStateCnt(@RequestBody TopWorkVO topworkVO) throws Exception {
		log.debug("proQuantiStateCnt 받은객체 :{} ",topworkVO);
		String res = dao.select("proQuantiStateCnt", topworkVO);
		log.debug("state cnt 결과 : {} " ,res );
		return res;
	}
	
	@PostMapping("/deadworkcnt")
	@ResponseBody
	public String proQuantiDeadWorkCnt(@RequestBody TopWorkVO topworkVO) throws Exception {
		log.debug("proQuantiDeadWorkCnt 받은객체 :{} ",topworkVO);
		String res = dao.select("proQuantiDeadWorkCnt", topworkVO);
		log.debug("deadworkcnt 결과 : {} " ,res );
		return res;
	}
	
	@PostMapping("/myworkcnt")
	@ResponseBody
	public List<TopWorkVO> proQuantiMyWorkCnt(@RequestBody TopWorkVO topworkVO) throws Exception {
		log.debug("proQuantiMyWorkCnt 받은객체 :{} ",topworkVO);
		List<TopWorkVO> res = dao.selectList("proQuantiMyWorkCnt", topworkVO);
		log.debug("myworkcnt 결과 : {} " ,res );
		return res;
	}
	
	@PostMapping("/myworkrate")
	@ResponseBody
	public List<TopWorkVO> proQuantiMyWorkRate(@RequestBody TopWorkVO topworkVO) throws Exception {
		log.debug("proQuantiMyWorkRate 받은객체 :{} ",topworkVO);
		List<TopWorkVO> res = dao.selectList("proQuantiMyWorkRate", topworkVO);
		log.debug("myworkrate 결과 : {} " ,res );
		return res;
	}
	
	@PostMapping("/totalworkrate")
	@ResponseBody
	public List<TopWorkVO> proQuantiTotalWorkRate(@RequestBody TopWorkVO topworkVO) throws Exception {
		log.debug("proQuantiTotalWorkRate 받은객체 :{} ",topworkVO);
		List<TopWorkVO> res = dao.selectList("proQuantiTotalWorkRate", topworkVO);
		log.debug("toalworkrate 결과 : {} " ,res );
		return res;
	}
	@PostMapping("/prologtotalrate")
	@ResponseBody
	public List<ProjectLogVO> proLogTotalRate(@RequestBody TopWorkVO topworkVO) throws Exception {
		log.debug("proLogTotalRate 받은객체 :{} ",topworkVO);
		List<ProjectLogVO> res = dao.selectList("proLogTotalRate", topworkVO);
		log.debug("prologtotalrate 결과 : {} " ,res );
		return res;
	}
	
	@PostMapping("/deadlinelist")
	@ResponseBody
	public List<TopWorkVO> deadlineWorkList(@RequestBody TopWorkVO topworkVO) throws Exception {
		log.debug("deadlineWorkList 받은객체 :{} ",topworkVO);
		List<TopWorkVO> res = dao.selectList("deadlineWorkList", topworkVO);
		log.debug("deadlinelist 결과 : {} " ,res );
		return res;
	}
	
	@PostMapping("/newregiworklist")
	@ResponseBody
	public List<TopWorkVO> newRegiWorkList(@RequestBody TopWorkVO topworkVO) throws Exception {
		log.debug("newRegiWorkList 받은객체 :{} ",topworkVO);
		List<TopWorkVO> res = dao.selectList("newRegiWorkList", topworkVO);
		log.debug("newregiworklist 결과 : {} " ,res );
		return res;
	}
	
	@PostMapping("/getdirector")
	@ResponseBody
	public List<TopWorkVO> getDirector(@RequestBody TopWorkVO topworkVO) throws Exception {
		log.debug("getDirector 받은객체 :{} ",topworkVO);
		List<TopWorkVO> res = dao.selectList("getDirector", topworkVO);
		log.debug("getdirector 결과 : {} " ,res );
		return res;
	}
    /**
     * 프로젝트 홈화면에서 작업 승인대기 리스트 보여주는 데이터 뽑기 
     * @param topworkVO proNO 만 가지고 상태값만 가져올끄다
     * @return 작업승인코드 4인 topworkVO 가진 리스트 + 회원아이디 정보까지 joinstate 조인한거 
     * @throws Exception
     */
    @PostMapping("/readyconfirmworklist")
	@ResponseBody
	public List<TopWorkVO> readyConfirmWorkList(@RequestBody TopWorkVO topworkVO) throws Exception {
		log.debug("readyConfirmWorkList 받은객체 :{} ",topworkVO);
		List<TopWorkVO> res = dao.selectList("readyConfirmWorkList", topworkVO);
		log.debug("readyconfirmworklist 결과 : {} " ,res );
		return res;
	}
    
    /**
     * 프로젝트 권한 변경하기 귀찬흐이까 다른 컨트롤러안쓰고 여기서 걍 다한다 귀찬귀찬
     * @param topworkVO proNO 만 가지고 상태값만 가져올끄다
     * @return 작업승인코드 4인 topworkVO 가진 리스트 + 회원아이디 정보까지 joinstate 조인한거 
     * @throws Exception
     */
    @PostMapping("/modifyauth")
    @ResponseBody
    public String modifyAuth(@RequestBody  ProjectJoinStateVO projectJoinStateVO) throws Exception {
    	log.debug("modifyAuth 받은객체 :{} ",projectJoinStateVO);
    	int cnt = dao.update("updateProJoinAuth_H", projectJoinStateVO);
    	log.debug("업데이트됫나 ? :  {}",cnt);
    	String res =""; 
    	if (cnt >0) {
			res= "OK";
		}else {
			res="NO";
		}
    	log.debug("modifyauth 결과 : {} " ,res );
    	return res;
    }
    
    /**
     * 프로젝트 권한 변경하기 귀찬흐이까 다른 컨트롤러안쓰고 여기서 걍 다한다 귀찬귀찬
     * @param topworkVO proNO 만 가지고 상태값만 가져올끄다
     * @return 작업승인코드 4인 topworkVO 가진 리스트 + 회원아이디 정보까지 joinstate 조인한거 
     * @throws Exception
     */
    @PostMapping("/firepro")
    @ResponseBody
    public String firePro(@RequestBody  ProjectJoinStateVO projectJoinStateVO) throws Exception {
    	log.debug("firePro 받은객체 :{} ",projectJoinStateVO);
    	int cnt = dao.update("firePro_H", projectJoinStateVO);
    	log.debug("업데이트됫나 ? :  {}",cnt);
    	String res =""; 
    	if (cnt >0) {
    		res= "OK";
    	}else {
    		res="NO";
    	}
    	log.debug("firepro 결과 : {} " ,res );
    	return res;
    }
    
    @PostMapping("/detailproject")
  	@ResponseBody
  	public ProjectVO detailProject_h(@RequestBody TopWorkVO topworkVO) throws Exception {
  		log.debug("detailProject_h 받은객체 :{} ",topworkVO);
  		ProjectVO res = dao.select("detailProject_h", topworkVO);
  		log.debug("detailProject_h 결과 : {} " ,res );
  		return res;
  	}
	
}
