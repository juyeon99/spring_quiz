package com.quiz.lesson05.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.lesson05.model.NewReview;

@Repository
public interface NewReviewDAO {

	public List<NewReview> selectReviewListById(int storeId);
	
}
