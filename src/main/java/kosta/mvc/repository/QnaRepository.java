package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.data.repository.query.Param;

import kosta.mvc.domain.Member;
import kosta.mvc.domain.QnaBoard;

public interface QnaRepository extends JpaRepository<QnaBoard, Long> {
	
}
