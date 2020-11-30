package kosta.todayroom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class HomeController {
	
	@RequestMapping("/")
	public String WelcomePageRedirector(){
		return "redirect:/board/list";
	}
}
