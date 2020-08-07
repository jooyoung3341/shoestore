package kr.co.shoestore.service.impl;

import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.shoestore.domain.SecurityUser;
import kr.co.shoestore.domain.User;
import kr.co.shoestore.mapper.UserMapper;
import kr.co.shoestore.service.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	
	//아이디 중복 체크
	@Override
	public String id_check(HttpServletRequest request) {
		String id = request.getParameter("id");
		return userMapper.id_check(id);
	}

	//회원가입
	@Override
	public boolean signup(HttpServletRequest request) {
		boolean result = false;
		String id = request.getParameter("id");
		
		String address = request.getParameter("address");
		/*
		 * BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		 */
		//암호화 전 비밀번호
		String rawPw = request.getParameter("pw");
		//암호화 후 비밀번호
		String pw = passwordEncoder.encode(rawPw);
		System.out.println(id);
		User user = new User();
		user.setId(id);
		user.setPw(pw);
		user.setAddress(address);
		
		int r = userMapper.signup(user);
		String authority_name = request.getParameter("authority_name");
		if(r > 0) {
			//회원가입 성공 시 권한 등록
			User userAuthority = new User();
			userAuthority.setAuthority_name(authority_name);
			userAuthority.setId(id);
			userMapper.authority(userAuthority);
			result = true;
		}
		return result;
	}

	//사용자 정보 가져오기
	  @Override
	  public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		  SecurityUser user = userMapper.readUser(id);
	  
	  
	  if(user == null) { 
		  throw new UsernameNotFoundException(id); 
		  }
	  //UsernameNotFoundException 

	  return user; 
	  }

	  


}
