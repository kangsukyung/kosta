package kosta.todayroom.controller;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kosta.todayroom.service.SearchService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/search/*")
public class SearchController {
	
	@Setter(onMethod_=@Autowired)
	SearchService service;
	
	@RequestMapping(value="/autocompletelist", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<String> autocompletelist(String keyword){
		System.out.println("자동완성 키워드 : "+keyword);
		
		return service.autoCompleteList(keyword);
	}
	
}
