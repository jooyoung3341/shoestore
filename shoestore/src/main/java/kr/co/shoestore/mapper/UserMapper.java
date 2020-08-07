package kr.co.shoestore.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.shoestore.domain.SecurityUser;
import kr.co.shoestore.domain.User;

@Mapper
public interface UserMapper {
	
	//아이디 중복 체크
	public String id_check(String id);
	
	//회원가입
	public int signup(User user);
	
	//로그인 시 사용자 정보 가져오기
	public SecurityUser readUser(String id);
	
	//회원가입 성공 시 권한 등록
	public void authority(User userAuthority);
}
