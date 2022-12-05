package kosta.mvc.domain;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Builder
/**
 *  좋아요 누른 커뮤니티 도메인
 */
public class LikeBoard {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "like_lno_seq")
	@SequenceGenerator(name = "like_lno_seq", allocationSize = 1, sequenceName = "like_lno_seq")
	private Long likeNo;
	
	/*
	 * @ManyToOne(fetch = FetchType.LAZY)//지연로딩
	 * 
	 * @JoinColumn(name = "memberNo") private Member member;
	 * 
	 * @ManyToOne(fetch = FetchType.LAZY)//지연로딩
	 * 
	 * @JoinColumn(name = "boardNo") private CommunityBoard communityBoard;
	 */
}
