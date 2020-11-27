<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<input type="hidden" name='product_seq' value="${product.product_seq }">
								<li><article class="selling-option-item" id="${status.count }">
										<h1 class="selling-option-item__production">${list[0].product_name }</h1>
										<button class="selling-option-item__delete" type="button"
											aria-label="ì­ì ">
											<svg width="12" height="12" viewBox="0 0 12 12"
												fill="currentColor" preserveAspectRatio="xMidYMid meet">
											<path fill-rule="nonzero"
													d="M6 4.6L10.3.3l1.4 1.4L7.4 6l4.3 4.3-1.4 1.4L6 7.4l-4.3 4.3-1.4-1.4L4.6 6 .3 1.7 1.7.3 6 4.6z"></path></svg>
										</button>
										<div class="selling-option-item__controls"
											id="${status.count }">
											<div class="selling-option-item__quantity">
												<div class="input-group select-input option-count-input">
													<select class="form-control" id="${status.count }"><option
															value="0">ìë</option>
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
														<option value="5">5</option>
														<option value="6">6</option>
														<option value="7">7</option>
														<option value="8">8</option>
													</select>
												</div>
											</div>
											<p class="selling-option-item__price">
												<span class="selling-option-item__price__number"
													id="${status.count }">0</span>ì <span
													class="product-one-price" hidden="">${list.product_price }</span>
											</p>
										</div>
									</article></li>