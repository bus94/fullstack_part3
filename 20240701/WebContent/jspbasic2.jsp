<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	// 선언부
	// 프로그램에서 사용할 변수나 메서드를 정의한다.
	// src폴더로 java 코드를 분리 시킨다.
	String str = "안녕";
	String str2 = "하하";
	Scanner sc = new Scanner(System.in);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jspbasic2.jsp</title>
</head>
<body>

	<h2>처음 만들어보는 JSP</h2>
	<%-- 
		<%= 변수명 %>
		자바 변수를 html 코드에 변수 출력, 메서드 호출
		표현식!
		
		<%@page 지시어: jsp 페이지에 대한 정보를 설정 %>
		<%@ include file = "포함할 파일의 경로"%>
		웹 사이트에서 상단 메뉴나 하단의 정보가 여러 페이지에 반복 사용 될 때 사용하는 키워드
	 --%>
	<h3>처음 만들어서 적은 문자: <%= str %></h3>

	<p>
		<%
		out.println(str2 + "입니다.<br>"); 
		%>
	</p>
	<!-- html 주석 (ctrl + shift + /)
	웹 브라우저에서 주석 표시가 보임 -->
	
	<%-- JSP 주석 (
	웹 브라우저에 표시되지 않는다.
	해당 페이지를(jsp페이지) 처리하는 방법을 지시해주는 역할(지시어)
	
	<% 자바 코드를 작성하는 스크립틀릿 %>
	
	--%>
	
</body>
</html>