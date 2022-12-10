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
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.web.multipart.MultipartFile;

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
/* @ToString */
/**
 *  커뮤니티 도메인
 */
public class CommunityBoard {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "board_bno_seq")
	@SequenceGenerator(name = "board_bno_seq", allocationSize = 1, sequenceName = "board_bno_seq")
	private Long boardNo;
	
	@CreationTimestamp
	private LocalDateTime boardDate;
	
	//@Column(nullable = false, length = 1000)
	private String boardTag;
	
	//@Column(nullable = false, length = 1000)
	//@Lob
	private String boardContent;
	
	@Transient
	private MultipartFile boardFile;
	
	@Column(length = 1000, name = "board_file_name")
	private String boardFileName;
	
	@Transient
	private long fileSize;
	
	@ManyToOne(fetch = FetchType.LAZY)//지연로딩
	@JoinColumn(name = "memberNo") 
	private Member member;
	 
	@OneToMany(mappedBy = "communityBoard", cascade = CascadeType.ALL) 
	private List<LikeBoard> likeList;

}
