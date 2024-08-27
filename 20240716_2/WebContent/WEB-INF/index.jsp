<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>

	<%-- index.jsp 페이지에서 새로운 요청을 실행한다. 메인컨트롤러가 insertForm.jsp 페이지가 실행될 수 있도록 컨트롤러 설정해야한다. --%>
	
	<% response.sendRedirect("list.do"); %>
</body>
</html>