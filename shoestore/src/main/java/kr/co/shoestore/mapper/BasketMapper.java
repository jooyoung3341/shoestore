package kr.co.shoestore.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.shoestore.domain.Basket;

@Mapper
public interface BasketMapper {

	//장바구니 목록
	public List<Basket> basket(String id);
	
	//장바구니 등록
	public void basketInsert(Basket basket);
		
	//장바구니 상품 여부
	public String basketCheck(Map<String, Object> hashBasket);
}
