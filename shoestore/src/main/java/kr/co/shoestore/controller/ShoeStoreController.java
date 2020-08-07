package kr.co.shoestore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ShoeStoreController {

	@RequestMapping(value="shoestore", method=RequestMethod.GET)
	public String shoestore() {
		return "shoestore/shoestore";
	}
}
