package kr.or.ddit.controller.devin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.controller.devin.service.IDevinService;
import kr.or.ddit.vo.DevinComentVO;
import kr.or.ddit.vo.DevinVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/devin")
public class DevinController {

	@Inject
	private IDevinService service;

	//인서트 폼(개발자지식인 등록페이지)
	@GetMapping("/insert")
	public String dveinInsertform() {
		return "content/devinInsert";
	}

	// 인서트 도전 실패 다시 할것
	//인서트 버튼 눌러서~
//	@PostMapping("/insert")
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String dveinInsert(DevinVO devinVO) throws Exception  {
		log.debug("devinVO: {}",devinVO);
		service.insert(devinVO);

		// 등록후 여기서 인서트한 목록 리스트를 다시 끌고오는 과정이 필요한듯
		return "redirect:devinList";
	}


	/**
	 * shift+alt+j 하면 주석 고고링
	 * 채진영
	 * @param devinVO
	 * @return 인서트 성공 1 "OK"=>"그번호 가지고 디테일!" , 실패 0 "NG"=> "null"
	 * @throws Exception
	 */
	@PostMapping(value = "/insert2", produces = "application/json; charset=utf-8")
	@ResponseBody
	public DevinVO dveinInsert2(@RequestBody DevinVO vo) throws Exception  {
		log.debug("devinVO: {}"+vo);

		int cnt=service.insert(vo);
		log.debug("체킁:"+vo.getDviNo());

		if(cnt > 0) {
			DevinVO devInVO = service.select(vo);
			log.debug("devInVO: {}" + devInVO);
			return devInVO;
		}
		return null;
	}

