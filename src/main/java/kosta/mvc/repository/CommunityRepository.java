package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.CommunityBoard;

public interface CommunityRepository extends JpaRepository<CommunityBoard, Long>, 
		QuerydslPredicateExecutor<CommunityBoard> {

}
