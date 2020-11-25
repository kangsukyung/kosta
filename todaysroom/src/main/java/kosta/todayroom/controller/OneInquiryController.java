package kosta.todayroom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.todayroom.domain.One_inquiryVO;
import kosta.todayroom.service.OneInquiryService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/oneInquriy")
public class OneInquiryController {
	@Setter(onMethod_=@Autowired)
	private OneInquiryService service;
	
	@GetMapping("/register")
	public void registerForm(){}
	
	@PostMapping("/register")
	public String register(One_inquiryVO vo){
		vo.setOi_answer("");
		vo.setAdmin_seq(1);
		
		log.warn(vo);
		
		service.register(vo);
		
		return "redirect:/oneInquriy/register";
	}
	
}
