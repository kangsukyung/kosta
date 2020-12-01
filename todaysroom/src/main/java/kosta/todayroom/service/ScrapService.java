package kosta.todayroom.service;

import java.util.List;

import kosta.todayroom.domain.ScrapVO;

public interface ScrapService {
	
	
	//스크랩목록
	public List<ScrapVO> ScrapGetList();
	public List<ScrapVO> ScrapAttachGetList();
		
	//스크랩목록-방들이만
	public List<ScrapVO> ScrapBangList();
	
	//스크랩등록
	public void ScrapRegister(ScrapVO scrap);

}
