<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl03.jsp</title>
</head>
<body>
	<h1>JSTL 반복문</h1>
	<h5>문제1~10출력</h5>

	<!-- 
		for(int i = 0; i < 100; i++) 
		var : i (시작하는 변수명)
		begin : 시작값
		end : 종료값
		step : 증감값 (지정하지 않으면 1씩 증가하는 것으로 기본값 설정 되어있다.)
	-->
	<c:forEach var="i" begin="1" end="10">
		${i} <br>
	</c:forEach>

	<h4>1~10출력 홀수 출력</h4>
	<c:forEach var="i2" begin="1" end="10" step="${i2 = i2 +2 }">
 		${ i2 } <br>
	</c:forEach>

	<!-- for문 안에 if문 작성 가능 -->
	<h4>1~10까지 짝수 출력</h4>
	<c:forEach var="i3" begin="1" end="10">
		<c:if test="${ i3 % 2 == 0}">
			${i3 }
		</c:if>
	</c:forEach>

	<!-- 1~10까지 합을 구하시오 -->
	<h4>1~10까지 합 출력</h4>
	<c:forEach var="i" begin="1" end="10">
		<c:set var="sum" value="${ sum = sum + i }" />
	</c:forEach>
	<p>1~10까지 합: ${sum }</p>

	<!-- 1~10까지 홀수의 개수를 출력 
			복합 연산자랑 증감 연산자는 jstl에서는 사용 불가
	-->
	<h4>1~10까지 홀수 개수 출력</h4>
	<c:forEach var="i" begin="1" end="10">
		<c:if test="${ i % 2 == 1}" >
			<c:set var = "count" value="${count = count + 1 }"></c:set>
		</c:if>
	</c:forEach>
	<p>1~10까지 홀수 개수: ${count }</p>

	<!-- 구구단 3단 출력 -->
	<h4>구구단 3단 출력</h4>
	<c:forEach var="i" begin="1" end="9">
		3 * ${i} = ${3 * i} <br>
	</c:forEach>


</body>
</html>