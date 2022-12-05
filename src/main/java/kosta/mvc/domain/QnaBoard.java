package kosta.mvc.domain;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

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
 *  QnA 도메인
 */
public class QnaBoard {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "qna_qnano_seq")
	@SequenceGenerator(name = "qna_qnano_seq", allocationSize = 1, sequenceName = "qna_qnano_seq")
	private Long qnaNo;
	
	@Column(length = 1000, nullable = false)
	private String qnaContent;
	
	@CreationTimestamp
	private LocalDateTime qnaDate;
	
	@Column(length = 1000, name = "qna_re_content")
	private String qnaReContent;
	
	@UpdateTimestamp
	@Column(name = "qna_re_date")
	private LocalDateTime qnaReDate;
	
	
	/*
	 * @ManyToOne(fetch = FetchType.LAZY)//지연로딩
	 * 
	 * @JoinColumn(name = "memberNo") private Member member;
	 */

	
	
}
