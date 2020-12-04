package kosta.todayroom.service;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.todayroom.mapper.SearchMapper;
import lombok.Setter;

@Service
public class SearchServiceImpl implements SearchService {
	
	@Setter(onMethod_=@Autowired)
	SearchMapper mapper;

	@Override
	public List<String> autoCompleteList(String keyword) {
		// TODO Auto-generated method stub
		List<String> result = new LinkedList<>();
		
		keyword = "%" + keyword + "%";
		System.out.println(keyword);
		
		result.addAll(mapper.BoardTitleList(keyword));
		result.addAll(mapper.StoreTitleList(keyword));
		result.addAll(mapper.ContractorBnameList(keyword));
		
		return result;
	}

}
