package kr.co.shoestore.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.co.shoestore.domain.Basket;

public interface BasketService {

	//장바구니 목록
	public List<Basket> basket(HttpServletRequest request);
	
	//장바구니 등록
	public void basketInsert(HttpServletRequest request);
		
	//장바구니 여부
	public String basketCheck(HttpServletRequest request);
}
