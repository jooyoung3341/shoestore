package kr.co.shoestore.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.userdetails.UserDetailsService;

import kr.co.shoestore.domain.User;


public interface UserService extends UserDetailsService{
	
	//아이디 중복 체크
	public String id_check(HttpServletRequest request);

	//회원가입
	public boolean signup(HttpServletRequest request);
}
