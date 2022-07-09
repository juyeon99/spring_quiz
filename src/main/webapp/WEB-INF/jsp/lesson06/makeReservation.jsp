<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lesson06 Quiz03 - 예약하기</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<!-- datepicker -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<!-- css -->
	<link rel="stylesheet" href="/css/lesson06/quiz03_style01.css" type="text/css">
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-center p-3">
            <span class="display-4">통나무 펜션</span>
        </div>
		<nav class="menu d-flex align-items-center" style="background-color:gold;">
            <ul class="nav w-100 nav-fill">
                <li class="nav-item"><a class="nav-link font-weight-bold" href="check_reservation_view">펜션소개</a></li>
                <li class="nav-item"><a class="nav-link font-weight-bold" href="#">객실보기</a></li>
                <li class="nav-item"><a class="nav-link font-weight-bold" href="reservation_view">예약하기</a></li>
                <li class="nav-item"><a class="nav-link font-weight-bold" href="booking_list_view">예약목록</a></li>
            </ul>
        </nav>
        <h1 class="text-center col-12 p-3">예약하기</h1>
        
        <div class="d-flex align-items-center flex-column">
        	<div class="form-group col-5">
				<label for="name">이름</label>
				<input type="text" id="name" name="name" class="form-control">
			</div>
			<div class="form-group col-5">
				<label for="date">예약날짜</label>
				<input type="text" id="date" name="date" class="form-control">
			</div>
			<div class="form-group col-5">
				<label for="day">숙박일수</label>
				<input type="text" id="day" name="day" class="form-control">
			</div>
			<div class="form-group col-5">
				<label for="headcount">숙박인원</label>
				<input type="text" id="headcount" name="headcount" class="form-control">
			</div>
			<div class="form-group col-5">
				<label for="phoneNumber">전화번호</label>
				<input type="text" id="phoneNumber" name="phoneNumber" class="form-control">
			</div>
			<div class="col-5">
        		<button id="reserveBtn" class="btn col-12 btn-warning">예약하기</button>
			</div>
		</div>
        
		<footer>
			<small>
				제주특별자치도 제주시 애월읍<br>
				사업자등록번호:111-22-255222 / 농어촌민박사업자지정 / 대표:김통목<br>
				Copyright 2025 tongnamu. All right reserved.
			</small>
		</footer>
	</div>

<script>
$(document).ready(function(){
	$("#date").datepicker({
        dayNamesMin:["일","월","화","수","목","금","토"],
        dateFormat: "yy년 mm월 dd일",
       	minDate:0
    });
	
	$('#reserveBtn').on('click',function(){
		let name = $('#name').val().trim();
		let date = $('#date').val();
		let day = $('#day').val();
		let headcount = $('#headcount').val();
		let phoneNumber = $('#phoneNumber').val();
		
		if(name == ''){
			alert('이름을 입력하세요.');
			return;
		}
		if(date == ''){
			alert('날짜를 선택하세요.');
			return;
		}
		if(day == ''){
			alert('숙박일수를 입력하세요.');
			return;
		}
		if(isNaN(day)){
			alert('숙박일수에 숫자만 입력해주세요.');
			return;
		}
		if(headcount == ''){
			alert('숙박인원을 입력하세요.');
			return;
		}
		if(isNaN(headcount)){
			alert('숙박인원에 숫자만 입력해주세요.');
			return;
		}
		if(phoneNumber == ''){
			alert('전화번호를 입력하세요.');
			return;
		}
		if(!phoneNumber.startsWith('010')){
			alert('전화번호를 올바른 형식으로 입력해주세요.');
			return;
		}
		
		$.ajax({
			// request
			type:"POST"	
			,url:"/lesson06/3/reserve"
			,data:{"name":name,"date":date,"day":day,"headcount":headcount,"phoneNumber":phoneNumber}
			
			// response
			,success:function(data){
				if(data.result == "success"){
					alert("예약되었습니다.")
					location.href="/lesson06/3/booking_list_view";
				} else{
					alert('예약 실패');
				}
			}
			,error:function(e){
				alert('통신에 실패했습니다.');
			}
		});
	});
	
	
});
</script>
</body>
</html>