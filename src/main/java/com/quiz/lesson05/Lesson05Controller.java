package com.quiz.lesson05;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson02.bo.StoreBO;
import com.quiz.lesson02.model.Store;
import com.quiz.lesson05.bo.NewReviewBO;
import com.quiz.lesson05.bo.WeatherHistoryBO;
import com.quiz.lesson05.model.NewReview;
import com.quiz.lesson05.model.WeatherHistory;

@Controller
public class Lesson05Controller {
	
	// http://localhost:8080/lesson05/1
	@RequestMapping("/lesson05/1")
	public String quiz01() {
		return "lesson05/quiz01";
	}
	
	// http://localhost:8080/lesson05/2
	@RequestMapping("/lesson05/2")
	public String quiz02(Model model) {
		// quiz02_1
		List<String> musicRanking = new ArrayList<>();
		musicRanking.add("강남스타일");
		musicRanking.add("벚꽃엔딩");
		musicRanking.add("좋은날");
		musicRanking.add("거짓말");
		musicRanking.add("보고싶다");
		model.addAttribute("musicRankingList", musicRanking);
		
		
		// quiz02_2
		List<Map<String, Object>> membership = new ArrayList<>();

		Map<String, Object> member = new HashMap<>();
		member.put("name", "손오공");
		member.put("phoneNumber", "010-1234-5678");
		member.put("grade", "VIP");
		member.put("point", 12040);
		membership.add(member);

		member = new HashMap<>();
		member.put("name", "저팔계");
		member.put("phoneNumber", "010-4321-1234");
		member.put("grade", "BASIC");
		member.put("point", 3420);
		membership.add(member);

		member = new HashMap<>();
		member.put("name", "사오정");
		member.put("phoneNumber", "010-8888-1111");
		member.put("grade", "GOLD");
		member.put("point", 1530);
		membership.add(member);

		member = new HashMap<>();
		member.put("name", "삼장");
		member.put("phoneNumber", "010-0000-1234");
		member.put("grade", "GOLD");
		member.put("point", 8450);
		membership.add(member);

		member = new HashMap<>();
		member.put("name", "우마왕");
		member.put("phoneNumber", "010-1111-2222");
		member.put("grade", "BASIC");
		member.put("point", 420);
		membership.add(member);
		
		model.addAttribute("membershipList", membership);
		
		return "lesson05/quiz02";
	}
	
	// http://localhost:8080/lesson05/3
	@RequestMapping("/lesson05/3")
	public String quiz03(Model model) {
		// quiz03_1
		List<Integer> candidates = new ArrayList<>();
		candidates.add(263001);
		candidates.add(173942); 
		candidates.add(563057); 
		
		// 총 투표 인원 구하기
		int totalCount = 0;
		for (Integer candidate : candidates) {
			totalCount += candidate;
		}
		
		
		model.addAttribute("candidatesList", candidates);
		model.addAttribute("totalCount", totalCount);
		
		// quiz03_2
		List<Map<String, Object>> cardBills = new ArrayList<>();

		Map<String, Object> cardBill = new HashMap<>();
		cardBill.put("store", "GS48");
		cardBill.put("pay", 7800);
		cardBill.put("date", "2025-09-14");
		cardBill.put("installment", "일시불");
		cardBills.add(cardBill);

		cardBill = new HashMap<>();
		cardBill.put("store", "현태백화점");
		cardBill.put("pay", 2750000);
		cardBill.put("date", "2025-09-18");
		cardBill.put("installment", "3개월");
		cardBills.add(cardBill);

		cardBill = new HashMap<>();
		cardBill.put("store", "요촌치킨");
		cardBill.put("pay", 180000);
		cardBill.put("date", "2025-09-20");
		cardBill.put("installment", "일시불");
		cardBills.add(cardBill);
		model.addAttribute("cardBillList", cardBills);
		
		return "lesson05/quiz03";
	}
	
