package com.quiz.lesson06.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson06.model.Booking;

@Repository
public interface BookingDAO {

	public List<Booking> selectBookingList();

	public boolean deleteBookingById(int id);

	public boolean insertBooking(Booking booking);

	// method 1
//	public Booking selectBooking(
//			@Param("name") String name,
//			@Param("phoneNumber") String phoneNumber);
	// method 2
	public List<Booking> selectLastBookingByNameAndPhoneNumber(	
			// It's possible that someone make reservation several times 
			// with same name and same phone number
			// => get the whole list with same name and phone number
			@Param("name") String name,
			@Param("phoneNumber") String phoneNumber);
}
