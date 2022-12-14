package kosta.mvc.mail;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import kosta.mvc.domain.Camp;

public class CampStateMailImpl implements CampStateMail {

	@Override
	public void mailSend(Camp camp) {
		Properties p = System.getProperties();
        p.put("mail.smtp.starttls.enable", "true");     // gmail은 true 고정
        p.put("mail.smtp.host", "smtp.naver.com");      // smtp 서버 주소
        p.put("mail.smtp.auth","true");                 // gmail은 true 고정
        p.put("mail.smtp.port", "465");                 // 네이버 포트
        //p.put("mail.smtp.ssl.protocols", "TLSv1.2"); //코드 추가 해줌
        p.put("mail.smtp.ssl.enable", "true");
           
        Authenticator auth = new MyAuthentication();
        //session 생성 및  MimeMessage생성
        Session session = Session.getDefaultInstance(p, auth);
        MimeMessage msg = new MimeMessage(session);
         
        try{
            //편지보낸시간
            msg.setSentDate(new Date());
            InternetAddress from = new InternetAddress() ;
            from = new InternetAddress("zzangah99@naver.com"); //발신자 아이디
            // 이메일 발신자
            msg.setFrom(from);
            // 이메일 수신자
            InternetAddress to = new InternetAddress(camp.getCampEmail()); //받을사람 아이디
            msg.setRecipient(Message.RecipientType.TO, to);
           
            // 이메일 제목
            msg.setSubject(
            		"[펫츠고(Pet's Go)] 캠핑장 요청에 대한 승인 사항을 알려드립니다", 
            		"UTF-8");
            // 이메일 내용
            String state = "";
            switch(camp.getCampState()) {
            case 0 : state = "등록 승인 대기"; break;
            case 1 : state = "등록 승인"; break;
            case 2 : state = "종료 승인 대기"; break;
            case 3 : state = "종료 승인"; break;
            }
            
            msg.setText(
            		"'" + camp.getCampName() + "'이 " 
            		, "UTF-8");
            
           
            // 이메일 헤더
            msg.setHeader("content-Type", "text/html");
            //메일보내기
            javax.mail.Transport.send(msg, msg.getAllRecipients());
             
        }catch (AddressException addr_e) {
            addr_e.printStackTrace();
        }catch (MessagingException msg_e) {
            msg_e.printStackTrace();
        }catch (Exception msg_e) {
            msg_e.printStackTrace();
        }

	}

}
