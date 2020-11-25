package kosta.todayroom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kosta.todayroom.domain.ProductVO;
import kosta.todayroom.service.ProductItemService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product/*")
@AllArgsConstructor
public class ProductItemController {
	
	private ProductItemService productItemService;
	
	
	
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list");
		
		model.addAttribute("list", productItemService.ProductItemGetList());
	} //end list
	
	
	@PostMapping("/register")
	public String ProductRegister(ProductVO product, RedirectAttributes rttr) {
		
	
		
		log.info("Product Register : " +  product);
		
		productItemService.ProductItemRegister(product);
		
		//addFlashAttribute 일회성
		rttr.addFlashAttribute("result", product.getProduct_seq());
		
		return "redirect:/product/list";
	} //end register
	
	
	@GetMapping("/register")
	public void register(){
		
	}
	
	
	@GetMapping("/read")
	public void ProductRead(@RequestParam("product_seq") Long product_seq, Model model) {
		
		log.info("/read");
		model.addAttribute("store", productItemService.ProductItemRead(product_seq));
	}
	
	
	
	@PostMapping("/modify")
	public String ProductModify(ProductVO product, RedirectAttributes rttr) {
		log.info("modify:" + product);
		
		if(productItemService.ProductItemModify(product)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/product/list";
	}
	
	
	
	@GetMapping("/modify")
	public void modify(@RequestParam("product_seq") Long product_seq, Model model){
		log.info("modify");
		model.addAttribute("product", productItemService.ProductItemRead(product_seq));
		
	}
	
	/*@PostMapping("/remove")
	public String ProductRemove(@RequestParam("product_seq") Long product_seq, RedirectAttributes rttr){
		
		log.info("remove............." + product_seq);
		
		if(productItemService.ProductItemRemove(product_seq)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/product/list";
	}*/
	
	
	
	@GetMapping("/remove")
	public String ProductRemove(@RequestParam("product_seq") Long product_seq, Model model){
		log.info("remove");
		model.addAttribute("product", productItemService.ProductItemRemove(product_seq));
		
		return "redirect:/product/list";
	}
	
	/*@GetMapping("/remove")
	public void remove(){
		
	}*/
	
	

}
