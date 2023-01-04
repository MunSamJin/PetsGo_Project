package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.data.repository.query.Param;

import kosta.mvc.domain.Member;

public interface MemberRepository extends JpaRepository<Member, Long>, QuerydslPredicateExecutor<Member> {
	
	/**
	 * 이메일 중복 확인
	 * */
	@Query("SELECT count(*) FROM Member m WHERE m.memberEmail=?1")
	int emailCheck(String email);
	
	/**
	 * 닉네임 중복 확인
	 * */
	@Query("SELECT count(*) FROM Member m WHERE m.memberNickname=?1")
	int nicknameCheck(String nickname);
	
	/**
	 * 로그인
	 * */
	@Query(value = "SELECT * FROM MEMBER WHERE MEMBER_EMAIL=?1 AND MEMBER_PASSWORD=?2", nativeQuery = true)
	Member login(String memberEmail, String memberPassword);
	
	/**
	 * security 관련
	 * */
	@Query(value = "SELECT * FROM MEMBER WHERE MEMBER_EMAIL=?1", nativeQuery = true)
	Member findMember(String memberEmail);
	
	/**
	 * 회원 탈퇴하기
	 * */
	@Query(value = "UPDATE MEMBER SET MEMBER_ROLE=NULL WHERE MEMBER_EMAIL=?1", nativeQuery = true)
	@Modifying
	int deleteInfo(String memberEmail);
}
