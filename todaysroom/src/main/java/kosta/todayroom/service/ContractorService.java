package kosta.todayroom.service;


import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import kosta.todayroom.domain.ContractorVO;
import kosta.todayroom.domain.Criteria;

public interface ContractorService {
	public int register(ContractorVO vo);
	public LinkedHashMap<Integer, HashMap<String, String>> list(Criteria cri);
	public int totalCount();
}
