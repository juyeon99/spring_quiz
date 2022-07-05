<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lesson05 Quiz05 - 날씨 정보</title>

<!-- boot strap, jquery cdn 원본 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<!-- datepicker -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<!-- css -->
	<link rel="stylesheet" href="/css/lesson05/quiz05_style01.css" type="text/css">
</head>
<body>
<div class="container d-flex">
	<nav class="col-2 d-flex flex-column">
		<a href="https://www.kma.go.kr/kma/"><img src="/img/meteo_logo.png"/></a>
		<a href="#">날씨</a>
		<a href="#">날씨입력</a>
		<a href="#">테마날씨</a>
		<a href="#">관측 기후</a>
	</nav>
	
	<div class="col-10">
		<h2 style="margin:20px;">날씨 입력</h2>
        <form method="post" action="/lesson05/5/add_weather">
            <div class="d-flex justify-content-between">
                <div class="d-flex" style="align-items: center;">
                    날짜 <input type="text" id="date" name="date" class="form-control" style="width: 250px; margin:10px;">
                </div>
                <div class="d-flex" style="align-items: center;">날씨 
                    <!-- <div class="dropdown">
                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                        Dropdown button
                        </button>
                        <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">Link 1</a>
                        <a class="dropdown-item" href="#">Link 2</a>
                        <a class="dropdown-item" href="#">Link 3</a>
                        </div>
                    </div> -->

                    <!-- <select>
                        <option selected>맑음</option>
                        <option>구름 조금</option>
                        <option>흐림</option>
                        <option>비</option>
                    </select> -->
                    <!-- <select class="selectpicker" data-style="btn-info">
                        <option>Toronto</option>
                        <option>Bucharest</option>
                        <option>Paris</option>  
                    </select> -->
                    <select class="form-control" name="weather" id="exampleFormControlSelect1" style="width: 150px; margin:10px;">
                        <option selected>맑음</option>
                        <option>구름 조금</option>
                        <option>흐림</option>
                        <option>비</option>
                    </select>
                </div>
                <div class="d-flex" style="align-items: center;">미세먼지 
                    <select class="form-control" name="microDust" id="exampleFormControlSelect1" style="width: 150px; margin:10px;">
                        <option selected>좋음</option>
                        <option>보통</option>
                        <option>나쁨</option>
                        <option>최악</option>
                    </select>
                </div>
            </div>

            <div class="d-flex justify-content-between" style="margin-top: 20px;">
                <div class="d-flex" style="align-items: center;">
                    기온 <div class="input-group" style="width: 200px; margin:10px;">
                        <input name="temperatures" type="text" class="form-control" >
                        <div class="input-group-append">
                            <span class="input-group-text" id="basic-addon2">°C</span>
                        </div>
                    </div>
                </div>
                <div class="d-flex" style="align-items: center;">
                    강수량 <div class="input-group" style="width: 200px; margin:10px;">
                        <input name="precipitation" type="text" class="form-control" >
                        <div class="input-group-append">
                            <span class="input-group-text" id="basic-addon2">mm</span>
                        </div>
                    </div>
                </div>
                <div class="d-flex" style="align-items: center;">
                    풍속 <div class="input-group" style="width: 200px; margin:10px;">
                        <input name="windSpeed" type="text" class="form-control" >
                        <div class="input-group-append">
                            <span class="input-group-text" id="basic-addon2">km/h</span>
                        </div>
                    </div>
                </div>
            </div>

            <button type="submit" class="btn btn-success" style="float:right; margin-top:20px;">저장</button>
        </form>
	</div>
</div>

<div class="container d-flex">
	<div class="col-2">
		<img src="/img/meteo_logo.png" style="width:130px; margin:10px; filter: grayscale(100%); opacity: 0.7;"/>
	</div>
	<div style="margin:10px; color:gray;">
		<small>(07062) 서울시 동작구 여의대방로16길 61</small><br>
		<small>Copyright©2020 KMA. All Rights RESERVED.</small>
	</div>
</div>
	
<script>
    $(document).ready(function(){
        $("#date").datepicker({
            dayNamesMin:["일","월","화","수","목","금","토"],
            dateFormat: "yy년 mm월 dd일"
        });
    });
</script>
</body>
</html>