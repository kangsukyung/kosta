package kosta.todayroom.service;

import java.util.List;

public interface SearchService {
	List<String> autoCompleteList(String keyword);
}
