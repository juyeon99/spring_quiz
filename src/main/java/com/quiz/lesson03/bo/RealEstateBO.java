package com.quiz.lesson03.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson03.dao.RealEstateDAO;
import com.quiz.lesson03.model.RealEstate;

@Service
public class RealEstateBO {

	@Autowired
	private RealEstateDAO realEstateDAO;
	
	public RealEstate getRealEstateById(int id) {
		return realEstateDAO.selectRealEstateById(id);	
	}
	
	public List<RealEstate> getRealEstateByRentPrice(int rent_price) {
		return realEstateDAO.selectRealEstateByRentPrice(rent_price);	
	}
	
	public List<RealEstate> getRealEstateByAreaAndPrice(int area, int price) {
		return realEstateDAO.selectRealEstateByAreaAndPrice(area, price);	
	}
}
