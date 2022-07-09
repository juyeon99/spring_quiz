<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lesson06 Quiz03 - 예약 조회하기</title>
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
        
	    <img id="image" src="/img/test06_banner1.jpeg" alt="banner image" class="w-100">
	    
        <div class="d-flex" style="height:250px;">
        	<div class="col-4 box1">
        		<span style="font-size:60px;">실시간<br>예약하기</span>
        	</div>
        	<div class="col-4 p-3 box2 flex-column">
        		<span class="m-3" style="font-size:30px;">예약확인</span>
        		<div class="form-group d-flex mt-3">
					<label for="name" class="mr-2 text-right" style="width:20%;">이름: </label>
					<input type="text" id="name" name="name" class="form-control" style="width:75%">
				</div>
				<div class="form-group d-flex">
					<label for="phoneNumber" class="mr-2 text-right" style="width:20%;">전화번호:</label>
					<input type="text" id="phoneNumber" name="phoneNumber" class="form-control" style="width:75%">
				</div>
				<div class="d-flex justify-content-end">
					<button id="searchBtn" class="btn btn-success">조회 하기</button>
        		</div>
        	</div>
        	<div class="col-4 box1">
        		<div>
                    <div style="font-size:30px;">예약문의: </div>
                    <div style="font-size:40px;">010-</div>
                    <div style="font-size:40px;">0000-1111</div>
                </div>
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
var n = 1;
function changeImg(){
    n = (n+1) % 4;
    if(n == 0){
        n = 4;
    }
    $("#image").attr("src", "/img/test06_banner"+n+".jpeg");
}

function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) 
        month = '0' + month;
    if (day.length < 2) 
        day = '0' + day;

    return [year, month, day].join('-');
}

$(document).ready(function(){
	setInterval(changeImg, 3000);
	
	$('#searchBtn').on('click',function(){
		let name = $('#name').val().trim();
		let phoneNumber = $('#phoneNumber').val();
		
		$.ajax({
			// request
			type:"POST"	
			,url:"/lesson06/3/search_booking"
			,data:{"name":name,"phoneNumber":phoneNumber}
			
			// response
			,success:function(data){
				if(data.result == "success"){
					alert('이름: ' + name 
							+ '\n날짜: ' + formatDate(data.date)
							+ '\n일수: ' + data.day
							+ '\n인원: ' + data.headcount
							+ '\n상태: ' + data.state)
				} else{
					alert('예약 내역이 없습니다.');
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