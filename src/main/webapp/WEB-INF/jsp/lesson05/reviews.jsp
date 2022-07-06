<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lesson05 Quiz06 - Reviews</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/css/lesson05/quiz06_style01.css" type="text/css">
</head>
<body>
<div class="wrap">
	<h3 class="bg-info" style="color:white; padding:20px; width:500px;">배탈의 민족</h3>
	<h1>${storeName}-리뷰</h1>
	<c:if test="${fn:length(reviewList) eq 0}">
		<br><h3 class="text-center">작성된 리뷰가 없습니다.</h3><br>
	</c:if>
	<c:if test="${fn:length(reviewList) > 0}">
		<c:forEach var="review" items="${reviewList}">
			<div class="box">
				<strong>${review.userName} </strong>
				<c:choose>
					<c:when test="${review.point == 1.0}">
						<img src="/img/star_fill.png"><img src="/img/star_empty.png"><img src="/img/star_empty.png"><img src="/img/star_empty.png"><img src="/img/star_empty.png">
					</c:when>
					<c:when test="${review.point == 1.5}">
						<img src="/img/star_fill.png"><img src="/img/star_half.png"><img src="/img/star_empty.png"><img src="/img/star_empty.png"><img src="/img/star_empty.png">
					</c:when>
					<c:when test="${review.point == 2.0}">
						<img src="/img/star_fill.png"><img src="/img/star_fill.png"><img src="/img/star_empty.png"><img src="/img/star_empty.png"><img src="/img/star_empty.png">
					</c:when>
					<c:when test="${review.point == 2.5}">
						<img src="/img/star_fill.png"><img src="/img/star_fill.png"><img src="/img/star_half.png"><img src="/img/star_empty.png"><img src="/img/star_empty.png">
					</c:when>
					<c:when test="${review.point == 3.0}">
						<img src="/img/star_fill.png"><img src="/img/star_fill.png"><img src="/img/star_fill.png"><img src="/img/star_empty.png"><img src="/img/star_empty.png">
					</c:when>
					<c:when test="${review.point == 3.5}">
						<img src="/img/star_fill.png"><img src="/img/star_fill.png"><img src="/img/star_fill.png"><img src="/img/star_half.png"><img src="/img/star_empty.png">
					</c:when>
					<c:when test="${review.point == 4.0}">
						<img src="/img/star_fill.png"><img src="/img/star_fill.png"><img src="/img/star_fill.png"><img src="/img/star_fill.png"><img src="/img/star_empty.png">
					</c:when>
					<c:when test="${review.point == 4.5}">
						<img src="/img/star_fill.png"><img src="/img/star_fill.png"><img src="/img/star_fill.png"><img src="/img/star_fill.png"><img src="/img/star_half.png">
					</c:when>
					<c:otherwise>
						<img src="/img/star_fill.png"><img src="/img/star_fill.png"><img src="/img/star_fill.png"><img src="/img/star_fill.png"><img src="/img/star_fill.png">
					</c:otherwise>
				</c:choose><br>
				<small style="color: gray;"><fmt:formatDate value="${review.createdAt}" pattern="yyyy년 MM월 dd일"/></small><br>
				${review.review}<br>
				<div class="menu">
					${review.menu}
				</div>
			</div>
		</c:forEach>
	</c:if>
	<hr>
	<footer>
		<strong>(주)우와한형제</strong><br>
		<small class="text-secondary">고객센터: 1500-1500</small>
	</footer>
</div>
</body>
</html>