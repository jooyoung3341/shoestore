package kr.co.shoestore.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.shoestore.domain.Shoes;

public interface ShoeStoreService {
	

	//신발 업로드
	public void shoesRegister(MultipartHttpServletRequest request);
}
