package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.Member;

public interface MemberRepository extends JpaRepository<Member, Long>, QuerydslPredicateExecutor<Member> {
	
	/**
	 * 로그인
	 * */
	@Query("SELECT m FROM MEMBER m WHERE m.memberEmail=?1 AND m.memberPassword=?2")
	Member login(Member member);
}
