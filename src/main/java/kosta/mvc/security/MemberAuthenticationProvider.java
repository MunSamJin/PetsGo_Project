package kosta.mvc.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.authentication.configurers.provisioning.InMemoryUserDetailsManagerConfigurer;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kosta.mvc.domain.Camp;
import kosta.mvc.domain.Member;
import kosta.mvc.repository.CampRepository;
import kosta.mvc.repository.MemberRepository;

@Service 
public class MemberAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	private MemberRepository memberRep;
	
	@Autowired
	private CampRepository campRep;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	//InMemoryUserDetailsManagerConfigurer adminProvider = new InMemoryUserDetailsManagerConfigurer();

	@Override
	public Authentication authenticate(Authentication auth) throws AuthenticationException {
		//인증됐다면, 인수로 받는 user정보를 가지고 디비에 존재하는지 체크
		
		//Member
		String id = auth.getName();
		
		
		/* if(id == "admin") {
			System.out.println("provider admin id = " + id);
			
		} */
		
		if(id.contains("@")) {
			Member member = memberRep.findMember(id);
			
			if(member == null){
				throw new UsernameNotFoundException(id + "는 없는 회원입니다."); //spring exception
			}
			
			//비밀번호 비교
			String password = (String)auth.getCredentials(); //비밀번호		
			
			if(!passwordEncoder.matches(password, member.getMemberPassword())){
				throw new BadCredentialsException("패스워드 오류입니다.");
			}
			
			List<SimpleGrantedAuthority> authList = new ArrayList<SimpleGrantedAuthority>();
			authList.add( new SimpleGrantedAuthority(member.getMemberRole()));
		    
			return new UsernamePasswordAuthenticationToken(member, null, authList);
		
		} else {
		
			//Camp
			Camp camp = campRep.findByCampRegNo(id);
			//System.out.println("rep 다녀온 provider camp = " + camp.getCampRegNo());
			
			if(camp == null){
				throw new UsernameNotFoundException(id + "는 등록되지 않은 사업자입니다."); //spring exception
			}
			
			//비밀번호 비교
			String password = (String)auth.getCredentials(); //비밀번호		
			
			/*if(!passwordEncoder.matches(password, camp.getCampPassword())){
				throw new BadCredentialsException("패스워드 오류입니다.");
			}*/
		
			List<SimpleGrantedAuthority> authList = new ArrayList<SimpleGrantedAuthority>();
			authList.add( new SimpleGrantedAuthority(camp.getCampRole()));
		    
			return new UsernamePasswordAuthenticationToken(camp, null, authList);
		}
	}

	/**
	 * 해당 타입의 Authentication 객체를 이용해서 인증 처리를 할 수 있는지 여부를 리턴해주는 메소드
	 * */
	@Override
	public boolean supports(Class<?> authentication) {
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}
}
