package kosta.todayroom.controller;

import java.security.Principal;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.todayroom.domain.ContractorVO;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/constractor/*")
public class ConstractorController {

	
	@GetMapping("/register")
	public void registerForm(Principal pricipal){
	}
	
	@PostMapping("/register")
	public String register(ContractorVO contractorVO){

		return "";
	}
}
