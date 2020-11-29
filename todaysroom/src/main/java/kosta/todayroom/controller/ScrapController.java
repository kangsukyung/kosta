package kosta.todayroom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/scrap/*")
@AllArgsConstructor
public class ScrapController {
	
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list");
		
		
	} //end list

}
