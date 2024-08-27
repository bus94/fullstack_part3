<%@page import="memberlist.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberOK2.jsp</title>
</head>
<body>
	<%-- reauest영역으로 vo3변수를 공유해서 사용한다. useBean 태그를 이용해서 데이터를 출력
		1. memberOK2.java 파일을 memberOK.jsp 파일에 포함하기
		2. 응답 객체에서 forward() 메서드 
	--%>
	<h2>memberOK2 페이지입니다.</h2>

	<%
		Member vo = (Member) session.getAttribute("vo");
	%>
	
	<p>
		member변수:
		<%=vo%></p>
	
	
	<%-- <jsp:useBean id="vo" class="memberlist.Member">
		<jsp:setProperty property="*" name = "vo" />
	</jsp:useBean>--%>
	
	<%-- <p>아이디: <jsp:getProperty name="vo" property="id"/></p>  --%>

	<%-- <p>
		member변수:
		<%=vo%></p> --%>
	<%-- <p>
		member이름:
		<%=vo.getName()%></p>
	<p>
		member아이디:
		<%=vo.getId()%></p>
	<p>
		member비밀번호:
		<%=vo.getPassword()%></p>
	<p>
		member나이:
		<%=vo.getAge()%></p> --%>

</body>
</html>