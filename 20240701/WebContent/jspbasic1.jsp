<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jspbasic1.jsp</title>
</head>
<body>
	<!-- 자바 코드를 작성 -->
	<% // 자바 코드를 작성하면 된다.
		Date date = new Date();
	
		// 두 가지 출력 방식
		// 1. 자바 가상머신 즉 시스템 안에서 출력을 하는 것: System.out.println();
		// 2. 웹으로 출력을 하는 것: out.prinln(); → JSP 파일 자체가 웹 프로젝트이기 때문에
		out.println(date);
		
		// 서버에서 코드를 처리하는 언어
		
		// JSP 동작 순서
		// 1. 웹 클라이언트 요청
		// 2. 서버에서 컨테이너(jsp파일을 모아놓은 공간)
		// 	  파일을 찾는다.
		//   - 만약 파일이 없거나 동적 파일이라면 웹 애플리케이션으로 요청
		// 3. 웹 애플리케이션이 DB접근 또는 자체 서버에서 처리할 수 있으면 처리하고 파일을 수정해서 웹 서버로 보낸다.
		// 4. 클라이언트에게 응답한다.
		
	%>
	<p>2024년 7월 1일 9시 35분입니다.</p>
</body>
</html>