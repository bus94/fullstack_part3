<%@page import="com.board.BoardDAO"%>
<%@page import="com.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int num = Integer.parseInt(request.getParameter("num"));
		String password = request.getParameter("password");
		
		// 1. 비밀번호와 글번호를 BoardDAO 넘기기
		//  boardDelete(num, password)
		
		// 2. delete 메서드가 실행되고 나서 09boardDelete.jsp로 정상적으로 삭제되었는지 팝업창 띄우기
		
		int result = BoardDAO.getInstance().boardDelete(num, password);
		if(result == 1) {
	%>
	<script>
		alert("삭제 되었습니다!");
		window.location.href="_04boardList.jsp";
	</script>
	<%} else {%>
	<script>
		alert("비밀번호를 확인해주세요!");
		history.go(-1); // 이전 페이지로 이동
		// history 객체
		// 브라우저의 내비게이션 (이동한 웹페이지를 기록)
		// go()
		//  메서드를 이용해서 특정 페이지로 이동할 수 있다.
		//  n 양수이면 앞으로 이동, 음수이면 뒤로 이동
		
		// UKFM2039
		// back() 한 페이지 뒤로 이동
		// forward() 한 페이지 앞으로 이동
	</script>
	<%} %>
</body>
</html>