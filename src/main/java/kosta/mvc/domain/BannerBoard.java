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

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Builder
public class BannerBoard {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "banner_bannerno_seq")
	@SequenceGenerator(name = "banner_bannerno_seq", allocationSize = 1, sequenceName = "banner_bannerno_seq")
	private Long bannerNo; //배너광고번호
	
	@Column(nullable = false)
	private String bannerName;//광고회사이름
	
	@Transient
	private MultipartFile adFile;//광고파일
	
	private String bannerFileName;//파일이름
	
	@CreationTimestamp
	private LocalDateTime bannerDate;//광고등록일
	
	@Column(nullable = false)
	private String bannerEnd; //광고종료일
	
	private int bannerPrice;//광고수수료

	
}
