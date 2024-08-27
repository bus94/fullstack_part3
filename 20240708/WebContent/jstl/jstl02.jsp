<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl02.jsp</title>
</head>
<body>
	<!-- 자바랑 똑같이 동작하는 if문, 그 안에서 별도의 else가 없다. 
		여러 조건을 나열하는 형태로 작성하기에는 어렵다. 
		
		test 속성은 if문에서 사용할 조건을 지정
		var 속성은 조건의 결과를 저장할 변수명을 지정
		scope 속성 변수가 저장될 영역 지정
		-->

	<c:set var="number" value="100" />
	<c:set var="string" value="JSP" />

	<!-- 홀수인지 짝수인지 판단하는 if문 작성 
		JSTL 비교 연산 시 자동으로 타입을 변환해준다.
	-->
	<h4>홀/짝 판별</h4>
	<c:if test="${ number mod 2 eq 0 }" var="result">
		${number}는 짝수 입니다. <br>
	</c:if>
	result: ${result }
	<br>

	<h4>문자열 비교와 else 구문 흉내내기</h4>
	<c:if test="string eq 'Java'" var="result2">
		<p>문자열은 Java입니다.</p>
	</c:if>
	result2: ${result2 }

	<!-- 위에서 result2 결과를 저장했기 때문에 밑에 있는 if문을 사용할 수 있다. -->
	<c:if test="${not result2 }" var="result2">
		<p>문자열은 Java가 아닙니다.</p>
	</c:if>

	<!-- 주의사항 
			test 속성에 EL을 통해 조건식을 쓸 때 공백이 삽입되면 무조건 false
	-->
	<c:if test="100" var="result3">
		EL이 아닌 정수를 지정하면 false
	</c:if>

	<!-- 여러 개의 조건이 있을 경우에는 태그 -->
	<c:set var="number2" value="80">

	</c:set>

	<h4>여러 조건에 따른 메시지 출력</h4>

	<c:choose>
		<c:when test="${number2 < 50 }">
			<p>${number2 }는50보다작다.</p>
		</c:when>
		<!-- if -->
		<c:when test="${number2 >= 50 && number2 < 90}">
			<p>${number2 }는50보다크고 90미만입니다.</p>
		</c:when>
		<!-- else if -->
		<c:when test=""></c:when>
		<!-- else if -->

		<c:otherwise>
			<p>
				어떤 조건도 만족하지 않습니다! <br> 범위값을 초과함
			</p>
		</c:otherwise>
		<!-- else if -->
	</c:choose>


</body>
</html>