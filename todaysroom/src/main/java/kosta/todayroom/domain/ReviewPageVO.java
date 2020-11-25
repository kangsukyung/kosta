package kosta.todayroom.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class ReviewPageVO {

  private int replyCnt;
  private List<ReviewVO> reviewList;
}
