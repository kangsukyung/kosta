package kosta.todayroom.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kosta.todayroom.domain.BasketVO;
import kosta.todayroom.service.BasketServiceImpl;
import lombok.Setter;


@Controller
@RequestMapping("/basket/*")
public class BasketController {

	@Setter(onMethod_= @Autowired)
	private BasketServiceImpl service;
	
	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("list", service.list());
	}
	
	@PostMapping(value="/register")
	public String register(@RequestParam(value = "product_seq", required=true) List<Integer> seq_list, RedirectAttributes rttr) {
		//product_seq list를 파라미터로 가져옴
		//register는 basketList를 Create함
		
		//register의 파라미터를 basketList가 아닌 product_seq list로 바꾸어야 할 듯
		System.out.println("1");
		System.out.println(seq_list);
		
		List<BasketVO> basketList = new ArrayList<>();
		if(seq_list != null) {
			for(int i=0; i<seq_list.size(); i++) {
				System.out.println("2");
				basketList.add(new BasketVO());
				basketList.get(i).setProduct_seq(seq_list.get(i));		
			}			
		}
		System.out.println("3");
		service.register(basketList);
		
		rttr.addFlashAttribute("basketList", basketList);
		
		return "redirect:/basket/list";
	}
	
	@ResponseBody
	@DeleteMapping(value = "/{basket_seq}", produces = {MediaType.TEXT_PLAIN_VALUE} )
	public ResponseEntity<String> StoreRemove(@PathVariable("basket_seq") int seq) {
		
		return service.delete(seq) == 1? 
				new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
