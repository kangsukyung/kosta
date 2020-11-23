package kosta.todayroom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.todayroom.domain.ProductVO;
import kosta.todayroom.domain.StoreVO;
import kosta.todayroom.mapper.StoreMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class StoreServiceImpl implements StoreService {

	@Setter(onMethod_= @Autowired)
	private StoreMapper mapper;
	
	@Override
	public List<StoreVO> StoreList() {
		return mapper.StoreList();
	}

	@Override
	public StoreVO StoreRead(int seq) {
		// TODO Auto-generated method stub
		return mapper.StoreRead(seq);
	}

	@Override
	public List<ProductVO> ProductList(int seq) {
		// TODO Auto-generated method stub
		return mapper.ProductList(seq);
	}

}
