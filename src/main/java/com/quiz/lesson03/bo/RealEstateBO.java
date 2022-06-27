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

	public int addRealEstate(RealEstate re) {
		return realEstateDAO.insertRealEstate(re);
	}

	public int addRealEstateAsField(int realtorId, String address, int area, String type, int price, Integer rentPrice) {
		return realEstateDAO.insertRealEstateAsField(realtorId, address, area, type, price, rentPrice);
	}
	
	public int updateRealEstateById(int id, int price) {
		return realEstateDAO.updateRealEstateById(id, price);
	}

	public int deleteRealEstateById(int id) {
		return realEstateDAO.deleteRealEstateById(id);
	}
}
