package kr.or.ddit.controller.security;

import org.springframework.security.crypto.password.PasswordEncoder;

import lombok.extern.slf4j.Slf4j;


@Slf4j
public class CustomNoOpPasswordEncoder implements PasswordEncoder {

	@Override
	public String encode(CharSequence rawPassword) {
		log.warn("befor encode: "+rawPassword);
		// 아무것도 정의하지않음 -> 암호화 안함
		return rawPassword.toString();
	}

	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		// 암호화 된거와 안된거가 같은지 따지는 것 
		log.warn("mathces  "+rawPassword + " : "+ encodedPassword);
		return rawPassword.toString().equals(encodedPassword);
	}
	
}
