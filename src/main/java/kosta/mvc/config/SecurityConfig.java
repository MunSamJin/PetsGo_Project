package kosta.mvc.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;

import kosta.mvc.security.MemberAuthenticationFailureHandler;
import kosta.mvc.security.MemberAuthenticationProvider;

@Configuration
@Order(2)
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Autowired
	MemberAuthenticationFailureHandler memberAuthenticationFailurHandler;
	
	@Autowired
	MemberAuthenticationProvider memberAuthenticationProvider; 
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.authorizeRequests()  
				.antMatchers("/camp/**", "/owner/campInsert/**", "/community/list")
				.permitAll()
				.antMatchers("/owner/**") 
				.hasRole("OWNER")            
				.antMatchers("/member/**", "/community/**")
				.hasRole("MEMBER")
				.and()
			.formLogin()
				.loginPage("/loginForm")
				.loginProcessingUrl("/j_spring_security_check")
				.usernameParameter("id")
				.passwordParameter("password")
				.defaultSuccessUrl("/default")
				//.failureHandler(memberAuthenticationFailurHandler)
				.failureForwardUrl("/loginForm?err")
				.and()
			.logout()
				.logoutUrl("/logout")
				.logoutSuccessUrl("/main")
				.invalidateHttpSession(true)
				.deleteCookies("JSESSIONID")
				.and()
				.csrf().disable();
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {		
		auth.authenticationProvider(memberAuthenticationProvider);
	}
}
