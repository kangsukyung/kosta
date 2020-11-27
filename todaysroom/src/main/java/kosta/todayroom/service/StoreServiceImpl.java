package kosta.todayroom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.todayroom.domain.Criteria;
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
	public List<StoreVO> StoreList(Criteria cri) {
		return mapper.getListWithPaging(cri);
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

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<StoreVO> StoreListLcategory(String lcategory, Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.StoreListLcategory(lcategory, cri);
	}

	@Override
	public List<StoreVO> StoreListScategory(String scategory, Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.StoreListScategory(scategory, cri);
	}

}
