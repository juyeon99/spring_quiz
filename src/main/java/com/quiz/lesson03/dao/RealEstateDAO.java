package com.quiz.lesson03.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson03.model.RealEstate;

@Repository
public interface RealEstateDAO {
	public RealEstate selectRealEstateById(int id);
	public List<RealEstate> selectRealEstateByRentPrice(@Param("rent_price") int rent_price);
	public List<RealEstate> selectRealEstateByAreaAndPrice(
			@Param("area") int area, @Param("price") int price);
}
