package kr.or.ddit.controller.member.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MemoVO;

public interface IMemberService {

	public void memberRegister(MemberVO memberVO);

	public MemberVO selectOne(String email);

	public void updateState(MemberVO memberVO);

    public MemberVO selectMember(MemberVO vo) throws Exception;

    /**
     *  채팅에서 해당 유저 ID로 이름가져오기
     * @param memberId
     * @return  해당 유저 이름 가져옴
     */
	public String getUserNameById(String memberId);

	/**
	 *  오지형 그냥 전체 맴버 가져오는 메서드
	 * @return  List<MemberVO>
	 */
	public List<MemberVO> getAllMember();

    public List<MemoVO> memoList(MemberVO memberVO) throws Exception;

    public void insertMemo(MemoVO memoVO) throws Exception;

    public MemoVO selectMemo(MemoVO memoVO) throws Exception;

    public void updateMemo(MemoVO memoVO) throws Exception;

    public void deleteMemo(MemoVO memoVO) throws Exception;

    public List<Map<String, String>> my7Chart(MemberVO memberVO) throws Exception;

    public List<MemberVO> selectMemberChangeList(List<String> list) throws Exception;




}
