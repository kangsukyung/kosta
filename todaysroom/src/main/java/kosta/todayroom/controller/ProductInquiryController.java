package kosta.todayroom.controller;

import kosta.todayroom.domain.ProductInquiryVO;
import kosta.todayroom.service.ProductInquiryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/productInquiry/*")
public class ProductInquiryController {
	
	@Setter(onMethod_=@Autowired)
	ProductInquiryService service;
	
	@GetMapping("/read/{pi_seq}")
	public void ProductInquiryRead(@PathVariable int pi_seq, Model model){
		ProductInquiryVO result = service.read(pi_seq);
		
		model.addAttribute("result",result);
		
		System.out.println(result);
	}
	
	@GetMapping("/list")
	public void ProductInquiryList(Model model){
		model.addAttribute("list", service.list());		
	}
	
	@GetMapping("/register")
	public void ProductInquiryRegister(){}
	
	@PostMapping(value = "/register", produces="text/plain; charset=utf-8")
	public @ResponseBody String ProductInquiryRegister(ProductInquiryVO product_inquiryVO){
//		model.addAttribute("result", service.register(product_inquiryVO));
		return ""+service.register(product_inquiryVO);
	}
	
	@PostMapping("/modify")
	public void ProductInquiryModify(ProductInquiryVO product_inquiryVO, Model model){
		model.addAttribute("result", service.modify(product_inquiryVO));
	}
	
	@PostMapping("/remove/{pi_seq}")
	public void ProductInquiryRemove(@PathVariable int pi_seq, Model model){
		model.addAttribute("result", service.remove(pi_seq));
	}
}
