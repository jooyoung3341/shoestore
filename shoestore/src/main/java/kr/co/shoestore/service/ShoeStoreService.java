package kr.co.shoestore.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.shoestore.domain.Basket;
import kr.co.shoestore.domain.Shoes;

public interface ShoeStoreService {
	
	//신발 업로드
	public void shoesRegister(MultipartHttpServletRequest request);
	
	//신발 전체 목록
	public List<Shoes> shoesSelect(HttpServletRequest request);
	
	//신발 상세보기
	public Shoes shoesDetail(HttpServletRequest request);
	
	
}
