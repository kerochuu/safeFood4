package com.ssafy.service;

import java.util.List;

import com.ssafy.dao.FoodDAO;
import com.ssafy.dao.FoodDAOImpl;
import com.ssafy.vo.Food;
import com.ssafy.vo.PageInfo;

public class FoodServiceImpl implements FoodService{
	private FoodDAO dao;
	private String[] allergys={"대두","땅콩","우유","게","새우","참치","연어","쑥","소고기","닭고기","돼지고기","복숭아","민들레","계란흰자"};
	
	public FoodServiceImpl() {
		dao = new FoodDAOImpl();
	}
	
	@Override
	public List<Food> searchAll() {
		return dao.searchAll();
	}

	@Override
	public Food search(int code) {
		Food food = dao.search(code);
		String al = "";
		for(String allergy : allergys) {
			if(food.getMaterial().contains(allergy)) {
				al.concat(allergy + "  ");
			}
		}
		return food;
	}

	@Override
	public List<Food> searchBest() {
		return dao.searchBest();
	}

	@Override
	public List<Food> searchBestIndex() {
		return dao.searchBestIndex();
	}

	

}
