package kr.co.shoestore.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import kr.co.shoestore.domain.SecurityUser;
import kr.co.shoestore.domain.User;
import kr.co.shoestore.service.impl.UserServiceImpl;

public class AuthenticationProvider implements org.springframework.security.authentication.AuthenticationProvider {
	
	@Autowired
	private UserServiceImpl userServiceImpl;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String id = (String) authentication.getPrincipal();
		String pw = (String) authentication.getCredentials();
		
		SecurityUser user = (SecurityUser) userServiceImpl.loadUserByUsername(id);
		System.out.println(user.isEnabled());
	
		 if(!matchPassword(pw, user.getPassword())) {
	            throw new BadCredentialsException(id);
	        }
	 
	        if(!user.isEnabled()) {
	            throw new BadCredentialsException(id);
	        }
	        
	        return new UsernamePasswordAuthenticationToken(id, pw, user.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return true;
	}
	
	 private boolean matchPassword(String loginPw, String password) {
	        return passwordEncoder.matches(loginPw, password); 
	        		
	 }

}
