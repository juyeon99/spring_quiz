<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lesson06 Quiz03 - 예약 목록 보기</title>
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
        <h1 class="text-center col-12 p-3">예약 목록 보기</h1>
        
		<table class="table text-center">
			<thead>
				<tr>
					<th>이름</th>
					<th>예약날짜</th>
					<th>숙박일수</th>
					<th>숙박인원</th>
					<th>전화번호</th>
					<th>예약상태</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="booking" items="${bookingList}">
					<tr>
						<td>${booking.name}</td>
						<td><fmt:formatDate value="${booking.date}" pattern="yyyy년 MM월 dd일"/></td>
						<td>${booking.day}</td>
						<td>${booking.headcount}</td>
						<td>${booking.phoneNumber}</td>
						<td>
							<c:choose>
								<c:when test="${booking.state == '대기중'}">
									<span class="text-info">${booking.state}</span>
								</c:when>
								<c:otherwise>
									<span class="text-success">${booking.state}</span>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<button type="button" class="del-btn btn btn-danger" data-booking-id="${booking.id}">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
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
	$('.del-btn').on('click',function(){
		let delId = $(this).data('booking-id');
		
		$.ajax({
			// request
			type:"POST"	
			,url:"/lesson06/3/delete_booking"
			,data:{"id":delId}
			
			// response
			,success:function(data){
				if(data.result == "success"){
					location.reload(true);		// 삭제 후 새로고침
				} else{
					alert('삭제 실패. 관리자에게 문의해주세요.');
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