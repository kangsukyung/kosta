package kosta.todayroom.service;

import java.util.List;

import kosta.todayroom.domain.ScrapVO;

public interface ScrapService {
	
	
	//스크랩목록
	public List<ScrapVO> ScrapGetList(int member_seq);
	public List<ScrapVO> ScrapAttachGetList(int member_seq);
		
	//스크랩목록-방들이만
	public List<ScrapVO> ScrapBangList(int member_seq);
	
	//스크랩목록-노하우만
	public List<ScrapVO> ScrapKnowList(int member_seq);
	
	//스크랩등록
	public void ScrapRegister(ScrapVO scrap);
	
	/*//닉네임보기
	public void ScrapNickname(int member_seq);*/
	
	//삭제
	public boolean ScrapRemove(Long scrap_seq);

}
