package kr.co.shoestore.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.shoestore.domain.Shoes;
import kr.co.shoestore.mapper.ShoeStoreMapper;
import kr.co.shoestore.service.ShoeStoreService;

@Service
public class ShoeStoreServiceImpl implements ShoeStoreService {

	@Autowired
	private ShoeStoreMapper shoeStoreMapper;
	
	//신발 업로드
	@Override
	public void shoesRegister(MultipartHttpServletRequest request) {
		String shoesname = request.getParameter("shoesname");
		String color = request.getParameter("color");
		String contents = request.getParameter("contents");
		String price = request.getParameter("price");
		String bno = request.getParameter("bno");
		String kno = request.getParameter("kno");
		//현재날짜,시간 가져오기
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar time = Calendar.getInstance();
		String indate = format.format(time.getTime());
		
		//파일 업로드
		MultipartFile image = request.getFile("image");
		/*
			파일을 저장할 경로 만들기 파일은 절대경로로만 저장이 가능
			프로젝트 내의 shoesimage 디렉토리의 절대 경로를 만들기
		*/
		
		//getRealPath메서드는 webapp 폴더까지 그 이후 폴더를 지정
		String uploadPath = request.getRealPath("resources/shoesimage");
		//UUID : 중복되지 않은 고유한 키 값
		UUID uid = UUID.randomUUID();
		//getOriginalFilename 메서드는 업로드 한 파일의 실제 이름을 구함
		String filename = image.getOriginalFilename();
		//파일이름 중복 방지를 위해 파일이름 앞에 고유한 키값을 붙힘
		filename = uid + "_" + filename;
		//resources\\shoesimage\\업로드할 파일 이름
		String filepath = uploadPath + "\\" + filename;
		
		Shoes shoes = new Shoes();
		File file = new File(filepath);
		try {
			//파일 전송 - 파일 업로드
			image.transferTo(file);
			shoes.setShoename(shoesname);
			shoes.setColor(color);
			shoes.setContents(contents);
			shoes.setImage(filename);
			shoes.setPrice(Integer.parseInt(price));
			shoes.setIndate(indate);
			shoes.setBno(Integer.parseInt(bno));
			shoes.setKno(Integer.parseInt(kno));
			shoeStoreMapper.shoesRegister(shoes);
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}

	
}
