package kosta.todayroom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.todayroom.domain.One_inquiryVO;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/oneInquriy")
public class OneInquiryController {
	
	@GetMapping("/register")
	public void registerForm(){}
	
	@PostMapping("/register")
	public String register(One_inquiryVO vo){
		vo.setOi_answer("");
		vo.setAdmin_seq(1);
		
		log.warn(vo);
		
		return "";
	}
	
}
