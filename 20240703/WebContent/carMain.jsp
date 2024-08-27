<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>carMain.jsp</title>

<!-- 원하는 라이브러리 가져오기 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<!-- 내가 만든 css, 자바스크립트 파일 포함하기 -->

</head>
<body>

	<%
		// 클라이언트가 버튼을 클릭해서 원하는 사이트를 요청할 때마다 페이지가 변경할 수 있도록 url에 center라는 변수를 이용해서 페이지명을 입력 받는다.
		String center = request.getParameter("center");

		// 처음 페이지를 요청하면 
		if (center == null) {
			center = "center.jsp";
		}
	%>

	<div class="container" align="center">
		<!-- header.jsp -->
		<%-- <%@ include file="header.jsp"%> --%>
		<jsp:include page="header.jsp" />

		<!-- center 부분만 페이지 변경하면서 보이기 -->
		<jsp:include page="<%=center%>" />

		<!-- footer.jsp -->
		<%-- <%@ include file="footer.jsp"%> --%>
		<jsp:include page="footer.jsp" />
	</div>

	<!-- 외부라이브러리 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>

<%--
	<%@ include >
 	jsp파일 안에 있는 모든 코드를 현재 페이지로
 	복사해서 한꺼번에 컴파일이 된다. 페이지마다
	 중복되는 코드들이 발생한다. 
 
 	표현식 <%= %> 사용 불가능
 	request 객체는 데이터 공유가 가능하다
 	pageContext 현재 페이지에서만 데이터를 공유
 

	<jsp:include>
 	jsp 파일이 각각 컴파일 
 	main.jsp -> a.jsp -> main.jsp
	
	표현식 <%= %> 사용 가능
	request 객체는 데이터 공유가 가능하다
	pageContext 데이터를 공유X
--%>