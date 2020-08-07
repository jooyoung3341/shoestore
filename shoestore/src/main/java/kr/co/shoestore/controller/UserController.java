package kr.co.shoestore.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.shoestore.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	//로그인 이동
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login() {
		return "user/login";
	}
	
	//아이디 중복 체크
	@RequestMapping(value="user/id_check", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> id_check(HttpServletRequest request) {
		String id = userService.id_check(request);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", id == null);
		return map;
	}
	
	//회원가입
	@RequestMapping(value="user/signup", method=RequestMethod.POST)
	@ResponseBody
	public void signup(HttpServletRequest request) {
		userService.signup(request);
	}
}
