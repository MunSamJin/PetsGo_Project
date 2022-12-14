package kosta.mvc.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Order(1)
@Configuration
public class SecurityConfigInMemory extends WebSecurityConfigurerAdapter {

	@Bean
	public static BCryptPasswordEncoder getPasswordEncoder() {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		return passwordEncoder;
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.antMatcher("/admin/**")
				.authorizeRequests()
				.anyRequest()
				.hasRole("ADMIN")
				.and()
			.formLogin()
				.loginPage("/loginForm")
				.loginProcessingUrl("/admin/adminLogin")
				.usernameParameter("id")
				.passwordParameter("password")
				.defaultSuccessUrl("/admin/main")
				//.failureHandler(memberAuthenticationFailurHandler)
				.failureForwardUrl("/loginForm?err")
				.and()
			.logout()
				.logoutUrl("/logout")
				.logoutSuccessUrl("/")
				.invalidateHttpSession(true)
				.deleteCookies("JSESSIONID")
				.and();	
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.inMemoryAuthentication().withUser("admin").password(getPasswordEncoder().encode("admin123")).roles("ADMIN");
	}
}