	/**
	 * shift+alt+j 하면 주석 고고링
	 * 채진영
	 * @param vo
	 * @return 업데이트 성공 1 "OK"=>"그번호 가지고 디테일!" , 실패 0 "NG"=> "null"
	 * @throws Exception
	 */
	@PostMapping(value = "/update2", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> dveinUpdate2(@RequestBody DevinVO vo) throws Exception	{
		log.debug("업데이트용 devinVO: {}", vo);

		int cnt=service.update(vo);
		log.debug("업데이트용 글번호 체크:"+vo.getDviNo());

		if(cnt > 0) {
			DevinVO devinVO = service.select(vo);
			log.debug("업데이트용 내용 전체 devInVO: {}", devinVO);
			List<DevinComentVO> devinList = service.devinComentSelectList(devinVO);

			Map<String, Object> devinMap = new HashMap<String, Object>();
		    devinMap.put("devinVO", devinVO);
		    devinMap.put("devinList", devinList);

			return devinMap;
		}

		return null;
	}


	/**
	 * 채진영
	 * @param vo
	 * @return 데브인 삭제
	 */
	@PostMapping(value = "/delete", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String devinDelete(@RequestBody DevinVO vo) throws Exception {
		log.debug("삭제할 객체 : {}", vo);
		service.delete(vo);

		return "삭제 성공";
	}

	/**
	 * 채진영
	 * @return 게시글 전체 리스트
	 * @throws Exception
	 */
	@GetMapping(value = "/list", produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<DevinVO> devList() throws Exception {
	    List<DevinVO> devinList = service.selectList();

	    return devinList;
	}

	/**
	 * 채진영
	 * @param vo
	 * @return 조회할 게시글 번호 1개/해당 게시글의 댓글 목록
	 * @throws Exception
	 */
	@PostMapping(value = "/select", produces = "application/json; charset=utf-8")
	@ResponseBody
//	public DevinVO devSelect(@RequestBody DevinVO vo) throws Exception {
	public Map<String, Object> devSelect(@RequestBody DevinVO vo) throws Exception {
	    log.debug("받은 객체(조회할 게시글 번호 1개) : {}"+ vo);
		/*
	    DevinVO devinVO = service.select(vo.getDviNo());
	    log.debug("그 게시글 한줄 받아온것 devinVO : {}"+ devinVO);

	    return devinVO;
	    */


	    DevinVO devinVO = service.select(vo);
	    List<DevinComentVO> devinList = service.devinComentSelectList(devinVO);

	    Map<String, Object> devinMap = new HashMap<String, Object>();
	    devinMap.put("devinVO", devinVO);
	    devinMap.put("devinList", devinList);

	    log.debug("그 게시글 한줄 받아온것 devinVO : {}", devinVO);
	    log.debug("그 게시글의 댓글 목록 devinList : {}", devinList.toString());

	    return devinMap;
	}

	//리스트 폼(개발자지식인 리스트페이지)
	@GetMapping("/devinList")
	public String dveinListform() throws Exception {
		// 서비스한테 목록 전달해줘라고 요청
		// List<제네릭타입:자바빈즈> devinList
		// 내가 리턴할 페이지(jsp)로 model or modelMap인 데이터 전달자에 담아서 보낸다.
	//	List<DevinVO> devinList = service.selectList();
	//	model.addAttribute("devinList", devinList);
		return "content/devinList";
	}

	// 리스트의 선택 1개 디테일 세부

//	@GetMapping("/detail")
//	//@RequestMapping(value="/devinDetail", method = RequestMethod.GET)
//	public String devinDetail(String dviNo, Model model) throws Exception {
//		DevinVO devinVO = service.select(dviNo);
//		log.debug("devinVO: {}", devinVO);
//
//		model.addAttribute("devinVO", devinVO);
//
//		return "content/devinDetail";
//	}



	// 수정 update 폼 보여주기

//	@GetMapping("/update")
//	public String devinUpdateform(String dviNo, Model model) throws Exception {
//		DevinVO devinVO = service.select(dviNo);
//		log.debug("devinVO: {}", devinVO);
//
//		model.addAttribute("devinVO", devinVO);
//
//		return "content/devinUpdate";
//	}


	// 수정 update
	@PostMapping("/update")
	public String devinUpdate(DevinVO devinVO, Model model) throws Exception {
		service.update(devinVO);
		log.debug("devinVO: {}",devinVO);

		model.addAttribute("devinVO", devinVO);
		String goPage = "";
		goPage = "redirect:/devin/detail?dviNo=" + devinVO.getDviNo();
		return goPage;
	}

	//---------------------------------------------------------------------------------------------------------------------------------
	/**
	 * 채진영
	 * 댓글삭제
	 * @param DevinComentVO
	 * @throws Exception
	 */
	@PostMapping(value = "/devinComentDelete", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String devinComentDelete(@RequestBody DevinComentVO devinComentVO) throws Exception	{
		log.debug("====================================================================");
		log.debug("삭제할 객체(상태값변경) : {}", devinComentVO);
		service.devinComentDelete(devinComentVO);

		return "삭제 성공(상태값변경)";
	}

	@PostMapping(value = "/devinComentUpdate", produces = "application/json; charset=utf-8")
	@ResponseBody
	public DevinComentVO devinComentUpdate(@RequestBody DevinComentVO vo) throws Exception	{
		log.debug("====================================================================");
		log.debug("수정할 객체(댓글내용 변경) : {}", vo);
		int cnt = service.devinComentUpdate(vo);

		if(cnt > 0) {
			DevinComentVO devinComentVO = service.devinComentSelect(vo.getDviComentNo());
			log.debug("devinComentVO 그 번호에 해당하는 객체 한줄: {}" + devinComentVO);
			return devinComentVO;
		}
		return null;
	}

	/**
	 * shift+alt+j 하면 주석 고고링
	 * 채진영
	 * @param devinVO
	 * @return 인서트 성공 1 "OK"=>"그번호 가지고 디테일!" , 실패 0 "NG"=> "null"
	 * @throws Exception
	 */
	@PostMapping(value = "/devinComentInsert", produces = "application/json; charset=utf-8")
	@ResponseBody
	public DevinComentVO devinComentInsert(@RequestBody DevinComentVO vo) throws Exception  {
		//log.debug("devinVO :::::::::::::::: {}"+vo);

		int cnt=service.devinComentInsert(vo);
		//log.debug("채진영 cnt:"+cnt);
		//log.debug("채진영 체킁:"+vo.getDviComentNo());

		if(cnt > 0) {
			DevinComentVO devinComentVO = service.devinComentSelect(vo.getDviComentNo());
			log.debug("devinComentVO 그 번호에 해당하는 객체 한줄: {}" + devinComentVO);
			return devinComentVO;
		}
		return null;
	}


	@PostMapping(value="/getDevinIdByDevinNo", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getDevinIdByDevinNo(@RequestBody Map<String, String> data) throws Exception {

		String devinNo = data.get("devinNo").toString();
		String devinOwner = service.getDevinIdByDevinNo(devinNo);

		return devinOwner;
	}







}
