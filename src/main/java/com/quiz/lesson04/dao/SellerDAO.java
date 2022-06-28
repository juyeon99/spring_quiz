package com.quiz.lesson04.dao;

import org.springframework.stereotype.Repository;

import com.quiz.lesson04.model.Seller;

@Repository
public interface SellerDAO {

	public void insertSeller(Seller seller);

	public Seller selectLatestSeller();

	public Seller selectSellerById(int id);

}
