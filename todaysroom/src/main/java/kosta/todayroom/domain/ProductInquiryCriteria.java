package kosta.todayroom.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@ToString
@Setter
@Getter
public class ProductInquiryCriteria {

  private int pageNum;
  private int amount;
  
  private String type;
  private String keyword;
  
  private String result;

  public ProductInquiryCriteria() {
    this(1, 10);
  }
  
  public ProductInquiryCriteria(int pageNum, int amount) {
    this.pageNum = pageNum;
    this.amount = amount;
  }
  
  public String[] getTypeArr() {
    
    return type == null? new String[] {}: type.split("");
  }
  
  public String getListLink(){
	  UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
			  .queryParam("pageNum", this.pageNum)
			  .queryParam("amount", this.getAmount())
			  .queryParam("type", this.getType())
			  .queryParam("keyword", this.getKeyword())
			  .queryParam("result", this.getResult());
	  
	  return builder.toUriString();
  }
}
