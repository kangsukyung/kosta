package kosta.todayroom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.todayroom.domain.BasketVO;
import kosta.todayroom.mapper.BasketMapper;
import lombok.Setter;

@Service
public class BasketServiceImpl implements BasketService {

	@Setter(onMethod_= @Autowired)
	private BasketMapper mapper;
	
	@Override
	public List<BasketVO> list(int member_seq) {
		// TODO Auto-generated method stub
		return mapper.list(member_seq);
	}

	@Override
	public BasketVO read() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void register(List<BasketVO> list) {
		mapper.register(list);

	}

	@Override
	public int update(BasketVO basket) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int seq) {
		// TODO Auto-generated method stub
		return mapper.delete(seq);
	}

}
