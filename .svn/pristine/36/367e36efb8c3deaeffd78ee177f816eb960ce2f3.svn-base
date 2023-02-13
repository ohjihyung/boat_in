package kr.or.ddit.controller.blike.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.common.CommonDao;
import kr.or.ddit.mapper.BlikeMapper;
import kr.or.ddit.vo.BlikeVO;
import kr.or.ddit.vo.DevinVO;
import lombok.extern.slf4j.Slf4j;
/**
 * @author 김진호
 *
 */
@Slf4j
@Service
public class BlikeServiceImpl implements IBlikeService {
	
	@Inject
	private BlikeMapper mapper;
	@Inject
	private CommonDao dao;
	
	@Override
	public int insertLike(BlikeVO vo) throws Exception {
		return mapper.insertLike(vo);
	}

	@Override
	public int deleteLike(BlikeVO vo) throws Exception {
		return mapper.deleteLike(vo);
	}

	/**
	 *
	 */
	@Override
	public List<BlikeVO> selectList(BlikeVO vo) {
		return mapper.selectList(vo);
	}

	@Override
	public List<Map<String, String>> checkLike(Map<String, String> map) throws Exception {
		return dao.selectList("checkLike", map);
	}


	@Override
	public DevinVO checkMyLike(Map<String, String> map) throws Exception {
		Map<String, String> result = dao.select("checkMyLike", map);
		
		log.debug("result : {}", result);
		//  
		if (result == null) {
			dao.insert("insertMyLike", map);
			dao.update("devinComentLike", map);
		} else {
			dao.delete("deleteMyLike", map);
			dao.update("devinComentDisLike", map);
		}
		
		DevinVO dviVO = dao.select("selectDviDetail", map);
		
		return dviVO;
	}

	
	
	
}
