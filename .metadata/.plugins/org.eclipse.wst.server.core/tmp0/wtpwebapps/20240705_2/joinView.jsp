<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>joinView 페이지</h1>
	
	<p>request: <%=request.getAttribute("dto") %></p>
	<p>session: <%=session.getAttribute("login") %></p>
</body>
</html>