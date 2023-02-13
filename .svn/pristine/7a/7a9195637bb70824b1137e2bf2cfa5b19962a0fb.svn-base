package kr.or.ddit.controller.blike;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.controller.blike.service.IBlikeService;
import kr.or.ddit.controller.devin.service.IDevinService;
import kr.or.ddit.vo.BlikeVO;
import kr.or.ddit.vo.DevinComentVO;
import kr.or.ddit.vo.DevinVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/blike")
public class BlikeController {
	
	@Inject
	private IDevinService devinService;
	
	@Inject
	private IBlikeService service;
	
	@PostMapping(value = "/insertLike", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, String> InsertLike (@RequestBody BlikeVO vo) throws Exception {
		List<BlikeVO> likeList = new ArrayList<BlikeVO>();
		likeList = service.selectList(vo);
		
		log.debug("likeList : {}", likeList);
		
		Map<String, String> mm =  new HashMap<String, String>();
		
		String data = "";
		if(likeList.size() != 0) { // 같은게 있나 조회하고 없으면 넣어주기
			for (BlikeVO listVo : likeList) {
				if(listVo.getBlikeLmember().equals(vo.getBlikeLmember())) {
					mm.put("type", "false");
					
					log.debug("listVo.getBlikeLmember() : {}", listVo.getBlikeLmember());
					log.debug("vo.getBlikeLmember() : {}", vo.getBlikeLmember());
					log.debug("내가 좋아요 이미 눌른거");
				}
			} 
			
		}else {
			mm.put("type", "insert");
			log.debug("내가 좋아요 아직 안누른거");
		}
		
		log.debug("좋아요한 객체 : {} ", vo);
		int cnt = service.insertLike(vo);
		log.debug("인서트 cnt :", cnt);
		
		data = vo.getBlikeNo();
		mm.put("commentNo", data);
		
		log.debug("좋아요한 글번호 가져오니? {}", data);
		log.debug("ddddddd : {}", mm);
		return mm;
	}
	
	@PostMapping(value = "/devinComentLike", produces = "application/json; charset=utf-8")
	@ResponseBody
	public DevinComentVO devinComentLike (@RequestBody DevinComentVO vo) throws Exception {
		log.debug("devinComentLike 객체 : {} ", vo);
		devinService.devinComentLike(vo);
		String dviComentNo = vo.getDviComentNo();
		
		// 여기서 글번호를 다시한번 조회하는 sql 돌아야함 현재 VO는 댓글번호만 있음
		
		DevinComentVO devinComentVo = devinService.devinComentSelect(dviComentNo);
		devinComentVo.setDviNo(devinComentVo.getDviNo());
		
		return devinComentVo;
	}
	
	@PostMapping(value = "/devinComentDisLike", produces = "application/json; charset=utf-8")
	@ResponseBody
	public DevinComentVO devinComentDisLike (@RequestBody DevinComentVO vo) throws Exception {
		log.debug("devinComentDisLike 객체 : {} ", vo);
		devinService.devinComentDisLike(vo);
		
		String dviComentNo = vo.getDviComentNo();
		
		// 여기서 글번호를 다시한번 조회하는 sql 돌아야함 현재 VO는 댓글번호만 있음
		
		DevinComentVO devinComentVo = devinService.devinComentSelect(dviComentNo);
		devinComentVo.setDviNo(devinComentVo.getDviNo());
		
		// 이건 3개씩 넣어주는거 맹글어서 따로 뒷단에서 처리
		BlikeVO disLikeVo = new BlikeVO();
		disLikeVo.setBlikeNo(dviComentNo);
		service.deleteLike(disLikeVo);
		
		return devinComentVo;
	}
	
	@PostMapping(value = "/checkLike", produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<Map<String, String>> checkLike(@RequestBody Map<String, String> map) throws Exception {
		List<Map<String, String>> list = service.checkLike(map);
		
		return list;
	}
	
	@PostMapping(value = "/checkMyLike", produces = "application/json; charset=utf-8")
	@ResponseBody
	public DevinVO checkMyLike(@RequestBody Map<String, String> map) throws Exception {
		DevinVO vo = service.checkMyLike(map);
		
		return vo;
	}
	
}
