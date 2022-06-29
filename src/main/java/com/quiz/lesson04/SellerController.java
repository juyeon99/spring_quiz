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
	
	// http://localhost:8080/lesson04/add_seller
	@RequestMapping(path = "/add_seller", method = RequestMethod.GET)
	public String addSeller() {
		return "lesson04/addSeller";
	}
	
	// http://localhost:8080/lesson04/after_add_seller
	@PostMapping("/after_add_seller")
	public String afterAddSeller(
			@RequestParam("nickname") String nickname,
			@RequestParam(value="profileImageUrl", required=false) String profileImageUrl,
			@RequestParam("temperature") double temperature) {
		
		Seller seller = new Seller();
		seller.setNickname(nickname);
		seller.setProfileImageUrl(profileImageUrl);
		seller.setTemperature(temperature);
		sellerBO.addSeller(seller);
		
		return "lesson04/afterAddSeller";
	}
	
	// http://localhost:8080/lesson04/seller_info
	@GetMapping("/seller_info")
	public String sellerInfoView(Model model) {
		Seller seller = sellerBO.getLatestSeller();
		
		model.addAttribute("result", seller);
		model.addAttribute("title", "판매자 정보");
		
		return "lesson04/sellerInfo";	
	}
	
	// http://localhost:8080/lesson04/seller_info_by_id?id=1
	@GetMapping("/seller_info_by_id")
	public String sellerInfoById(Model model,
//			@RequestParam(value="id", defaultValue="1") int id) {
			@RequestParam(value="id", required=false) Integer id) {
		
		Seller seller = null;
		if(id == null) {
			seller = sellerBO.getLatestSeller();
		} else {
			seller = sellerBO.getSellerById(id);
		}
		
		model.addAttribute("result", seller);
		model.addAttribute("title", "판매자 정보");
		
		return "lesson04/sellerInfo";
	}
	
}
