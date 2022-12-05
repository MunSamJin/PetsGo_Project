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

import org.springframework.web.multipart.MultipartFile;

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
public class ResidenceDetail {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "resi_dno_seq")
	@SequenceGenerator(name = "resi_dno_seq", allocationSize = 1, sequenceName = "resi_dno_seq")
	@Column(name = "resi_detail_seq")
	private Long resiDetailSeq;
	
	@Column(nullable = false, name = "resi_detail_no")
	private String resiDetailNo;
	
	
	/*@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "resiNo")
	private Residence residence;*/
}
