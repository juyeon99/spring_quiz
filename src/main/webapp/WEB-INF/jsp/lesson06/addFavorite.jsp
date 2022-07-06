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
		
		<form method="post" action="/lesson06/add_user">
			<div class="form-group">
				<label for="name">제목</label>
				<input type="text" id="name" name="name" class="form-control">
			</div>
			
			<div class="form-group">
				<label for="url">주소</label>
				<input type="text" id="url" name="url" class="form-control">
			</div>
			
			<input type="button" id="addBtn" class="btn btn-success col-12" value="추가">	
		</form>
	</div>
	
<script>
	$(document).ready(function(){
		$('#addBtn').on('click', function(){
			// validation 유효성 체크
			let name = $('#name').val().trim();
			if(name == ''){
				alert('제목을 입력하세요.');
				return;
			}
			
			let url = $('#url').val().trim();
			if(url == ''){
				alert('url을 입력하세요.');
				return;
			}
			
			$.ajax({
				// request
				type:"POST"
				,url:"/lesson06/1/add_favorite"
				,data:{"name":name, "url":url}
				
				// response
				,success:function(data){
					alert(data);
					location.href="/lesson06/1/favorite_view";
				}
				,complete:function(){
					alert("완료");
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