package kr.co.shoestore.domain;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;

/*
	시큐리티 사용자 정보를 담을 도메인
*/

public class SecurityUser  implements UserDetails {

	private String id;
	private String pw;
	private String authority_name;
	private boolean enabled;
	
	//사용자 권한 목록
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
		auth.add(new SimpleGrantedAuthority(authority_name));
		return null;
	}
	
	@Override
	public String getPassword() {
		return pw;
	}
	@Override
	public String getUsername() {
		return id;
	}
	@Override
	public boolean isAccountNonExpired() {
		return false;
	}
	@Override
	public boolean isAccountNonLocked() {
		return false;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		return false;
	}
	@Override
	public boolean isEnabled() {
		return enabled;
	}



}
