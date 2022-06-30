package com.quiz.lesson05;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class lesson05Controller {
	
	// http://localhost:8080/lesson05/1
	@RequestMapping("/lesson05/1")
	public String quiz01() {
		return "lesson05/quiz01";
	}
	
}
