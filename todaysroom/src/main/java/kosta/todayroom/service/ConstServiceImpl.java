package kosta.todayroom.service;

import kosta.todayroom.domain.ConstVO;
import kosta.todayroom.mapper.ConstMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ConstServiceImpl implements ConstService {

	@Setter(onMethod_=@Autowired)
	ConstMapper mapper;
	
	@Override
	public String register(ConstVO constVO) {
		// TODO Auto-generated method stub
		int re = mapper.register(constVO);
		String result;
		
		if(re>0) {
			result="<script>alert('신청되었습니다.'); location.href='/const/register'</script>";
		}else {
			result="<script>alert('양식을 다시 확인해주세요.'); history.back();</script>";
		}
		
		return result;
	}

}
