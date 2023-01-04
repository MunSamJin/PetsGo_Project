package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.Scrap;

public interface ScrapRepository extends JpaRepository<Scrap, Long>, QuerydslPredicateExecutor<Scrap> {

}
