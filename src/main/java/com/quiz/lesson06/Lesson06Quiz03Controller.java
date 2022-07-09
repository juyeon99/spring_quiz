package com.quiz.lesson06;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson05.model.WeatherHistory;
import com.quiz.lesson06.bo.BookingBO;
import com.quiz.lesson06.model.Booking;

@RequestMapping("/lesson06/3")
@Controller
public class Lesson06Quiz03Controller {

	@Autowired
	private BookingBO bookingBO;
	
	// http://localhost:8080/lesson06/3/booking_list_view
	@RequestMapping("/booking_list_view")
	public String bookingListView(Model model) {
		List<Booking> bookingList = new ArrayList<>();
		bookingList = bookingBO.getBookingList();
		
		model.addAttribute("bookingList",bookingList);
		
		return "lesson06/bookingList";
	}
	
	// http://localhost:8080/lesson06/3/delete_booking
	@ResponseBody
	@PostMapping("/delete_booking")
	public Map<String, Object> deleteBooking(
			@RequestParam("id") int id){
		boolean deleted = bookingBO.deleteBookingById(id);
		
		Map<String, Object> result = new HashMap<>();
		if(deleted) {
			result.put("result", "success");
		} else {
			result.put("result", "failure");
		}
		
		return result;
	}
	
	// http://localhost:8080/lesson06/3/reservation_view
	@RequestMapping("/reservation_view")
	public String reservationView() {
		return "lesson06/makeReservation";
	}
	
	// http://localhost:8080/lesson06/3/reserve
	@ResponseBody
	@PostMapping("/reserve")
	public Map<String, Object> reserve(
		@RequestParam("name") String name,
		@RequestParam("date") String date,
		@RequestParam("day") int day,
		@RequestParam("headcount") int headcount,
		@RequestParam("phoneNumber") String phoneNumber) {
		
		// insert into db
		Booking booking = new Booking();
		Date d;
		try {
			d = new SimpleDateFormat("yyyy년 MM월 dd일").parse(date);
			booking.setDate(d);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		booking.setName(name);
		booking.setDay(day);
		booking.setHeadcount(headcount);
		booking.setPhoneNumber(phoneNumber);
		booking.setState("대기중");
		boolean bool = bookingBO.addBooking(booking);
		
		Map<String, Object> result = new HashMap<>();
		if(bool) {
			result.put("result", "success");
		} else {
			result.put("result", "failure");
		}
		
		return result;
	}
	
	// http://localhost:8080/lesson06/3/check_reservation_view
	@RequestMapping("/check_reservation_view")
	public String checkReservation() {
		return "lesson06/checkReservation";
	}
	
	// http://localhost:8080/lesson06/3/search_booking
	@ResponseBody
	@PostMapping("/search_booking")
	public Map<String, Object> searchBooking(
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber){
		Booking booking = bookingBO.getBooking(name,phoneNumber);
		
		Map<String, Object> result = new HashMap<>();
		if(booking != null) {
			result.put("result", "success");
			result.put("date", booking.getDate());
			result.put("headcount", booking.getHeadcount());
			result.put("day", booking.getDay());
			result.put("state", booking.getState());
		} else {
			result.put("result", "failure");
		}
		
		return result;
	}
}
