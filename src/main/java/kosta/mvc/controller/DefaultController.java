package kosta.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.mvc.domain.Camp;
import kosta.mvc.domain.Member;

//@Controller
//@RequestMapping("/default")
public class DefaultController {
	
	
	
	/* public String defaultAfterLogin(HttpServletRequest request) {
		if(request.isUserInRole("ROLE_MEMBER")) {
			return "redirect:/main";
		} else {
			return "redirect:/owner/campHome";
		}
	} */
	
	public String defaultAfterLogin(Authentication auth) throws AuthenticationException {		
		String id = auth.getName();
		System.out.println("default에서 id = " + id);
		
		if(id.contains("@")) {
			return "redirect:/main";
		} else {
			return "redirect:/owner/campHome";
		}
	}
}
