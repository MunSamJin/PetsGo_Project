package kosta.mvc.domain;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Transient;

import org.hibernate.annotations.BatchSize;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Builder
//@ToString(exclude = {"residenceList","scrapList","reservationList"})
/**
 *  캠핑장 도메인
 */
public class Camp {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "camp_cno_seq")
	@SequenceGenerator(name = "camp_cno_seq", allocationSize = 1, sequenceName = "camp_cno_seq")
	private Long campNo;
	
	@Column(nullable = false)
	private String campPassword;
	
	@Column(nullable = false)
	private String campEmail;

	private int campState;
	
	@Column(nullable = false, name = "camp_manage_no")
	private String campManageNo;
	
	@Column(nullable = false, name = "camp_reg_no")
	private String campRegNo;
	
	@Column(nullable = false)
	private String campName;
	
	@Column(nullable = false)
	private String campPhone;
	
	private int campPost;
	
	@Column(nullable = false)
	private String campAddr;
	
	@Column(nullable = false)
	private String campLat;
	
	@Column(nullable = false)
	private String campLong;
	
	@Transient
	private MultipartFile campImg;
	
	@Column(nullable = false, length = 1000)
	private String campFilename;//파일이름
	
	@Column(nullable = false, length = 1000)
	private String campNotify;
	
	@Column(length = 1000)
	private String campIntro;
	
	@Column(nullable = false)
	private String campFacility;
	
	private String campSurround;
	
	@Column(nullable = false)
	private String campCheckin;
	
	@Column(nullable = false)
	private String campCheckout;
	
	private String campRole;
	
	//@JsonIgnore
	//@BatchSize(size = 1000)
	@OneToMany(mappedBy = "camp", cascade = CascadeType.ALL, fetch = FetchType.LAZY) 
	private List<Residence> residenceList;
	
	//@BatchSize(size = 1000)
	//@JsonIgnore //세륜 차트하면서 주석
	@OneToMany(mappedBy = "camp", cascade = CascadeType.ALL , fetch = FetchType.LAZY) 
	private List<Scrap> scrapList;

	//@BatchSize(size = 1000)
	//@JsonIgnore //세륜 차트하면서 주석
	@OneToMany(mappedBy = "camp", cascade = CascadeType.ALL ,fetch = FetchType.LAZY) 
	private List<Reservation> reservationList;

	

}
