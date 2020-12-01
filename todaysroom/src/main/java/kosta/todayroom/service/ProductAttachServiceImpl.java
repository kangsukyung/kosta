package kosta.todayroom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.todayroom.domain.ProductAttachVO;
import kosta.todayroom.mapper.ProductAttachMapper;
import kosta.todayroom.mapper.StoreMapper;
import lombok.Setter;

@Service
public class ProductAttachServiceImpl implements ProductAttachService {

	@Setter(onMethod_= @Autowired)
	private ProductAttachMapper mapper;
	
	@Override
	public List<ProductAttachVO> findBySno(int store_seq) {
		// TODO Auto-generated method stub
		return mapper.findBySno(store_seq);
	}

	@Override
	public List<ProductAttachVO> ProductAttachList() {
		// TODO Auto-generated method stub
		return mapper.ProductAttachList();
	}

}
