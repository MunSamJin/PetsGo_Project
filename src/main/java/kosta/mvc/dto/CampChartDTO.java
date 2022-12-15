package kosta.mvc.dto;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;

import org.hibernate.annotations.BatchSize;

import kosta.mvc.domain.Reservation;
import kosta.mvc.domain.Scrap;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class CampChartDTO {
	
	private String campName;
	private int scrapSize;
	private int reservationSize;
}






