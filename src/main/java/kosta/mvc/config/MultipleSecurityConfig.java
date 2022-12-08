package kosta.mvc.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import kosta.mvc.security.MemberAuthenticationFailureHandler;
import kosta.mvc.security.MemberAuthenticationProvider;
import kosta.mvc.security.OwnerAuthenticationFailureHandler;
import kosta.mvc.security.OwnerAuthenticationProvider;



@Configuration
@EnableWebSecurity 
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
@Deprecated
public class MultipleSecurityConfig {
	
	public static final String[] SECURITY_EXCLUDE_PATTERN_ARR = {
		"/",
		
		"/error/**",
		"/resources/**",
		"/loginForm",
	};

	
	
	//Member
	@Order(2)
	@Configuration
	public static class MemberSecurityConfig extends WebSecurityConfigurerAdapter{

		@Autowired
		MemberAuthenticationFailureHandler memberAuthenticationFailurHandler;
		
		@Autowired
		MemberAuthenticationProvider memberAuthenticationProvider;
		
		@Override
		protected void configure(HttpSecurity http) throws Exception {

			http
			.authorizeRequests()  //  security-context  <security:intercept-url
			.antMatchers("/member/**")
			//.hasRole("MEMBER") 
			.authenticated()
			//.permitAll() 
			.and()
			//.csrf().disable() // <security:csrf disabled="true"/>
			.formLogin()
			.loginPage("/loginForm")
			.loginProcessingUrl("/j_spring_security_check")
			.usernameParameter("memberEmail")
			.passwordParameter("memberPassword")
			.defaultSuccessUrl("/main")
			.failureHandler(memberAuthenticationFailurHandler)
			.and()
			.logout()
			.logoutUrl("/logout")
			.logoutSuccessUrl("/main")
			.invalidateHttpSession(true)
			.deleteCookies("JSESSIONID")
			.and();
		}

		@Override
		protected void configure(AuthenticationManagerBuilder auth) throws Exception {
			auth.authenticationProvider(memberAuthenticationProvider);
			//auth.inMemoryAuthentication().withUser("admin").password("{noop}1234").authorities("ROLE_ADMIN");
		}
		
		@Bean
		public static BCryptPasswordEncoder passwordEncoder() {
			return new BCryptPasswordEncoder();
		}
	}
	
	
	
	//Owner
	@Order(1)
	@Configuration
	public static class OwnerSecurityConfig extends WebSecurityConfigurerAdapter{

		@Autowired
		OwnerAuthenticationFailureHandler ownerAuthenticationFailurHandler;
		
		@Autowired
		OwnerAuthenticationProvider ownerAuthenticationProvider;
		
		@Override
		protected void configure(HttpSecurity http) throws Exception {

			http
			.authorizeRequests()  //  security-context  <security:intercept-url
			.antMatchers("/owner/**") //     pattern="/member/main" 
			.hasRole("OWNER")            //      access="isAuthenticated()"
			.and()
			//.csrf().disable() // <security:csrf disabled="true"/>
			.formLogin()
			.loginPage("/loginForm")
			.loginProcessingUrl("/loginCheck")
			.usernameParameter("campRegNo")
			.passwordParameter("campPassword")
			.defaultSuccessUrl("/owner/campHome")
			.failureHandler(ownerAuthenticationFailurHandler)
			.and()
			.logout()
			.logoutUrl("/logout")
			.logoutSuccessUrl("/main")
			.invalidateHttpSession(true)
			.deleteCookies("JSESSIONID")
			.and();
		}

		@Override
		protected void configure(AuthenticationManagerBuilder auth) throws Exception {
			auth.authenticationProvider(ownerAuthenticationProvider);
			//auth.inMemoryAuthentication().withUser("admin").password("{noop}1234").authorities("ROLE_ADMIN");
		}
		
		@Bean
		public static BCryptPasswordEncoder passwordEncoder() {
			return new BCryptPasswordEncoder();
		}
	}
}
