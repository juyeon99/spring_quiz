<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lesson06 Quiz01,02 - 즐겨찾기 리스트</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>즐겨찾기 목록</h1>
		<table class="table">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th colspan="2">주소</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="favorite" items="${favList}" varStatus="status">
					<tr>
						<td>${favorite.id}</td>
						<!-- <td>${status.count}</td> -->
						<td>${favorite.name}</td>
						<td>${favorite.url}</td>
						<td>
							<%-- (1) name 속성과 value 속성을 이용해서 동적으로 삭제 감지 (권장 안함) (value는 하나 밖에 담지 못하기 때문) --%>
							<!-- <button type="button" name="delBtn" value="${favorite.id}" class="del-btn btn btn-danger">삭제</button> -->
							
							<%-- (2) data를 이용해서 태그에 data를 임시저장 (권장됨) --%>
							<%-- 'data-' + name(should not be camel case!)	ex) data-fav-id, data-fav-name value와 다르게 여러개 사용 가능!--%>
							<button type="button" class="del-btn btn btn-danger" data-favorite-id="${favorite.id}">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
<script>
$(document).ready(function(){
	// (1) name 속성과 value 속성을 이용해서 동적으로 삭제 감지 (권장 안함)
	/* $('button[name=delBtn]').on('click',function(e){
		// let id = $(this).attr('value');
		
		let id = e.target.value;
		alert(id);
	}); */
	
	// (2) data를 이용해서 태그에 data를 임시저장
	// 태그: data-favorite-id		'data-' 뒤에는 우리가 이름을 정함.(But no camel case)
	// 스크립트: $(this).data('favorite-id'); => 태그에 심은 값을 꺼냄
	$('.del-btn').on('click',function(){
		let delId = $(this).data('favorite-id');	// 'data-'를 제외한 이름
		
		$.ajax({
			// request
			type:"POST"			// better to use POST method to hide info
			,url:"/lesson06/delete_favorite"
			,data:{"id":delId}
			
			// response
			,success:function(data){
				// {"result":"success"}
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