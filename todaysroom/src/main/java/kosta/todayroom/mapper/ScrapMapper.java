package kosta.todayroom.mapper;

import java.util.List;

import kosta.todayroom.domain.ScrapVO;

public interface ScrapMapper {
	
	
	//스크랩목록
	public List<ScrapVO> ScrapgetList();
	
	//스크랩목록-방들이만
	public List<ScrapVO> ScrapBangList();
	
	public void ScrapRegister(ScrapVO scrap);

}
