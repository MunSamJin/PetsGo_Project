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
public class Temporary {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "temp_no_seq")
	@SequenceGenerator(sequenceName = "temp_no_seq", allocationSize = 1, name = "temp_no_seq")
	private Long tempNo;
	
	@Column(nullable = false)
	private String reservCheckin;
	
	@Column(nullable = false)
	private String reservCheckout;
	
	@ManyToOne(fetch = FetchType.LAZY)//지연로딩
	@JoinColumn(name = "resi_no") 
	@JsonIgnore
	private Residence resi;
	
}
