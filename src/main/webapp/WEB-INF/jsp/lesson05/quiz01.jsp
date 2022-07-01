<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lesson05 Quiz01 - JSTL</title>
</head>
<body>

	<h2>1. JSTL core 변수</h2>
	<c:set var="n1" value="36"/>
	<c:set var="n2" value="3"/>
	첫 번째 숫자: ${n1}<br>
	두 번째 숫자: ${n2}
	
	
	<h2>2. JSTL core 연산</h2>
	더하기: ${n1+n2}<br>
	빼기: ${n1-n2}<br>
	곱하기: ${n1*n2}<br>
	나누기: ${n1/n2}
	
	
	<h2>3. JSTL core out</h2>
	<c:out value="<title>core out</title>"/>
	
	
	<h2>4. JSTL core if</h2>
	<%-- <c:choose>
		<c:when test="${(n1+n2)/2 ge 10}"> 
			<h1>${(n1+n2)/2}</h1>
		</c:when>
		<c:otherwise> 
			<h3>${(n1+n2)/2}</h3>
		</c:otherwise>
	</c:choose> --%>
	
	<c:if test="${(n1+n2)/2 ge 10}">
		<h1>${(n1+n2)/2}</h1>
	</c:if>
	<c:if test="${(n1+n2)/2 lt 10}">
		<h3>${(n1+n2)/2}</h3>
	</c:if>

	
	<h2>5. JSTL core if</h2>
	<c:if test="${n1*n2 gt 100}">
		<c:out value="<script>alert('너무 큰 수입니다.')</script>" escapeXml="false"/>
	</c:if>
	
</body>
</html>