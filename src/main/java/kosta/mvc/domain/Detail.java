package kosta.mvc.domain;

import java.time.LocalDateTime;

import javax.persistence.Column;
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
 *  예약 상세 도메인
 */
public class Detail {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "detail_dno_seq")
	@SequenceGenerator(name = "detail_dno_seq", allocationSize = 1, sequenceName = "detail_dno_seq")
	private Long detailNo;
	
	@Column(name = "detail_insurance_price", nullable = true)
	private int detailInsurancePrice;
	
	@Column(name = "detail_pet_name", nullable = false)
	private String detailPetName;
	
	@Column(name = "detail_pet_weight")
	private int detailPetWeight;
	
	@Column(name = "detail_pet_neuter")
	private int detailPetNeuter;
	
	@Column(name = "Stringdetail_pet_vaccin", nullable = false)
	private String detailPetVaccin;
	
	@Column(name = "Stringdetail_pet_other")
	private String detailPetOther;

	 @ManyToOne(fetch = FetchType.LAZY)//지연로딩
	 @JoinColumn(name = "reservNo")
	 private Reservation reservation;
}
