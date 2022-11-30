package kosta.mvc.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

@Configuration //환경설정을 돕틑 클래스 뜻. @Bean이 선언된 메소드가 호출되고 리턴하는 객체는 bean으로 등록
public class TilesConfiguration {
	
	/**
	 *  Tiles 등록
	 */
	@Bean
	public UrlBasedViewResolver viewResolver() {
		UrlBasedViewResolver viewResolver = new UrlBasedViewResolver();
		viewResolver.setOrder(1);
		viewResolver.setViewClass(TilesView.class);
		
		System.out.println("TilesConfiguration의 viewResolver() call");
		
		return viewResolver;
	}
	
	@Bean
	public TilesConfigurer getTilesConfigurer() {
		TilesConfigurer config = new TilesConfigurer();
		config.setDefinitions(new String[] {"/WEB-INF/tiles/tiles.xml"});
		
		System.out.println("TilesConfiguration의 getTilesConfigurer() call");
		
		return config;
	}

}
