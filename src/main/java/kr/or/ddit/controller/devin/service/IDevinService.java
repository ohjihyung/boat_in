package kr.or.ddit.controller.devin.service;

import java.util.List;

import kr.or.ddit.vo.DevinComentVO;
import kr.or.ddit.vo.DevinVO;

public interface IDevinService {
	// 게시글 추가
	public int insert(DevinVO devinVO) throws Exception;

	// 게시글 출력
	public List<DevinVO> selectList() throws Exception;

	// 게시글 번호 선택

	public DevinVO select(DevinVO vo) throws Exception;

	// 게시글 수정
	public int update(DevinVO devInVO) throws Exception;

	// 게시글 검색 제목
	public List<DevinVO> search(String dviTitle) throws Exception;

	// 게시글 삭제
	public void delete(DevinVO vo) throws Exception;


	// 댓글관련
	// 댓글 리스트
	public List<DevinComentVO> devinComentSelectList(DevinVO devinVO) throws Exception;

	// 해당 댓글 번호 선택(한줄)
	public DevinComentVO devinComentSelect(String dviContentNo) throws Exception;

	// 댓글 추가
    public int devinComentInsert(DevinComentVO devinComentVO) throws Exception;

    // 댓글 수정
    public int devinComentUpdate(DevinComentVO devinComentVO) throws Exception;

    // 댓글 삭제
    public void devinComentDelete(DevinComentVO devinComentVO) throws Exception;

    // 해당 댓글 번호 좋아요
	public int devinComentLike(DevinComentVO dVo);

	// 해당 댓글 번호 좋아요 취소
	public int devinComentDisLike(DevinComentVO dvo);

	public String getDevinIdByDevinNo(String devinNo) throws Exception;

}
