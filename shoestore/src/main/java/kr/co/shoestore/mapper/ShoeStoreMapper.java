package kr.co.shoestore.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.shoestore.domain.Shoes;

@Mapper
public interface ShoeStoreMapper {
	
	//신발 업로드
	public Shoes shoesRegister(Shoes shoes);
	
	//신발 목록
	public List<Shoes> shoesSelect(Map<String, Object> hashShoes);
}
