package kr.co.shoestore.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.shoestore.domain.Shoes;
import kr.co.shoestore.service.ShoeStoreService;

@Controller
public class ShoeStoreController {
	
	@Autowired
	private ShoeStoreService shoeStoreService;

	//신발 목록 이동
	@RequestMapping(value="shoestore", method=RequestMethod.GET)
	public String shoestore(Model model, HttpServletRequest request) {
		List<Shoes> shoesList = shoeStoreService.shoesSelect(request);
		model.addAttribute("shoesList", shoesList);
		return "shoestore/shoestore";
	}
	
	//신발 업로드 이동
	@RequestMapping(value="shoesRegister", method=RequestMethod.GET)
	public String shoestoreRegister() {

		return "shoestore/shoesRegister";
	}
	
	//신발 업로드
	@RequestMapping(value="shoesRegister", method=RequestMethod.POST)
	public String shoestoreRegister(MultipartHttpServletRequest request, RedirectAttributes attr) {
		shoeStoreService.shoesRegister(request);
		attr.addFlashAttribute("shoesRegister_msg", "신발 업로드 완료 !");
		return "redirect:/shoestore";
	}
	
	//신발 조건 조회 
	@RequestMapping(value="shoestore/shoesselect", method=RequestMethod.GET)
	@ResponseBody
	public List<Shoes> shoeSelect(HttpServletRequest request){
		return shoeStoreService.shoesSelect(request);
	}
	
	//신발 상세보기
	@RequestMapping(value="shoesDetail", method=RequestMethod.GET)
	public String shoesDetail(HttpServletRequest request, Model model) {
		Shoes shoes = shoeStoreService.shoesDetail(request);
		model.addAttribute("shoes", shoes);
		
		return "shoestore/shoesDetail";  
	}
	

}
