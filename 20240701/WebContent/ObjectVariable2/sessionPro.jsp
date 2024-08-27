<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sessionPro.jsp</title>
</head>
<body>
	<%
		// form에서 넘어온 데이터를 세션에 저장
		String id = request.getParameter("id");
		String pw = request.getParameter("passwd");
		
		// form에서 넘어온 값을 다시 다른 웹 페이지도 사용할 수 있도록 공유의 범위를 넓힌다.
		// setAttribute(변수명, 값);
		// 저장할 때의 타입이 Object이므로 어떤 타입이든 다 저장이 가능하다.
		session.setAttribute("id", id);
		session.setAttribute("passwd", pw);
	%>
	
	id와 password 세션에 저장 했습니다!<br>
	id 속성의 값을 꺼낼 때 <%= session.getAttribute("id") %><br>
	pw 속성의 값을 꺼낼 때 <%= session.getAttribute("passwd") %><br>
	
	<a href="sessionNextPage.jsp">다음 페이지 이동</a>
</body>
</html>