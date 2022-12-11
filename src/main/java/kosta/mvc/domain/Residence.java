package kosta.mvc.domain;

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

import org.springframework.web.multipart.MultipartFile;

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
 *  숙소 도메인
 */
public class Residence {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "resi_rno_seq")
	@SequenceGenerator(name = "resi_rno_seq", allocationSize = 1, sequenceName = "resi_rno_seq")
	private Long resiNo;
	
	@Column(nullable = false)
	private String resiName;
	
	@Column(nullable = false)
	private String resiType;
	
	@Column(nullable = false)
	private String resiEnv;
	
	private String resiGround;
	private String resiAmeniti;
	
	private int resiPrice;
	
	@Column(nullable = false, length = 1000)
	private String resiIntro;
	
	@Transient
	private MultipartFile resiFile;
	
	@Column(length = 1000, name = "resi_filename")
	private String resiFilename;
	
	private int resiPeople;
	
	private String resiPet;
	
	
	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY)//지연로딩
	@JoinColumn(name = "camp_no")
	//@JsonIgnore
	private Camp camp;


	

	/*@OneToMany(mappedBy = "residence", cascade = CascadeType.ALL) 
	private List<Reservation> reservationList;*/
	@OneToMany(mappedBy = "residence", cascade = CascadeType.ALL, fetch = FetchType.LAZY) 
	private List<ResidenceDetail> residenceDetailList;
}
