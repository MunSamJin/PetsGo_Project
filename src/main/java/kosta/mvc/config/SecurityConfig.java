package kosta.mvc.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;

import kosta.mvc.security.MemberAuthenticationFailureHandler;
import kosta.mvc.security.MemberAuthenticationProvider;

@Configuration
@EnableWebSecurity 
public class SecurityConfig extends WebSecurityConfigurerAdapter{

	//@Autowired
	//DataSource dataSource;	
	
	@Autowired
	MemberAuthenticationFailureHandler memberAuthenticationFailurHandler;
	
	@Autowired
	MemberAuthenticationProvider memberAuthenticationProvider;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.authorizeRequests()  //  security-context  <security:intercept-url
				//.antMatchers("/admin/**") //     pattern="/member/main" 
				//.hasRole("ADMIN") 
				.antMatchers("/owner/campInsert/**")
				.permitAll()
				.antMatchers("/owner/**") //     pattern="/member/main" 
				.hasRole("OWNER")            //      access="isAuthenticated()"
				.antMatchers("/community/list")
				.permitAll()
				.antMatchers("/community/read/*")
				.permitAll()
				.antMatchers("/member/myReservation")
				.permitAll()
				.antMatchers("/member/myCommunity")
				.permitAll()
				.antMatchers("/member/**")
				.hasRole("MEMBER")
				.antMatchers("/community/**")
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
				//.failureForwardUrl("/loginForm?err")
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
		//adminProvider.withUser("admin").password("{noop}1234").authorities("ROLE_ADMIN");
		//auth.apply(adminProvider);
	}
	
	/* @Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.inMemoryAuthentication()
			.withUser("admin").password(new BCryptPasswordEncoder().encode("1234")).roles("ADMIN");
		
		auth.jdbcAuthentication().dataSource(dataSource).passwordEncoder(passwordEncoder())
			.usersByUsernameQuery("SELECT MEMBER_EMAIL, MEMBER_PASSWORD FROM MEMBER WHERE MEMBER_EMAIL=?")
			.authoritiesByUsernameQuery("select member_role from member where member_email = ?");
	} */
	
	@Bean
	public static BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	/* @Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	} */
	
	@Bean
	public HttpFirewall defaultHttpFirewall() {
		return new DefaultHttpFirewall();
	}
}
