<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session.jsp</title>
</head>
<body>
	<h2>정보입력 폼</h2>

	<form method="post" action="sessionPro.jsp">
		아이디: <input type="text" name="id" maxlength="50"><br>
		패스워드: <input type="password" name="passwd" maxlength="16"><br>
		<input type="submit" value="정보입력">
	</form>

	<%--
	웹에서는 페이지(page)들이 모여 하나의 요청(request)을 처리하며, 요청들이 모여 하나의 세션(session)을 다시 세션들이 모여 하나의 웹 애플리케이션(application)을 이룬다.
	
	내장 객체
	- 각 객체가 저장되는 메모리의 유효기간
	- jsp 페이지 단위로 구성 4가지 영역으로 나눠져있고 데이터를 공유할 수 있다.
	
	4가지 영역에 데이터를 추가, 삭제, 조회할 수 있다.
	
	page 영역
	- 현재 페이지에서만 변수를 사용할 수 있다.
	- pageContext 객체 사용!
	
	request 영역
	- 하나의 요청에 의해 호출된 페이지 (현재 페이지)
	- 포워드(요청 전달)된 페이지까지 공유한다.
	
	session 영역
	- 클라이언트가 처음 접속한 후 웹 브라우저를 닫을 때까지 공유
	- session 객체 사용!
	
	application 영역
	- 한 번 저장되면 웹 애플리케이션이 종료될 때까지 유지
	- application 객체 사용!
	
	--%>
</body>
</html>