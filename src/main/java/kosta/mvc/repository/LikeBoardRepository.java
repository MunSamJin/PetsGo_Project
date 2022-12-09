package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.LikeBoard;

public interface LikeBoardRepository extends JpaRepository<LikeBoard, Long>, 
			QuerydslPredicateExecutor<LikeBoard>{
	

}
