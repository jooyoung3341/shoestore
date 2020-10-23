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

import kr.co.shoestore.domain.Basket;
import kr.co.shoestore.service.BasketService;

@Controller
public class BasketController {

	@Autowired
	private BasketService basketService;
	
	@RequestMapping(value="basket", method=RequestMethod.GET)
	public String basket(HttpServletRequest request, Model model) {
		List<Basket> basketList = basketService.basket(request);
		model.addAttribute("basketList", basketList);
		return "basket/basket";
	}
	
	//장바구니 등록
	@RequestMapping(value="basket/basketinsert", method=RequestMethod.GET)
	@ResponseBody
	public void basketInsert(HttpServletRequest request){
		basketService.basketInsert(request);
	}
	
	//장바구니 여부 확인
	@RequestMapping(value="basket/basketcheck", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> basketCheck(HttpServletRequest request){
		String basketCheck = basketService.basketCheck(request);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", basketCheck == null);
		return map;
	}
}
