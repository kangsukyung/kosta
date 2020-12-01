package kosta.todayroom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.todayroom.domain.ScrapVO;
import kosta.todayroom.mapper.ProductAttachMapper;
import kosta.todayroom.mapper.ProductMapper;
import kosta.todayroom.mapper.ScrapMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class ScrapServiceImpl implements ScrapService {
	
	
	@Setter(onMethod_ = @Autowired)
	private ScrapMapper scrapMapper;
	

	@Override
	public List<ScrapVO> ScrapgetList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ScrapVO> ScrapBangList() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void ScrapRegister(ScrapVO scrap) {
		
		log.info("--------- Scrap Register ---------" + scrap);
		
		scrapMapper.ScrapRegister(scrap);

	} //스크랩 등록

	

}