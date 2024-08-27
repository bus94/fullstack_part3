<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sessionNextNextPage.jsp</title>
</head>
<body>
	<h2>sessionNextNextPage 입니다.</h2>
	<% 
	String id = (String)session.getAttribute("id");
	out.println("session영역 id: " + id);
	
	// 시스템 영역 변수 사용하기(내장객체)
	// 영역 변수가 저장되는 기억 공간
	// Map<String, Object>형태의 구조를 가지며 value 자료형은 어떤 자료든 Object
	
	// 영역이름.setAttribute("영역이름변수명", 값)
	%>
</body>
</html>