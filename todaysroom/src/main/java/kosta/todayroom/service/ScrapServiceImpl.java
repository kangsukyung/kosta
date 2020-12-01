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
	public List<ScrapVO> ScrapGetList() {
		log.info("--------- STORE ALL LIST ---------");
		
		//System.out.println("스크랩목록:     " + scrapMapper.ScrapGetList());
		
		return scrapMapper.ScrapGetList();

		
	}
	
	@Override
	public List<ScrapVO> ScrapAttachGetList(){
		log.info(" --------STORE ATTACH LIST -------");
		
		return scrapMapper.ScrapAttachGetList();
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
