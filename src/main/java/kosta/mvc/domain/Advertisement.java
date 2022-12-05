package kosta.mvc.domain;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * 배너광고 도메인
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
//@Entity
@Builder
public class Advertisement {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ad_adno_seq")
	@SequenceGenerator(name = "ad_adno_seq", allocationSize = 1, sequenceName = "ad_adno_seq")
	private Long adNo; //배너광고번호
	
	@Column(nullable = false)
	private String adName;//광고회사이름
	
	@Transient
	private MultipartFile adFile;//광고파일
	
	private String adFileName;//파일이름
	
	@CreationTimestamp
	private LocalDateTime adDate;//광고등록일
	
	@Column(nullable = false)
	private String adEnd; //광고종료일
	
	private int adPrice;//광고수수료


}
