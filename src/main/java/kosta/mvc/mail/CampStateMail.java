package kosta.mvc.mail;

import kosta.mvc.domain.Camp;

public interface CampStateMail {

	/**
	 * 캠핑장 접수, 승인, 승인거절, 종료이후 -> adminController
	 */
	void mailSend(Camp camp, String campEmail);
	
	
	/**
	 *  reservMail 결제이후, 예약확정, 예약취소 -> owner
	 */
	
	
	/**
	 * 가입, 비밀번호 재설정 -> admin
	 */
	
}
