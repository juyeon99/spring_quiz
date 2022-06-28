package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.model.Seller;

@RequestMapping("/lesson04")
@Controller
public class SellerController {
	
	@Autowired
	public SellerBO sellerBO;
	
	// http://localhost:8080/lesson04/default_view
	@RequestMapping(path = "/default_view", method = RequestMethod.GET)
	public String defaultView() {
		return "lesson04/addSeller";
	}
	
	// http://localhost:8080/lesson04/add_seller
	@PostMapping("/add_seller")
	public String addUser(
			@RequestParam("nickname") String nickname,
			@RequestParam(value="pfp", required=false) String pfp,
			@RequestParam("temperature") double temperature) {
		
		Seller seller = new Seller();
		seller.setNickname(nickname);
		seller.setProfileImageUrl(pfp);
		seller.setTemperature(temperature);
		sellerBO.addSeller(seller);
		
		return "lesson04/afterAddSeller";
	}
	
	// http://localhost:8080/lesson04/seller_info
	@GetMapping("/seller_info")
	public String sellerInfo(Model model) {
		Seller seller = sellerBO.getLatestSeller();
		
		model.addAttribute("result", seller);
		model.addAttribute("title", "판매자 정보");
		
		return "lesson04/sellerInfo";	
	}
	
	// http://localhost:8080/lesson04/seller_info_by_id?id=1
	@GetMapping("/seller_info_by_id")
	public String sellerInfoById(Model model,
			@RequestParam(value="id", defaultValue="1") int id) {
		Seller seller = sellerBO.getSellerById(id);
		
		model.addAttribute("result", seller);
		model.addAttribute("title", "판매자 정보");
		
		return "lesson04/sellerInfo";	
	}
	
}
