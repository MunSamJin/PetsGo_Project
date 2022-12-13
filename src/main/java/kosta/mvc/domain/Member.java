package kosta.mvc.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Builder
@RequiredArgsConstructor
//@ToString(exclude = {"petList" , "qnaBoardList","communityBoardList","reservationList","likeList","petList"})
/**
 * 회원 도메인
 */
//@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class Member implements Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "member_mno_seq")
	@SequenceGenerator(name = "member_mno_seq", allocationSize = 1, sequenceName = "member_mno_seq")
	@NonNull
	private Long memberNo; //회원번호
	
	private String memberProfile; //프로필 사진
	
	@Column(nullable = false)
	private String memberEmail; //이메일
	
	@Column(nullable = false)
	private String memberPassword; //비밀번호
	
	@Column(nullable = false)
	private String memberNickname; //닉네임
	
	@Column(nullable = false)
	private String memberPhone; //핸드폰번호
	
	@Column(nullable = false, name = "mamber_birth_date")
	private String memberBirthDate; //생년월일
	
	private String memberAuth; //본인인증
	
	private String memberRole;//권한

	
    @JsonIgnore
	@OneToMany(mappedBy = "member", cascade = CascadeType.ALL) 
	private List<Pet> petList;
	  
     @JsonIgnore
	@OneToMany(mappedBy = "member", cascade = CascadeType.ALL) 
	private List<QnaBoard> qnaBoardList;
	  
     @JsonIgnore
	@OneToMany(mappedBy = "member", cascade = CascadeType.ALL) 
	private	List<Scrap> scrapList;
	 
     @JsonIgnore
	@OneToMany(mappedBy = "member", cascade = CascadeType.ALL) 
	private List<Reservation> reservationList;

	 @JsonIgnore
	@OneToMany(mappedBy = "member", cascade = CascadeType.ALL) 
	private List<CommunityBoard> communityBoardList;
 
	 @JsonIgnore
	@OneToMany(mappedBy = "member", cascade = CascadeType.ALL) 
	private List<LikeBoard> likeList;

}
