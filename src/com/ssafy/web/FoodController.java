package com.ssafy.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafy.service.FoodService;
import com.ssafy.service.FoodServiceImpl;
import com.ssafy.vo.PageInfo;

public class FoodController {
	private static FoodController foodController = null;
	
	private FoodController() {
		
	}
	
	public static FoodController getInstance() {
		if(foodController == null) {
			foodController = new FoodController();
		}
		return foodController;
	}

	public PageInfo searchAll(HttpServletRequest request, HttpServletResponse response) {
		FoodService foodService = new FoodServiceImpl();
		request.setAttribute("foodList", foodService.searchAll());
		return new PageInfo(true, "foodXMLList.jsp");
	}
}
