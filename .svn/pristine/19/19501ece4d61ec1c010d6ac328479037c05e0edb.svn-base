package kr.or.ddit.controller.devin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.common.CommonDao;
import kr.or.ddit.controller.devin.DevinController;
import kr.or.ddit.mapper.DevinMapper;
import kr.or.ddit.vo.DevinComentVO;
import kr.or.ddit.vo.DevinVO;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class DevinServiceImpl implements IDevinService {

	// 2023.01.05 커밋시점 만들기

	@Inject
	private DevinMapper mapper;
	@Inject
	private CommonDao dao;

	@Override
	public int insert(DevinVO devinVO) throws Exception {

		return mapper.insert(devinVO);
	}

	@Override
	public List<DevinVO> selectList() throws Exception {
		return mapper.selectList();
	}

	@Override
	public DevinVO select(DevinVO vo) throws Exception {
		log.debug("셀렉트한거 그 내용 보낸거 vo 들은 것들: {}",vo);
		if(!vo.getMemberId().equals(vo.getLocalStorageMemberId())) {
			
			mapper.incrementHit(vo.getDviNo());
		}
		return mapper.select(vo);
	}

	@Override
	public int update(DevinVO devInVO) throws Exception {
		return mapper.update(devInVO);
	}

	@Override
	public List<DevinVO> search(String dviTitle) throws Exception {
		return mapper.search(dviTitle);
	}

	@Override
	public void delete(DevinVO vo) throws Exception {
		dao.delete("deleteDevIn", vo);
	}


	// 댓글
	@Override
	public List<DevinComentVO> devinComentSelectList(DevinVO devinVO) throws Exception {
		return mapper.devinComentSelectList(devinVO);
	}

	@Override
	public DevinComentVO devinComentSelect(String dviContentNo) throws Exception {
		return mapper.devinComentSelect(dviContentNo);
	}

	@Override
	public int devinComentInsert(DevinComentVO devinComentVO) throws Exception {
		return mapper.devinComentInsert(devinComentVO);
	}

	@Override
	public int devinComentUpdate(DevinComentVO devinComentVO) throws Exception {
		return mapper.devinComentUpdate(devinComentVO);
	}

	@Override // 삭제는 진짜 삭제아니고 상태값만 바꿔주는 것으로!
	public void devinComentDelete(DevinComentVO devinComentVO) throws Exception {
		dao.update("devinComentDelete", devinComentVO);
	}

	@Override
	public int devinComentLike(DevinComentVO dVo) {
		return mapper.devinComentLike(dVo);
	}

	@Override
	public int devinComentDisLike(DevinComentVO dvo) {
		return  mapper.devinComentDisLike(dvo);
	}

	@Override
	public String getDevinIdByDevinNo(String devinNo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.getDevinIdByDevinNo(devinNo);
	}




}
