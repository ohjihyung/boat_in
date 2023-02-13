package kr.or.ddit.controller.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomerUser extends User {
	
	private MemberVO memberVO;
	public CustomerUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
		
	}
	//파라미터 :memVO => 1명
	/*
 	SELECT  A.USER_ID, A.USER_PW, A.USER_NAME, A.REG_DATE, A.UPD_DATE, A.ENABLED, B.AUTH
	FROM MEM A, MEM_AUTH B 
	WHERE A.USER_ID = B.USER_ID
	AND A.USER_ID = 'admin';
	 */
	//return memVO == null ? null : new CustomerUser(memVO);
	//Java 스트림 사용할경우 
	//사요앚가 정의한(ㄴselect한) MemVO 타입 객체 memVO를 
	//스프링시큐리티의 UserDetails 타입으로 변환
	//회원정보를 보내줄테니 이제 스프링이 관리해줘
	public CustomerUser(MemberVO memberVO) {
		super(memberVO.getMemberId(), memberVO.getMemberPw() ,
				 memberVO.getMemAuthVOList().stream()
				 .map(auth->new SimpleGrantedAuthority(auth.getAuth()))
				 .collect(Collectors.toList())
				);
		this.memberVO = memberVO;
		log.info("this.memvo : "  +this.memberVO) ;
	}
	/*
	public static List<SimpleGrantedAuthority> getList(MemVO memVO){
		List<SimpleGrantedAuthority> authorities = new ArrayList<>();
		for (MemAuthVO auth : memVO.getMemAuthVOList()) {
			SimpleGrantedAuthority authority = new SimpleGrantedAuthority(auth.getAuth());
			authorities.add(authority);
		}
		return authorities;
	}
	*/
	public MemberVO getMemVO() {
		return memberVO;
	}
	public void setMemVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
}
