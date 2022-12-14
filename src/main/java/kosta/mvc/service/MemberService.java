package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.CommunityBoard;
import kosta.mvc.domain.LikeBoard;
import kosta.mvc.domain.Member;
import kosta.mvc.domain.Pet;
import kosta.mvc.domain.QnaBoard;
import kosta.mvc.domain.Reservation;

public interface MemberService {
	
	/**
	 * 이메일 중복 확인
	 * */
	String emailCheck(String email);
	
	/**
	 * 닉네임 중복 확인
	 * */
	String nicknameCheck(String nickname);
	
	/**
	 * 회원 가입
	 * */
	void register(Member member);
	
	/**
	 * 회원 정보 수정하기
	 * */
	Member updateInfo(Member member);
	
	/**
	 * 반려견 등록
	 * */
	void addPet(Pet pet);
	
	/**
	 * 회원 번호로 검색
	 * */
	Member selectByMemberNo(Long memberNo);
	
	/**
	 * 마이페이지 내 회원정보 이동
	 * */
	List<Pet> petList();
	
	/**
	 * 마이페이지 내 문의 이동
	 * */
	 List<QnaBoard> qnaList();
	
	/**
	 * 마이페이지 내 문의 등록하기
	 * */
	void qnaInsert(QnaBoard qna);
	
	/**
	 * 문의 번호 검색
	 * */
	QnaBoard selectByQnaNo(Long qnaNo);
	
	/**
	 * 마이페이지 내 문의 삭제하기
	 * */
	void qnaDelete(Long qnaNo);
	
	///////////////////////////////////
	
	/**
	 * 이메일 찾기
	 * */
	String searchEmail(Member member);
	
	/**
	 * 비밀번호 찾기
	 * */
	String searchPwd(Member member);
	
	/**
	 *  마이페이지 예약내역 조회
	 */
	List<Reservation> selectAll(Long memberNo);
	
	/**
	 *  결제취소요청하기
	 */
	int updateReservState(Long memberNo, Long reservationNo);
	
	/**
	 *  마이페이지 내 커뮤니티 등록한 게시글 조회
	 */
	List<CommunityBoard> selectCommunityAll(Long memberNo);
	
	/**
<<<<<<< HEAD
	 *  마이페이지 내 커뮤니티 좋아요 누른 게시글 조회
	 */
	List<LikeBoard> selectLikeList(Long memberNo);
	
=======
	 * 모든 멤버 조회
	 */
	List<Member> selectMemberAll();
>>>>>>> origin/haewon
}
