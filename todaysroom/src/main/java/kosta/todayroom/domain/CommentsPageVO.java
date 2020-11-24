package kosta.todayroom.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class CommentsPageVO {

  private int replyCnt;
  private List<CommentsVO> commentsList;
}
