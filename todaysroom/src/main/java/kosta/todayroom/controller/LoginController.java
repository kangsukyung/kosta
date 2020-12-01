package kosta.todayroom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;


@Controller
public class LoginController {
	
	@GetMapping("/login")
	public void loginForm(){}
	
	@GetMapping("/logint")
	public String login(){
		return "/login";
	}
	
	
	@GetMapping("/logout")
	public void logout(){}
}
