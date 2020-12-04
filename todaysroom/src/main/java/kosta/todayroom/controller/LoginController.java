package kosta.todayroom.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
public class LoginController {
	
	@GetMapping("/login")
	public void loginForm(@Param("num") String num, Model model, HttpServletRequest request){
		String old_url = request.getHeader("referer");
		
		request.getSession().setAttribute("prevPage", old_url);
		
		try {
			if(num.equals("1")|| num.equals("2")){
				model.addAttribute("ratingNum", num);
			}
		} catch (Exception e) {
		}
	}
	

	
	@GetMapping("/logout")
	public void logout(){}
}
