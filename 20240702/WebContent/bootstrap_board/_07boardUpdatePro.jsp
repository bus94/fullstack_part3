<%@page import="com.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>_07boardUpdatePro.jsp</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	
	<jsp:useBean id="boardDTO" class="com.board.BoardDTO">
		<jsp:setProperty name="boardDTO" property="*" />
	</jsp:useBean>
	
	<%
		BoardDAO.getInstance().boardUpdate(boardDTO);
	
		// 수정하고 이동할 파일명을 작성한다.
		// 새로운 페이지로 이동한다.
		response.sendRedirect("_04boardList.jsp");
	%>
</body>
</html>