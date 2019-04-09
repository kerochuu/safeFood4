package com.ssafy.dao;

import java.util.List;

import com.ssafy.vo.Food;
import com.ssafy.vo.PageInfo;

public interface FoodDAO {
	void loadData();
	
	int foodCount();
	
	List<Food> searchAll();
	
	Food search(int code);
	
	List<Food> searchBest();
	
	List<Food> searchBestIndex();
}