	// http://localhost:8080/lesson05/4
	@RequestMapping("/lesson05/4")
	public String quiz04(Model model) {
		List<Member> members = new ArrayList<>();

		Member member = new Member();
		member.setName("유비");
		member.setPhoneNumber("010-1234-5678");
		member.setEmail("youbee@gmail.com");
		member.setNationality("삼국시대 촉한");
		member.setIntroduce("저는 촉의 군주 유비입니다. 삼국통일을 위해 열심히 일하겠습니다.");
		members.add(member);

		member = new Member();
		member.setName("관우");
		member.setPhoneNumber("010-1234-5678");
		member.setEmail("woo@naver.com");
		member.setNationality("삼국시대 촉한");
		member.setIntroduce("관우에요. 저는 유비형님 보다 나이는 많지만 일단 아우입니다.");
		members.add(member);

		member = new Member();
		member.setName("장비");
		member.setPhoneNumber("02-111-3333");
		member.setNationality("삼국시대 촉한");
		member.setEmail("tools@gmail.com");
		member.setIntroduce("장비라우");
		members.add(member);

		member = new Member();
		member.setName("조조");
		member.setPhoneNumber("010-0987-4321");
		member.setNationality("삼국시대 위");
		member.setEmail("jojo@gmail.com");
		member.setIntroduce("이름은 조조 자는 맹덕이라 하오");
		members.add(member);

		member = new Member();
		member.setName("주유");
		member.setPhoneNumber("010-0000-1111");
		member.setNationality("삼국시대 오");
		member.setEmail("jooyou@kakao.com");
		member.setIntroduce("주유는 주유소에서 ㅋㅋ");
		members.add(member);

		member = new Member();
		member.setName("황충");
		member.setPhoneNumber("031-432-0000");
		member.setNationality("삼국시대 촉한");
		member.setEmail("yellowbug@naver.com");
		member.setIntroduce("내 수염 좀 멋있는 듯");
		members.add(member);
		
		model.addAttribute("membersList", members);
		
		return "lesson05/quiz04";
	}
	
	
	@Autowired
	private WeatherHistoryBO weatherHistoryBO;
	
	// http://localhost:8080/lesson05/5/past_weather
	@RequestMapping("/lesson05/5/past_weather")
	public String quiz05_past_weather(Model model) {
		// select from db
		List<WeatherHistory> weatherList = weatherHistoryBO.getWeatherHistoryList();
		
		model.addAttribute("weatherList", weatherList);
		return "lesson05/past_weather";
	}
	
	// http://localhost:8080/lesson05/5/add_weather_view
	@RequestMapping("/lesson05/5/add_weather_view")
	public String quiz05_add_weather_view() {
		return "lesson05/insert_weather";
	}
	
	// http://localhost:8080/lesson05/5/add_weather
	@PostMapping("/lesson05/5/add_weather")
	public String quiz05_add_weather(
			@RequestParam("date") String date,
//			@RequestParam("date") @DateTimeFormat("yyyy-mm-dd") Date date,
			@RequestParam("weather") String weather,
			@RequestParam("temperatures") double temperatures,
			@RequestParam("precipitation") double precipitation,
			@RequestParam("microDust") String microDust,
			@RequestParam("windSpeed") double windSpeed) {
		
		WeatherHistory wh = new WeatherHistory();
		Date d;
		try {
			d = new SimpleDateFormat("yyyy년 MM월 dd일").parse(date);
			wh.setDate(d);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		wh.setWeather(weather);
		wh.setTemperatures(temperatures);
		wh.setPrecipitation(precipitation);
		wh.setMicroDust(microDust);
		wh.setWindSpeed(windSpeed);
		weatherHistoryBO.addWeatherHistory(wh);
		
		return "redirect:past_weather";
	}
	
	
	@Autowired
	private StoreBO storeBO;
	
	// http://localhost:8080/lesson05/6/store
	@RequestMapping("/lesson05/6/store")
	public String quiz06_store(Model model) {
		// select from db
		List<Store> storeList = storeBO.getStoreList();
		model.addAttribute("storeList", storeList);
		
		return "lesson05/stores";
	}
	
	@Autowired
	private NewReviewBO newReviewBO;

	// http://localhost:8080/lesson05/6/reviews?storeId=3&storeName=BHC
	@GetMapping("/lesson05/6/reviews")
	public String quiz06_reviews(Model model,
			@RequestParam(value="storeId") int storeId,
			@RequestParam(value="storeName") String storeName) {
		// select from db
		List<NewReview> reviewList = newReviewBO.getReviewListById(storeId);
		model.addAttribute("storeName", storeName);
		model.addAttribute("reviewList", reviewList);
		
		return "lesson05/reviews";
	}
	
}
