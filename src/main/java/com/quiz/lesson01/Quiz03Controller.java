package com.quiz.lesson01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 	// jsp가 리턴되는 컨트롤러는 @RestController가 아니라 그냥 @Controller
public class Quiz03Controller {
	
	// http://localhost:8080/lesson01/quiz03/1
	@RequestMapping("/lesson01/quiz03/1")
    public String quiz03() {
		// 실제 데이터가 아니라 jsp 경로를 리턴하는 것이므로 @ResponseBody를 붙이지 않음 => 그래서 @RestController를 쓰는게 아니라 그냥 @Controller를 씀
        return "lesson01/quiz03"; 
    }
}
