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
	public void join(Member member) {
		memberRep.save(member);
	}

	/* @Override
	public Member login(Member member) {
		return memberRep.login(member);
	} */

	@Override
	public void updateMypage(Member member) {
		// TODO Auto-generated method stub

	}

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
