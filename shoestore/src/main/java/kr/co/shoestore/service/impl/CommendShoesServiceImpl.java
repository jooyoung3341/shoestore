package kr.co.shoestore.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.shoestore.domain.CommendShoes;
import kr.co.shoestore.mapper.CommendShoesMapper;
import kr.co.shoestore.service.CommendShoesService;

@Service
public class CommendShoesServiceImpl implements CommendShoesService {

	@Autowired
	private CommendShoesMapper commendShoesMapper;

	@Override
	public void commend_register(MultipartHttpServletRequest request) {
		String id = request.getParameter("id");
		String contents = request.getParameter("contents");
		String title = request.getParameter("title");
		
		//현재날짜,시간 가져오기
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar time = Calendar.getInstance();
		String insert_date = format.format(time.getTime());
		
		MultipartFile image = request.getFile("image");

		String uploadPath = request.getRealPath("resources/commendimage");

		UUID uid = UUID.randomUUID();

		String filename = image.getOriginalFilename();

		filename = uid + "_" + filename;

		String filepath = uploadPath + "\\" + filename;
		CommendShoes commendShoes = new CommendShoes();
		File file = new File(filepath);
		try {
			image.transferTo(file);
			commendShoes.setContents(contents);
			commendShoes.setId(id);
			commendShoes.setImage(filename);
			commendShoes.setInsert_date(insert_date);
			commendShoes.setTitle(title);
			commendShoesMapper.commend_register(commendShoes);
			} catch (Exception e) {
				System.out.println(e);
		}
	}

	@Override
	public List<CommendShoes> commendShoes() {
		
		return commendShoesMapper.commendShoes();
	}
}
