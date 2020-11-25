package kosta.todayroom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kosta.todayroom.domain.ProductVO;
import kosta.todayroom.domain.StoreVO;
import kosta.todayroom.service.ProductService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/storeProduct/*")
@AllArgsConstructor
public class ProductController {
	
	private ProductService productService;
	
	
	
	@PostMapping("/register")
	public String ProductRegister(StoreVO store, RedirectAttributes rttr) {
		
		log.info("Product Register : " +  store);
		
		productService.ProductRegister(store);
		
		//addFlashAttribute 일회성
		rttr.addFlashAttribute("result", store.getStore_seq());
		
		return "redirect:/product/list";
	} //end register
	
	
	@GetMapping("/register")
	public void register(){
		
	}
	
	
	@GetMapping("/read")
	public void ProductRead(@RequestParam("store_seq") Long store_seq, Model model) {
		
		log.info("/read");
		model.addAttribute("store", productService.ProductRead(store_seq));
	}
	
	@PostMapping("/modify")
	public String ProductModify(StoreVO store, RedirectAttributes rttr) {
		log.info("modify:" + store);
		
		if(productService.ProductModify(store)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/product/list";
	}
	
	@PostMapping("/remove")
	public String ProductRemove(@RequestParam("store_seq") Long store_seq, RedirectAttributes rttr){
		
		log.info("remove............." + store_seq);
		
		if(productService.ProductRemove(store_seq)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/product/list";
	}
	

}
