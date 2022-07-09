package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.FavoriteBO;
import com.quiz.lesson06.model.Favorite;

// lesson06 quiz01,02
@RequestMapping("/lesson06")
@Controller
public class Lesson06Controller {
	
	@Autowired
	private FavoriteBO favoriteBO;
	
	// http://localhost:8080/lesson06/add_favorite_view
	@RequestMapping("/add_favorite_view")
	public String AddFavoriteView() {
		return "lesson06/addFavorite";
	}
	
	// 즐겨찾기 데이터 추가 - AJAX로 들어오는 요청
	// (AJAX로 들어오는 요청은 View로 리턴하지 못하므로 반드시 @ResponseBody가 붙어있어야 하고, String을 리턴해야 한다.)
	// (AJAX => Map으로 리턴)
	// http://localhost:8080/lesson06/add_favorite
	@ResponseBody
	@RequestMapping("/add_favorite")
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
//	@RequestMapping("/add_favorite")
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
	
	// http://localhost/lesson06/favorite_view
	@RequestMapping("/favorite_view")
	public String favoriteView(Model model) {
		// select from db
		List<Favorite> favList = favoriteBO.getFavList();
		model.addAttribute("favList", favList);
		
		return "lesson06/favoriteView";
	}
	
	
	// Method 1
//	@GetMapping("/is_duplication")
//	@ResponseBody
//	public Map<String, Boolean> isDuplication(
//			@RequestParam("url") String url){
//		
//		boolean isDuplication = favoriteBO.existingUrl(url);
//		
//		Map<String, Boolean> result = new HashMap<>();
//		result.put("is_duplication", isDuplication);
//		
//		return result;
//	}
	
	// Method 2
	@PostMapping("/is_duplication")
	@ResponseBody
	public Map<String, Boolean> isDuplicationUrl(
			@RequestParam("url") String url) {
		
		// 결과를 map -> JSON string
		Map<String, Boolean> result = new HashMap<>();
		result.put("is_duplication", false);
		
		// db select -> 중복 확인
		Favorite favorite = favoriteBO.getFavoriteByUrl(url);
		if (favorite != null) {
			// 중복일 때
			result.put("is_duplication", true);
		}

		return result;
	}
	
	
	// 삭제
	// AJAX 요청 - @ResponseBody returns Map
	@ResponseBody
	@PostMapping("/delete_favorite")
	public Map<String, Object> deleteFavorite(
			@RequestParam("id") int id){
		// delete by id
		int deleteRow = favoriteBO.deleteFavoriteById(id);
		
		Map<String, Object> result = new HashMap<>();
		if(deleteRow > 0) {
			result.put("result", "success");
		} else {
			result.put("result", "failure");
		}
		
		return result;
	}
	
}
