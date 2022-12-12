package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.Detail;

public interface DetailRepository extends JpaRepository<Detail, Long> {

}
