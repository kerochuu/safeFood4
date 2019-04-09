package com.ssafy.util;

import java.util.List;
import java.util.Map;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import com.ssafy.vo.Food;

public class FoodSaxParser {
	private String nutritionFilePath = this.getClass().getResource("/").getPath()+"/FoodNutritionInfo.xml";
	private String foodFilePath = this.getClass().getResource("/").getPath()+"/foodInfo.xml";
	private StringBuilder xml;
	private List<Food> foods;
	
	public FoodSaxParser() {
		loadData();
	}
	
	void loadData() {
		SAXParserFactory factory = SAXParserFactory.newInstance();
		try {
			SAXParser parser = factory.newSAXParser();
			FoodSAXHandler foodHandler = new FoodSAXHandler();
			FoodNutritionSAXHandler nutritionHandler = new FoodNutritionSAXHandler();
			parser.parse(foodFilePath, foodHandler);
			parser.parse(nutritionFilePath, nutritionHandler);
			Map<String, Food> foodMap = foodHandler.getMap();
			foods = nutritionHandler.getList();
			Food find;
			for(Food food : foods) {
				find = foodMap.get(food.getName());
				if(find != null) {
					food.setCode(find.getCode());
					food.setName(find.getName());
					food.setMaker(find.getMaker());
					food.setMaterial(find.getMaterial());
					food.setImg(find.getImg());
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<Food> getFoods(){
		return foods;
	}
	
	public void setFoods(List<Food> foods) {
		this.foods = foods;
	}
}
