package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.QnaBoard;

public interface QnaRepository extends JpaRepository<QnaBoard, Long>, QuerydslPredicateExecutor<QnaBoard> {
	@Query(value = "SELECT * FROM QNA_BOARD WHERE MEMBER_NO=?1 ORDER BY QNA_DATE DESC", nativeQuery = true)
	List<QnaBoard> selectQnaByMember(Long memberNo);
}
