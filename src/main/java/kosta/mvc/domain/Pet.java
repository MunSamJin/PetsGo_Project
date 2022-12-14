package kosta.mvc.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import com.fasterxml.jackson.annotation.JsonIgnore;

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
 * 반려견 도메인
 */
public class Pet {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "pet_pno_seq")
	@SequenceGenerator(name = "pet_pno_seq", allocationSize = 1, sequenceName = "pet_pno_seq")
	private Long petNo;
	
	@Column(nullable = false)
	private String petName;
	
	@Column(nullable = false)
	private double petWeight;
	
	private int petNeuter;
	private String petVaccine;
	private String petOther;
	
	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY) //지연 로딩
	@JoinColumn(name = "member_no") 
	private Member member;
}
