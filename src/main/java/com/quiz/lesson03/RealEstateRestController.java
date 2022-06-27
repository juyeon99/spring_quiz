package com.quiz.lesson03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.model.RealEstate;

@RestController
public class RealEstateRestController {
	
	@Autowired
	private RealEstateBO realEstateBO;
	
	// http://localhost:8080/lesson03/quiz01/1?id=20
	@RequestMapping("/lesson03/quiz01/1")
	public RealEstate quiz01_1(@RequestParam(value="id") int id) {
		return realEstateBO.getRealEstateById(id);
	}
	
	// http://localhost:8080/lesson03/quiz01/2?rent_price=90
	@RequestMapping("/lesson03/quiz01/2")
	public List<RealEstate> quiz01_2(@RequestParam(value="rent_price", required=true) int rent_price) {
		return realEstateBO.getRealEstateByRentPrice(rent_price);
	}
	
	// http://localhost:8080/lesson03/quiz01/3?area=90&price=130000
	@RequestMapping("/lesson03/quiz01/3")
	public List<RealEstate> quiz01_3(
			@RequestParam(value="area", required=true) int area
			,@RequestParam(value="price", required=true) int price) {
		return realEstateBO.getRealEstateByAreaAndPrice(area, price);
	}
	
	@RequestMapping("/lesson03/quiz02/1")
	public String quiz02_1(){
		RealEstate re = new RealEstate();
		re.setRealtorId(3);
		re.setAddress("푸르지용 리버 303동 1104호");
		re.setArea(89);
		re.setType("매매");
		re.setPrice(100000);
		
		int row = realEstateBO.addRealEstate(re);
		return row > 0 ? row + "행 입력 성공" : "실패";
	}
	
	// http://localhost:8080/lesson03/quiz02/2?realtor_id=5
	@RequestMapping("/lesson03/quiz02/2")
	public String quiz02_2(@RequestParam(value="realtor_id", required=true) int realtorId){
		int row = realEstateBO.addRealEstateAsField(realtorId,"썅떼빌리버 오피스텔 814호",45,"월세",100000,120);
		return row > 0 ? row + "행 입력 성공" : "실패";
	}
}
