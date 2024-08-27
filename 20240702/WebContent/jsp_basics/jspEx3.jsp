<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jspEx3.jsp</title>
</head>
<body>
	<h2>jspEx3 페이지</h2>
	<%
		try{
		String[] strlist = (String[]) session.getAttribute("strlist1");
	
		
		// 만약 strlist가 비어있다면
		// jspEx1.jsp 파일로 이동
		/* if(strlist == null){
			response.sendRedirect("jspEx1.jsp");
		} */
		
	%>
	<p>1. <%= strlist[0] %></p>
	<p>2. <%= strlist[1] %></p>
	<p>3. <%= strlist[2] %></p>
	<p>4. <%= strlist[3] %></p>
	<%} catch(Exception e) {
		response.sendRedirect("jspEx1.jsp");
	}%>

</body>
</html>