package kosta.todayroom.controller;

import kosta.todayroom.domain.ConstVO;
import kosta.todayroom.service.ConstService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/const/*")
public class ConstController {
	
	@Setter(onMethod_=@Autowired)
	ConstService service;
	
	@GetMapping("/register")
	public void register(){}
	
	@PostMapping(value="/register", produces="text/plain; charset=utf-8")
	public @ResponseBody String register(ConstVO constVO){
		return ""+service.register(constVO);
	}
}
