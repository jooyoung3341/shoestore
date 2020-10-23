package kr.co.shoestore.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.shoestore.domain.CommendShoes;

@Mapper
public interface CommendShoesMapper {
	
	//신발추천 게시글 작성
	public CommendShoes commend_register(CommendShoes commendShoes);
	
	public List<CommendShoes> commendShoes();

}
