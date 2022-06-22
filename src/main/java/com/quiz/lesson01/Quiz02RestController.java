package com.quiz.lesson01;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/lesson01/quiz02")
@RestController
public class Quiz02RestController {

	@RequestMapping("/1")
	public List<Map<String, Object>> quiz02_1(){
		List<Map<String, Object>> movies = new ArrayList<>();
		
		Map<String, Object> movie = new HashMap<>();
		movie.put("rate", 15);
		movie.put("director", "봉준호");
		movie.put("time", 131);
		movie.put("title", "기생충");
		movies.add(movie);
		
		movie = new HashMap<>();
		movie.put("rate", 0);
		movie.put("director", "로베르토 베니니");
		movie.put("time", 116);
		movie.put("title", "인생은 아름다워");
		movies.add(movie);
		
		movie = new HashMap<>();
		movie.put("rate", 12);
		movie.put("director", "크리스토퍼 놀란");
		movie.put("time", 147);
		movie.put("title", "인셉션");
		movies.add(movie);
		
		movie = new HashMap<>();
		movie.put("rate", 19);
		movie.put("director", "윤종빈");
		movie.put("time", 133);
		movie.put("title", "범죄와의 전쟁 : 나쁜놈들 전성시대");
		movies.add(movie);
		
		movie = new HashMap<>();
		movie.put("rate", 15);
		movie.put("director", "프란시스 로렌스");
		movie.put("time", 137);
		movie.put("title", "헝거게임");
		movies.add(movie);
		
		return movies;
	}
	
	@RequestMapping("/2")
	public List<Board> quiz02_2(){
		List<Board> boardList = new ArrayList<>();
		Board b1 = new Board();
		b1.setTitle("안녕하세요 가입인사 드립니다.");
		b1.setUser("hagulu");
		b1.setContent("안녕하세요. 가입했어요.");
		boardList.add(b1);
		
		Board b2 = new Board();
		b2.setTitle("헐 대박");
		b2.setUser("bada");
		b2.setContent("오늘 목요일이었어");
		boardList.add(b2);
		
		Board b3 = new Board();
		b3.setTitle("오늘 데이트");
		b3.setUser("dulumary");
		b3.setContent("....");
		boardList.add(b3);
		
		return boardList;
	}
	
	@RequestMapping("/3")
	public ResponseEntity<Board> quiz02_3(){
		Board b1 = new Board();
		b1.setTitle("안녕하세요 가입인사 드립니다.");
		b1.setUser("hagulu");
		b1.setContent("안녕하세요. 가입했어요.");
		
		return new ResponseEntity<>(b1,HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
