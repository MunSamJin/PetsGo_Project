package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.Camp;

public interface CampRepository extends JpaRepository<Camp, Long>, QuerydslPredicateExecutor<Camp> {
	
}
