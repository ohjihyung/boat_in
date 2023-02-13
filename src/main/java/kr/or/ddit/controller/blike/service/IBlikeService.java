package kr.or.ddit.controller.blike.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BlikeVO;
import kr.or.ddit.vo.DevinVO;

public interface IBlikeService {
	
	// 좋아요 추가
	public int insertLike(BlikeVO vo) throws Exception;
	
	// 좋아요 삭제
	public int deleteLike(BlikeVO vo) throws Exception;

	// 전체 좋아요 조회
	public List<BlikeVO> selectList(BlikeVO vo);

	public List<Map<String, String>> checkLike(Map<String, String> map) throws Exception;

	public DevinVO checkMyLike(Map<String, String> map) throws Exception;
	
	
}
