package kosta.todayroom.mapper;

import java.util.List;

public interface SearchMapper {
	List<String> BoardTitleList(String keyword);
	List<String> StoreTitleList(String keyword);
	List<String> ContractorBnameList(String keyword);
}
