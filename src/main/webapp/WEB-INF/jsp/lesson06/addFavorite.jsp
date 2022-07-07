<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lesson06 Quiz01 - 즐겨찾기 추가</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>즐겨찾기 추가하기</h1>
		
		<!-- <form method="post" action="/lesson06/add_favorite"> -->
			<div class="form-group">
				<label for="name">제목</label>
				<input type="text" id="name" name="name" class="form-control">
			</div>
			
			<div class="form-group">
				<label for="url">주소</label>
				<div class="d-flex">
					<input type="text" id="url" name="url" class="form-control">
					<button type="button" class="btn btn-info ml-2" id="checkBtn">중복확인</button>
				</div>
				<small id="warningBox"></small>
				<small id="urlChecked"></small>
			</div>
			
			<input type="button" id="addBtn" class="btn btn-success btn-block" value="추가">	<!-- btn-block = w-100 = col-12 -->
		<!-- </form> -->
	</div>
	
<script>
	$(document).ready(function(){
		$('#checkBtn').on('click', function(){
			$('#warningBox').empty();
			$('#urlChecked').empty();
			
			let url = $('#url').val().trim();
			if(url == ''){
				alert('url을 입력하세요.');
				return;
			}
			
			if(url.startsWith("http") === false && !url.startsWith("https")){
				alert('주소 형식이 잘못 되었습니다.');
				return;
			}
			
			$.ajax({
				// request
				type:"GET"
				,url:"/lesson06/is_duplication?url=" + url
				
				// response
				,success: function(data){
					// console.log(data.is_duplication);
					if(data.is_duplication){
						$('#warningBox').append('<span class="text-danger">중복된 url입니다.</span>');
					} else{
						$('#urlChecked').append('<span class="text-info">저장 가능한 url 입니다.</span>');
					}
				}
				,error: function(e){
					alert("중복 확인에 실패하였습니다.");
				}
			});
		});
		
		$('#addBtn').on('click', function(){
			// validation 유효성 체크
			let name = $('#name').val().trim();
			if(name.length < 1){
				alert('제목을 입력하세요.');
				return;
			}
			
			let url = $('#url').val().trim();
			if(url == ''){
				alert('url을 입력하세요.');
				return;
			}
			
			if(url.startsWith("http") === false && !url.startsWith("https")){
				alert('주소 형식이 잘못 되었습니다.');
				return;
			}
			
			$.ajax({
				// request
				type:"POST"
				,url:"/lesson06/add_favorite"
				,data:{"name":name, "url":url}
				
				// response		"{"result":"success"}"
				,success:function(data){	// json str을 object로 변환해줌
					// alert(data.result);
					// alert(data.result_code);
					if(data.result == "success" && $('#warningBox').children().length == 0){
						alert("입력 성공");
						location.href="/lesson06/favorite_view";	// AJAX: 수동 request		// get 방식
					} else{
						alert("입력 정보를 다시 확인하세요.");
					}
				}
				,error:function(e){
					alert("error :" + e);
				}
			});
		});
		
	});
</script>
</body>
</html>