package kr.co.shoestore.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.shoestore.domain.CommendShoes;
import kr.co.shoestore.domain.SecurityUser;
import kr.co.shoestore.service.CommendShoesService;

@Controller
public class CommendShoesController {

	@Autowired
	private CommendShoesService commendShoesService;
	
	//신발추천 목록
	@RequestMapping(value="commendshoes", method=RequestMethod.GET)
	public String shoesBoard(Model model) {
		List<CommendShoes> commendShoesList = commendShoesService.commendShoes();
		model.addAttribute("commendShoesList" , commendShoesList);
		return "commendshoes/commendShoes";
	}
	//신발추천 등록										
	@RequestMapping(value="commendshoesregister", method=RequestMethod.GET)
	public String commend_register() {
		return "commendshoes/commendShoesRegister";
	}
	
	//신발추천 등록
	@RequestMapping(value="commendShoesRegister", method=RequestMethod.POST)
	public String commend_register(MultipartHttpServletRequest request) {
		commendShoesService.commend_register(request);
		return "redirect:/commendshoes";
	}
}
