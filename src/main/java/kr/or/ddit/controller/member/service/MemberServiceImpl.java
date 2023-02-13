package kr.or.ddit.controller.member.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.common.CommonDao;
import kr.or.ddit.mapper.MemberMapper;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MemoVO;

@Service
public class MemberServiceImpl implements IMemberService {

	@Inject
	MemberMapper mapper;
	@Inject
	private CommonDao dao;

	@Override
	public void memberRegister(MemberVO memberVO) {
		mapper.insert(memberVO);

	}

	@Override
	public MemberVO selectOne(String email) {

		return mapper.selectOne(email);
	}

	@Override
	public void updateState(MemberVO memberVO) {
		mapper.updateState(memberVO);

	}

    @Override
    public MemberVO selectMember(MemberVO vo) throws Exception {
        return mapper.selectMember(vo);
    }


    // ojh
	@Override
	public String getUserNameById(String memberId) {
		return mapper.getUserNameById(memberId);
	}

	@Override
	public List<MemberVO> getAllMember() {
		// TODO Auto-generated method stub
		return mapper.getAllMember();
	}

    @Override
    public List<MemoVO> memoList(MemberVO memberVO) throws Exception {
        return dao.selectList("memoList", memberVO);
    }

    @Override
    public void insertMemo(MemoVO memoVO) throws Exception {
        dao.insert("insertMemo", memoVO);
    }

    @Override
    public MemoVO selectMemo(MemoVO memoVO) throws Exception {
        return dao.select("selectMemo", memoVO);
    }

    @Override
    public void updateMemo(MemoVO memoVO) throws Exception {
        dao.update("updateMemo", memoVO);
    }

    @Override
    public void deleteMemo(MemoVO memoVO) throws Exception {
        dao.update("deleteMemo", memoVO);
    }

    @Override
    public List<Map<String, String>> my7Chart(MemberVO memberVO) throws Exception {
        //데이트 타입을 변형시켜서 넘겨야한다.
        List<Map<String, String>> list = dao.selectList("my7Chart", memberVO);

        return list;
    }

    @Override
    public List<MemberVO> selectMemberChangeList(List<String> list) throws Exception {
        
        List<MemberVO> totalList = new ArrayList<>();
        
        for (int i = 0; i < list.size(); i++) {
            MemberVO vo = dao.select("selectJinoMember", list.get(i));
            totalList.add(vo);
        }
        
        return totalList;
    }

}
