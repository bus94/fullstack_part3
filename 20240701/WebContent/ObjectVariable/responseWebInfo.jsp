<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>responseWebInfo.jsp</title>
</head>
<body>
	<%--
	response 객체
	클라이언트의 요청에 대한 응답을 웹 브라우저로 보내주는 역할
	- 페이지 이동을 위한 리다이렉트(redirect)
	- html a 태그, 자바스크립트 loaction 객체랑 동일하다.
	- sendRedirect() 메서드로 페이지 이동
	- request의 데이터 값을 가지고  이동하지 않는다.
	--%>
	
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("user_pwd");
		
		if(id.equalsIgnoreCase("qwer") && pw.equalsIgnoreCase("1234")) {
			// 만약 로그인이 되었다면 sendRedirect()
			// 원하는 데이터가 있다면 url 뒤쪽에 가져갈 데이터를 작성한다.
			// ? 뒤에 변수명=값
			// url에는 공백이 들어가면 안 된다.
			response.sendRedirect("responseWelcom.jsp?id=" + id);
		}
	%>
</body>
</html>