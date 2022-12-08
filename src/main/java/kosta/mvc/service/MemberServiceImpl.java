package kosta.mvc.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.mvc.domain.Member;
import kosta.mvc.repository.MemberRepository;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberRepository memberRep;

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
		memberRep.save(member);
	}

	@Override
	public Member login(Member member) {
		System.out.println("service login member = " + member);
		
		member = memberRep.login(member.getMemberEmail(), member.getMemberPassword());
		
		System.out.println("rep login 갔다 옴~");
		
		if(member == null) throw new RuntimeException("일치하는 정보가 없습니다.");
		
		return member;
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


	/////////////////////////
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
}
