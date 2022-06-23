package com.quiz.lesson02.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson02.dao.StoreDAO;
import com.quiz.lesson02.model.Store;

@Service
public class StoreBO {	// controller는 DAO로 바로 가면 X, BO를 거쳐서 가야됨
	
	@Autowired
	private StoreDAO storeDAO;
	
	public List<Store> getStoreList(){
		return storeDAO.selectStoreList();
	}
	
}
