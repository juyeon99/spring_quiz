package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.quiz.lesson04.bo.RealtorBO;
import com.quiz.lesson04.model.Realtor;

@RequestMapping("/lesson04")
@Controller
public class RealtorController {
	
	@Autowired
	public RealtorBO realtorBO;
	
	// http://localhost:8080/lesson04/add_realtor
	@RequestMapping(path = "/add_realtor", method = RequestMethod.GET)
	public String addRealtor() {
		return "lesson04/addRealtor";
	}
	
	// http://localhost:8080/lesson04/realtor_info
	@PostMapping("/realtor_info")
	public String realtorInfo(
			@ModelAttribute Realtor realtor,
			Model model) {
		
		// insert
		realtorBO.addRealtor(realtor);
		
		// select
		realtor = realtorBO.getRealtor(realtor.getId());
		
		// Model
		model.addAttribute("result", realtor);
		
		return "lesson04/realtorInfo";
	}
	
}
