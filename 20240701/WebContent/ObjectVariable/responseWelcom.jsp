<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>responseWelcom.jsp</title>
</head>
<body>
	<h2>로그인 성공!</h2>
	
	<% 
		String id = request.getParameter("id");
		out.println(id + "님 환영합니다!");
	%>
</body>
</html>