package kosta.mvc;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

import kosta.mvc.domain.Member;
import kosta.mvc.repository.MemberRepository;
import kosta.mvc.service.MemberService;

@SpringBootTest
@Commit
@Transactional
class MinjeongTests {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	private MemberRepository memberRep;

	@Test
	void 회원가입() {		
		Member member = new Member();
		member.setMemberEmail("minjeongg24");
		member.setMemberPassword("1234");
		member.setMemberNickname("spring");
		member.setMemberPhone("010-8975-2643");
		member.setMemberBirthDate("2022-12-01");
		
		memberService.join(member);
	}
}
