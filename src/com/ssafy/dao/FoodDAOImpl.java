package com.ssafy.dao;

import java.util.LinkedList;
import java.util.List;

import com.ssafy.util.FoodSaxParser;
import com.ssafy.vo.Food;
import com.ssafy.vo.PageInfo;

public class FoodDAOImpl implements FoodDAO{
	private List<Food> foods;
	
	public FoodDAOImpl() {
		foods = new LinkedList<Food>();
		loadData();
	}

	@Override
	public void loadData() {
		FoodSaxParser parser = new FoodSaxParser();
		foods = parser.getFoods();
	}

	@Override
	public int foodCount() {
		return foods.size();
	}

	@Override
	public List<Food> searchAll() {
		return foods;

	}

	@Override
	public Food search(int code) {
		return null;
	}

	@Override
	public List<Food> searchBest() {
		return null;
	}

	@Override
	public List<Food> searchBestIndex() {
		return null;
	}

}
