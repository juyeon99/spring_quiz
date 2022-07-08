package com.quiz.lesson06.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson06.model.Favorite;

@Repository
public interface FavoriteDAO {

//	public void insertFavorite(Favorite favorite);
	public void insertFavorite(
			@Param("name") String name,
			@Param("url") String url);

	
	public List<Favorite> selectFavList();

	
//	public boolean existingUrl(String url);
	public Favorite selectFavoriteByUrl(String url);
	
	
	public int deleteFavoriteById(int id);
}
