package kosta.mvc.config;

import java.util.Properties;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;
import org.springframework.web.servlet.view.BeanNameViewResolver;

import com.querydsl.jpa.impl.JPAQueryFactory;

@Configuration
public class AppConfig {
	
	@PersistenceContext
	EntityManager em;

	/**
	 * 예외처리
	 */
	//@Bean
	public SimpleMappingExceptionResolver getSimpleMappingExceptionResolver() {
		SimpleMappingExceptionResolver exceptionResolver = new SimpleMappingExceptionResolver();
		Properties pro = new Properties();
		pro.put("Exception", "error/errorView");

		exceptionResolver.setExceptionMappings(pro);
		
		return exceptionResolver;
	}
	
	/**
	 *  JPAQueryFactory 등록 = 생성
	 *  : queryDSL을 사용할 때 다양한 쿼리를 직접할 수 있도록 관련 메소드 제공
	 *  : 기존에 ~.findAll(Predicate pre)  - select 전용이기 때문에 조건만 BooleanBuilder를 이용해서
	 *     만들었지만, delete, update, insert, 서브쿼리, 복잡한 쿼리(조인), 이런 다양한 쿼리는 
	 *     JPAQueryFactory 사용
	 */
	@Bean
	public JPAQueryFactory queryFactory() {
		return new JPAQueryFactory(em);
	}
}
