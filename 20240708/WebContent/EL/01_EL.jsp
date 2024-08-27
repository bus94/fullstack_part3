<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>01_EL.jsp</title>
</head>
<body>

	<%-- PresonServlet에서 받아온 객체를 출력 
		
		RequestDispatcher
		 페이지 호출 없이 jsp 파일 내에서 다른 파일로 요청을 보내고 바로 응답을 받는 것
		 
		SendRedirect
		 브라우저가 response에 따라서 서버로 지정된 경로를 다시 요청하여 페이지를 호출한다.
		 
		person.getName()
		 자바빈의 속성에 접근할 때 getter메서드를 자동으로 호출한다.
		 person.name → person.getName()
		 
		 java bean 
		 
	--%>
	<h1>Person 정보</h1>
	<p>이름: ${person.name }</p>
	<p>나이: ${person.age }</p>
	
	<% 
		String name = "이서희"; 
	
		request.setAttribute("name", name);
		pageContext.setAttribute("name2", name);
	%>
	<%-- <p><%= name %></p> --%>
	
	<%-- 위의 jsp 코드를 사용하려면 태그가 너무 길고 복잡하다. 
	그래서 더 간편하게 태그 형식으로 출력을 할 수 있는 도구
	: EL
	
	<% %> 기본적으로 EL표기법을 사용하려면 JSP 페이지 내에서 유효한 범위(내장 객체)에 있어야 한다.
	
	스크립틀릿에서 저장한 변수는 사용할 수 없다.
	
	--%>
	
	<p> ${name} </p>
	<p> ${name2} </p>
	
	<%-- 연산자, 비교, 산술, 논리 연산 모두 가능 --%>
	<p> ${2 + 5} </p>
	<p> ${2 - 5} </p>
	<p> ${2 * 5} </p>
	<p> ${2 / 5} </p>
	
	<%-- 논리 연산자를 문자로 작성 --%>
	<ul>
		<li>${10 == 10 and 9 == 9} </li>
		<li>${10 == 10 or 9 == 9} </li>
		<li>${not(10 == 100) and 9 == 9} </li>
	</ul>
	
	<%-- 비교 연산자도 문자를 이용해서 연산자를 대체 할 수 있다. --%>
	<ul>
		<li>${10 lt 9} </li> <%-- 10 < 9 --%>
		<li>${10 gt 9} </li> <%-- 10 > 9 --%>
		<li>${10 le 9} </li> <%-- 10 <= 9 --%>
		<li>${10 ge 9} </li> <%-- 10 >= 9 --%>
		<li>${10 eq 9} </li> <%-- 10 == 9 --%>
	</ul>
	
</body>
</html>