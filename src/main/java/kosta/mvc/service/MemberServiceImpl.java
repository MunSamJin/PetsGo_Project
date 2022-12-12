package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kosta.mvc.domain.Member;
import kosta.mvc.domain.QnaBoard;
import kosta.mvc.domain.Reservation;
import kosta.mvc.repository.MemberRepository;
import kosta.mvc.repository.QnaRepository;
import kosta.mvc.repository.ReservationRepository;


@Service
@Transactional
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberRepository memberRep;
	
	@Autowired
	private ReservationRepository reservationRep;
	@Autowired
	private QnaRepository qnaRep;

	
	/*
	 * 비밀번호 암호화를 위한 객체를 주입받는다 
	 */
	@Autowired
	private PasswordEncoder passwordEncoder; 

	@Override
	public String emailCheck(String email) {
		int count = memberRep.emailCheck(email);
		
		return (count==0) ? "ok" : "fail"; 
	}
	
	@Override
	public String nicknameCheck(String nickname) {
		int count = memberRep.nicknameCheck(nickname);
		
		return (count==0) ? "ok" : "fail"; 
	}
	
	@Override
	public void register(Member member) {
		//비밀번호 암호화
		String encodedPassword = passwordEncoder.encode(member.getMemberPassword());
		System.out.println("회원가입 service encodedPassword = " + encodedPassword);
		
		member.setMemberPassword(encodedPassword);
		
		memberRep.save(member);
	}

	@Override
	public Member updateInfo(Member member) {
		//해당하는 회원 찾기
		Member dbMember = memberRep.findById(member.getMemberNo()).orElse(null);
		if(dbMember == null) throw new RuntimeException("회원 정보를 수정할 수 없습니다.");

		//회원 정보 수정
		dbMember.setMemberProfile(member.getMemberProfile());
		dbMember.setMemberPassword(member.getMemberPassword());
		dbMember.setMemberNickname(member.getMemberNickname());
		dbMember.setMemberPhone(member.getMemberPhone());
		dbMember.setMemberBirthDate(member.getMemberBirthDate());
		
		return dbMember;
	}
	
	@Override
	public List<QnaBoard> qnaList() {
		return qnaRep.findAll();
	}

	@Override
	public void qnaInsert(QnaBoard qna) {
		qnaRep.save(qna);
	}
	
	@Override
	public QnaBoard selectByQnaNo(Long qnaNo) {
		QnaBoard qna = qnaRep.findById(qnaNo).orElse(null);
		
		if(qna == null) throw new RuntimeException("해당 문의가 없습니다.");
		
		return qna;
	}
	
	/* @Override
	public QnaBoard qnaUpdate(QnaBoard qna) {
		QnaBoard dbQna = qnaRep.findById(qna.getQnaNo()).orElse(null);
		
		if(dbQna == null) throw new RuntimeException("수정할 수 없습니다.");
		
		dbQna.setQnaContent(qna.getQnaContent());
		
		return dbQna;
	} */
	
	@Override
	public void qnaDelete(Long qnaNo) {
		QnaBoard qna = qnaRep.findById(qnaNo).orElse(null);
		if(qna == null) throw new RuntimeException("해당 문의를 삭제할 수 없습니다.");
		
		qnaRep.deleteById(qnaNo);
	}

	////////////////////////////////////////
	@Override
	public String searchEmail(Member member) {
		memberRep.findById(member.getMemberNo());
		return null;
	}

	@Override
	public String searchPwd(Member member) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Reservation> selectAll(Long memberNo) {
		
		//System.out.println("member 서비스 들어왔니?? memberNo = " + memberNo);
		
		
		return reservationRep.selectAll(memberNo);
	}

	@Override
	public int updateReservState(Long memberNo, Long reservationNo) {
		System.out.println("member서비스 결제취소요청하러 왔니?");
		System.out.println("memberNo = " + memberNo);
		
		//결제취소요청
		reservationRep.updateReservState(memberNo, reservationNo);
		
		//예약상태조회
		int dbReservState = reservationRep.selectReservState(memberNo, reservationNo);
		
		return dbReservState;
	}
}
