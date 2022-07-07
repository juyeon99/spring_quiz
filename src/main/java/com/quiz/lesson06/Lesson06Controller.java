package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	// 즐겨찾기 데이터 추가 - AJAX로 들어오는 요청
	// (AJAX로 들어오는 요청은 View로 리턴하지 못하므로 반드시 @ResponseBody가 붙어있어야 하고, String을 리턴해야 한다.)
	// (AJAX => Map으로 리턴)
	// http://localhost:8080/lesson06/1/add_favorite
	@ResponseBody
	@RequestMapping("/1/add_favorite")
	public Map<String, Object> addFavorite(		// api의 응답 값이 json인 경우가 많음
			@RequestParam("name") String name,
			@RequestParam("url") String url) {
		// insert db
		favoriteBO.addFavorite(name, url);
		
		// 성공 여부를 map에 담음
		// {"result":"success"}
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		result.put("result_code", 1);
		
		// return map
		return result;
	}
//	@ResponseBody
//	@RequestMapping("/1/add_favorite")
//	public String addFavorite(
//			@RequestParam("name") String name,
//			@RequestParam("url") String url) {
//		
//		// insert into db
//		Favorite favorite = new Favorite();
//		favorite.setName(name);
//		favorite.setUrl(url);
//		favoriteBO.addFavorite(favorite);
//		
//		return "입력 성공";
//	}
	
	// http://localhost/lesson06/1/favorite_view
	@RequestMapping("/1/favorite_view")
	public String favoriteView(Model model) {
		// select from db
		List<Favorite> favList = favoriteBO.getFavList();
		model.addAttribute("favList", favList);
		
		return "lesson06/favoriteView";
	}
	
}
