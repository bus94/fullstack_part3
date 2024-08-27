<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	
	String gender = request.getParameter("gender");
	String[] hobbies = request.getParameterValues("hobbies");
	String country = request.getParameter("country");
	String memo = request.getParameter("memo");
	%>
	
	<p>성별: <%=gender %></p>
	<%
		if(hobbies != null) {
	%>
	<p>취미: <%=Arrays.toString(hobbies) %></p>
	<%} else { %>
	<p>선택된 취미가 없습니다.</p>
	<%} %>
	<p>여행 가고 싶은 곳은 <%=country %>입니다.</p>
	<p>메모: <%=memo %></p>
</body>
</html>