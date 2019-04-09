package com.ssafy.service;

import java.util.List;

import com.ssafy.vo.Food;

public interface FoodService {
	List<Food> searchAll();
	
	Food search(int code);
	
	List<Food> searchBest();
	
	List<Food> searchBestIndex();
}
