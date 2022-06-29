package com.quiz.lesson04.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson04.dao.SellerDAO;
import com.quiz.lesson04.model.Seller;

@Service
public class SellerBO {
	
	@Autowired
	private SellerDAO sellerDAO;

	public void addSeller(Seller seller) {
		sellerDAO.insertSeller(seller);
	}

	public Seller getLatestSeller() {
		return sellerDAO.selectLatestSeller();
	}
	
//	public Seller getSellerById(int id) {
	public Seller getSellerById(Integer id) {
		return sellerDAO.selectSellerById(id);
	}
	
}
