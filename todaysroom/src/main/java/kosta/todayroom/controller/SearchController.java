package kosta.todayroom.controller;

import java.util.LinkedList;
import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/search/*")
public class SearchController {
	
	@RequestMapping(value="/autocompletelist", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<String> autocompletelist(String keyword){
		System.out.println(keyword);
		
		List<String> test = new LinkedList<>();
		
		test.add("test1");
		test.add("test2");
		test.add("test3");
		
		return test;
	}
	
}
