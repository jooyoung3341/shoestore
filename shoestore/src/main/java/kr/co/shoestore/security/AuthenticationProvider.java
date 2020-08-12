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
	
	//인증절차
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		//로그인 폼에 입력한 아이디, 비밀번호 
		String id = (String) authentication.getPrincipal();
		String pw = (String) authentication.getCredentials();
		
		//DB에서 사용자 정보를 조회한 정보를 user에 담음
		SecurityUser user = (SecurityUser) userServiceImpl.loadUserByUsername(id);

		//화면에 입력한 비밀번호와 DB에서 조회한 비밀번호를 비교(DB에 비밀번호는 암호화되있음)
		 if(!matchPassword(pw, user.getPassword())) {
	            throw new BadCredentialsException(id);
	        }
		 //계정 활성화 여부 확인
		 if(!user.isEnabled()) {
	            throw new BadCredentialsException(id);
	        }
	     //위 두번의 인증절차가 통과 되면 아이디, 비밀번호, 권한 가지고 리턴
	     return new UsernamePasswordAuthenticationToken(id, pw, user.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return true;
	}
	
	// 시큐리티에서 제공하는 비밀번호 비교 메서드, 비밀번호가 맞으면 true 리턴
	 private boolean matchPassword(String loginPw, String password) {
	        return passwordEncoder.matches(loginPw, password); 
	 }

}
