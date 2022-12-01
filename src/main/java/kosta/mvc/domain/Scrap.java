package kosta.mvc.domain;

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
//@Entity
//@Builder
/**
 *  스크랩 도메인
 */
public class Scrap {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "scrap_sno_seq")
	@SequenceGenerator(name = "scrap_sno_seq", allocationSize = 1, sequenceName = "scrap_sno_seq")
	private Long scrapNo;
	
	/*
	 * @ManyToOne(fetch = FetchType.LAZY)//지연로딩
	 * 
	 * @JoinColumn(name = "memberNo") private Member member;
	 * 
	 * @ManyToOne(fetch = FetchType.LAZY)//지연로딩
	 * 
	 * @JoinColumn(name = "campNo") private Camp camp;
	 */
}
