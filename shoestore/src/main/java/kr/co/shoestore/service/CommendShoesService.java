package kr.co.shoestore.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.shoestore.domain.CommendShoes;

public interface CommendShoesService {

	//추천신발 목록 
	public List<CommendShoes> commendShoes();
	//추천신발 업로드 
	public void commend_register(MultipartHttpServletRequest request);
}
