package kosta.mvc.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuthentication extends Authenticator {
    
  PasswordAuthentication pa;
  public MailAuthentication(){
       
  	String id = "pt_msj@naver.com";  //네이버 이메일 아이디
      String pw = "";        //네이버 비밀번호

      // ID와 비밀번호를 입력한다.
      pa = new PasswordAuthentication(id, pw);
  }

  // 시스템에서 사용하는 인증정보
  public PasswordAuthentication getPasswordAuthentication() {
      return pa;
  }
}
