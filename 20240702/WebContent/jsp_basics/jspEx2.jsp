<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jspEx2.jsp</title>
</head>
<body>
	<h2>jspEx2 페이지</h2>
	<%
		// 페이지와 페이지끼리 데이터를 공유하는 내장 객체가 있다. 
		// 이것은 톰캣서버가 미리 만들어놓은 것이기 때문에 굳이 생성할 필요없이 이미 만들어진 객체를 사용하면 된다.

		// 내장 객체들은 여러 개의 데이터를 공유해서 페이지끼리 사용하기 위해 어떤 데이터든 저장할 수 있도록 모든 객체를 받는 Object타입
		String[] strlist = (String[]) session.getAttribute("strlist");
		// out.println(strlist);

		// jspEx1.jsp
		// 1. jsp
		// 2. java
		// 3. html
		// 4. Android
	%>

	<%
		for (int i = 0; i < strlist.length; i++) {
	%>
	<p>
		<%=(i + 1)%>.
		<%=strlist[i]%>
	</p>
	<%
		}
	%>


	<%-- <p>1. <%= strlist[0] %></p>
	<p>2. <%= strlist[1] %></p>
	<p>3. <%= strlist[2] %></p>
	<p>4. <%= strlist[3] %></p> --%>

</body>
</html>