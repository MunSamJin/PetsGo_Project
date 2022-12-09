package kosta.mvc.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import kosta.mvc.security.MemberAuthenticationFailureHandler;
import kosta.mvc.security.MemberAuthenticationProvider;

@Configuration
@EnableWebSecurity 
public class SecurityConfig extends WebSecurityConfigurerAdapter{

	@Autowired
	MemberAuthenticationFailureHandler memberAuthenticationFailurHandler;
	
	@Autowired
	MemberAuthenticationProvider memberAuthenticationProvider;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.authorizeRequests()  //  security-context  <security:intercept-url
				.antMatchers("/owner/**") //     pattern="/member/main" 
				.hasRole("OWNER")            //      access="isAuthenticated()"
				.antMatchers("/member/**")
				.hasRole("MEMBER") 
				//.antMatchers("/favicon.ico")
				//.anonymous()
				.and()
				//.csrf().disable() // <security:csrf disabled="true"/>
			.formLogin()
				.loginPage("/loginForm")
				.loginProcessingUrl("/j_spring_security_check")
				.usernameParameter("id")
				.passwordParameter("password")
				.defaultSuccessUrl("/default")
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
