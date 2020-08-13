package kr.co.shoestore.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.shoestore.domain.Shoes;

@Mapper
public interface ShoeStoreMapper {
	
	//신발 업로드
	public Shoes shoesRegister(Shoes shoes);
	
	//신발 전체 목록
	public List<Shoes> shoesSelect();
}
