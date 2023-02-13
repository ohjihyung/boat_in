package kr.or.ddit.controller.member.service;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.MessagingException;

import org.hibernate.validator.constraints.Email;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProjectJoinStateVO;
import kr.or.ddit.vo.ProjectVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MailSendService {
	int size ;
    @Inject
    private JavaMailSenderImpl mailSender;

    //인증키 생성
    private String getKey(int size) {
        this.size = size;
        return getAuthCode();
    }

    //인증코드 난수 발생
    private String getAuthCode() {
        Random random = new Random();
        StringBuffer buffer = new StringBuffer();
        int num = 0;

        while(buffer.length() < size) {
            num = random.nextInt(10);
            buffer.append(num);
        }

        return buffer.toString();
    }

    //인증메일 보내기
    public String sendAuthMail(String memberId) {
        //6자리 난수 인증번호 생성
    	
        String authKey = getKey(6);
        log.debug("인증번호 :: {} ,메일아이디 : {}  ",authKey,memberId);

        //인증메일 보내기  
        /// 보내는 주소 /member/signUpConfirm?email={memberId}&authKey={memberToken}
        try {
            MailUtils sendMail = new MailUtils(mailSender);
            sendMail.setSubject("회원가입 이메일 인증");
            sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
            .append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
            .append("<a href='http://localhost/member/signUpConfirm?email=")
            .append(memberId)
            .append("&authKey=")
            .append(authKey)
            .append("' target='_blenk'>이메일 인증 확인</a>")
            .toString());
            
            sendMail.setFrom("ddit404@naver.com", "팀 보트");
            sendMail.setTo(memberId);
            sendMail.send();
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

          return authKey;
    }
    
    /**
     * 프로젝트 초대 이메일보내기 .링크타면 자동참가 멤버권한으로 디폴트
     * 팀장 회원의 정보  , 받는사람정보  
     * @param email : 초대보낼이메일 
     * @param proVO : 해당 프로젝트의 정보  
     * @return
     */
    public String invitePorject(String email,ProjectJoinStateVO proJSVO) {
    	//http://localhost/projoin/inviteConrfirmPro?proNo=182&email=ddit404@naver.com
    	String inviteMsg = proJSVO.getInviteMsg();
        //인증메일 보내기  
        try {
            MailUtils sendMail = new MailUtils(mailSender);
            sendMail.setSubject("BOAT-IN에서 보낸 프로젝트 초대입니다.");
            sendMail.setText(new StringBuffer().append(inviteMsg)
            .toString());
            
            sendMail.setFrom("ddit404@naver.com", "팀 웨이브");
            sendMail.setTo(email);
            sendMail.send();
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

          return "메일전송을 완료하였습니다.";
    }
    
    
}