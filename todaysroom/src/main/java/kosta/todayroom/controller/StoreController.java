package kosta.todayroom.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kosta.todayroom.domain.Criteria;
import kosta.todayroom.domain.PageDTO;
import kosta.todayroom.domain.StoreVO;
import kosta.todayroom.service.StoreServiceImpl;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/store/*")
@Log4j
public class StoreController {

	@Setter(onMethod_= @Autowired)
	private StoreServiceImpl service;
	
	@GetMapping(value = "/list")
	public void StoreList(Criteria cri, Model model) {
		model.addAttribute("list", service.StoreList(cri));
		
		cri.setAmount(6);
		int total = service.getTotal(cri);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/read")
	public void StoreRead(@RequestParam("store_seq") int seq, Model model) {
		model.addAttribute("store", service.StoreRead(seq));
		model.addAttribute("list", service.ProductList(seq));
	}
	
	@ResponseBody
	@GetMapping(value = "/pages/{lcategory}/{page}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<StoreVO>> lcategoryList(
			@PathVariable("lcategory") String lcategory, @PathVariable("page") int page) {
		Criteria cri = new Criteria(page, 6);
		return new ResponseEntity<List<StoreVO>>(service.StoreListLcategory(lcategory, cri), HttpStatus.OK);
	}
}