package kr.co.shoestore.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.shoestore.domain.Basket;
import kr.co.shoestore.mapper.BasketMapper;
import kr.co.shoestore.service.BasketService;

@Service
public class BasketServiceImpl implements BasketService {

	@Autowired
	private BasketMapper basketMapper;
	
	//장바구니 목록
	@Override
	public List<Basket> basket(HttpServletRequest request) {
		String id = request.getParameter("id");
		
		return basketMapper.basket(id);
	}

	
	//장바구니 등록
	@Override
	public void basketInsert(HttpServletRequest request) {
		String sno = request.getParameter("sno");
		String id = request.getParameter("id");
		
		Basket basket = new Basket();
		basket.setId(id);
		basket.setSno(Integer.parseInt(sno));
		basketMapper.basketInsert(basket);
	}

	//장바구니 여부 확인
	@Override
	public String basketCheck(HttpServletRequest request) {
		String id = request.getParameter("id");
		String sno = request.getParameter("sno");
		System.out.println(id);
		System.out.println(sno);
		Map<String, Object> hashBasket = new HashMap<String,Object>();
		hashBasket.put("id", id);
		hashBasket.put("sno", sno);
		return basketMapper.basketCheck(hashBasket);
	}

	
}
