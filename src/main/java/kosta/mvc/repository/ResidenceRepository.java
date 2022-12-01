package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.Residence;

public interface ResidenceRepository extends JpaRepository<Residence, Long> {

}
