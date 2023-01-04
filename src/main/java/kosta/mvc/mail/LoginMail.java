package kosta.mvc.mail;

import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
public class LoginMail {
 
    public int mail(String emailId) {
    	
    	Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
         
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
            from = new InternetAddress("orchid59@naver.com"); //발신자 아이디
            // 이메일 발신자
            msg.setFrom(from);
            // 이메일 수신자
            InternetAddress to = new InternetAddress(emailId); //받을사람 아이디
            msg.setRecipient(Message.RecipientType.TO, to);
           
            // 이메일 제목
            msg.setSubject(
                  "회원가입 인증 이메일 입니다.", "UTF-8");
            // 이메일 내용
           
            msg.setText(
            		 "홈페이지를 방문해주셔서 감사합니다." +
            	                "<br><br>" + 
            	                "인증 번호는 " + checkNum + "입니다." + 
            	                "<br>" + 
            	                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.");
           
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
        	return checkNum;
    }
}
