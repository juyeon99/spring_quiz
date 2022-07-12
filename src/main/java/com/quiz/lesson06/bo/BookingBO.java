package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.BookingDAO;
import com.quiz.lesson06.model.Booking;

@Service
public class BookingBO {

	@Autowired
	private BookingDAO bookingDAO;

	public List<Booking> getBookingList() {
		return bookingDAO.selectBookingList();
	}

	public boolean deleteBookingById(int id) {
		return bookingDAO.deleteBookingById(id);
	}

	public boolean addBooking(Booking booking) {
		return bookingDAO.insertBooking(booking);
	}
	
	// method 1
//	public Booking getBooking(String name, String phoneNumber) {
//		return bookingDAO.selectBooking(name,phoneNumber);
//	}
	// method 2
	public Booking getLastBookingByNameAndPhoneNumber(String name, String phoneNumber) {
		List<Booking> bookingList = bookingDAO.selectLastBookingByNameAndPhoneNumber(name,phoneNumber);
		if(bookingList.isEmpty()) {
			return null;
		}
		return bookingList.get(0);		// get the last reservation someone made
	}
	
}
