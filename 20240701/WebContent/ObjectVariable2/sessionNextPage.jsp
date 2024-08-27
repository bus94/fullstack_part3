<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sessionNextPage.jsp</title>
</head>
<body>
	<h2>sessionNextPage 입니다.</h2>
	<% 
	// 실제 세션 영역은 어떤 타입이 들어올 지 모르기 때문에 Object 타입으로 저장한다.
	// 본인으로 다시 복귀하는 다운캐스팅을 해야된다.
	String id = (String)session.getAttribute("id");
	out.println("session영역 id: " + id);
	%>
</body>
</html>