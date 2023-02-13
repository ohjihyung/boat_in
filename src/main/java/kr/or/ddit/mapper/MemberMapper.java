package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.MemberVO;

public interface MemberMapper {

	public MemberVO detail(String username)throws Exception;

	public void insert(MemberVO memberVO);

	public MemberVO selectOne(String email);

	public void updateState(MemberVO memberVO);

    public MemberVO selectMember(MemberVO vo) throws Exception;


    /**
     *  OJH
     *  채팅에서 해당 유저 ID로 이름가져오기
     * @param memberId
     * @return  해당 유저 이름 가져옴
     */
	public String getUserNameById(String memberId);

	  /**
     *  OJH
     *  채팅에서 해당 유저 ID로 이미지 가져오기
     * @param memberId
     * @return  해당 유저 이미지 가져옴
     */
	public MemberVO getUserImage(String memberId);

	public List<MemberVO> getAllMember();
}
