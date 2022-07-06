package com.quiz.lesson06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson02.model.Store;
import com.quiz.lesson06.bo.FavoriteBO;
import com.quiz.lesson06.model.Favorite;

@RequestMapping("/lesson06")
@Controller
public class Lesson06Controller {
	
	@Autowired
	private FavoriteBO favoriteBO;
	
	// http://localhost:8080/lesson06/1/add_favorite_view
	@RequestMapping("/1/add_favorite_view")
	public String AddFavoriteView() {
		return "lesson06/addFavorite";
	}
	
	// 유저 추가
	// http://localhost:8080/lesson06/1/add_favorite
	@ResponseBody
	@RequestMapping("/1/add_favorite")
	public String addUser(
			@RequestParam("name") String name,
			@RequestParam("url") String url) {
		
		// insert db
		Favorite favorite = new Favorite();
		favorite.setName(name);
		favorite.setUrl(url);
		favoriteBO.addFavorite(favorite);
		
		return "입력 성공";
	}
	
	// http://localhost/lesson06/1/favorite_view
	@RequestMapping("/1/favorite_view")
	public String favoriteView(Model model) {
		// select from db
		List<Favorite> favList = favoriteBO.getFavList();
		model.addAttribute("favList", favList);
		
		return "lesson06/favoriteView";
	}
	
}
