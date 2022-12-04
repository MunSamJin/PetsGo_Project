package kosta.mvc.domain;

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

@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class CommunityFiles {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "community_fid_seq")
	@SequenceGenerator(name = "community_fid_seq", allocationSize = 1, sequenceName = "community_fid_seq")
	private Long fileId;
	
	private String fileName;
	private String fileContent;
	private String fileType;

    public CommunityFiles(String fileName, String fileContent, String fileType) {
        super();
        this.fileName = fileName;
        this.fileContent = fileContent;
        this.fileType = fileType;
    }
    
  

}
