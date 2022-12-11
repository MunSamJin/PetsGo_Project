package kosta.mvc.domain;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;

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
 *  예약 도메인
 */
public class Reservation {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "reserv_reservno_seq")
	@SequenceGenerator(name = "reserv_reservno_seq", allocationSize = 1, sequenceName = "reserv_reservno_seq")
	private Long reservNo;
	
	@Column(nullable = false)
	private String reservName;
	
	@Column(nullable = false)
	private String reservPhone;
	
	@CreationTimestamp
	private LocalDateTime reservDate;
	
	@Column(nullable = false)
	private String reservType;
	
	private int reservPrice;
	private int reservState;
	private int reservPeople;
	
	@Column(nullable = false)
	private String reservCheckin;
	
	@Column(nullable = false)
	private String reservCheckout;
	
	private int reservTotalPet;
	
	@Column(nullable = true)
	private int reservInsuranceTotal;
	
	 @ManyToOne(fetch = FetchType.LAZY)//지연로딩
	 @JoinColumn(name = "memberNo")
	 private Member member;
	 
	 @ManyToOne(fetch = FetchType.LAZY)//지연로딩
	 @JoinColumn(name = "campNo")
	 private Camp camp;

	 @ManyToOne(fetch = FetchType.LAZY)//지연로딩
	 @JoinColumn(name = "resiNo")
	 private Residence residence;
	 
	 @ManyToOne(fetch = FetchType.LAZY)
	 @Transient
	 private List<Detail> detailList;

	 
	
}
