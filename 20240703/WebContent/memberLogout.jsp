<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 로그 아웃을 처리하는 페이지
	// 세션 영역에 있는 현재 세션을 닫기 - 무효화
	session.invalidate();
%>

<script>
	// 로그아웃되었다는 alert() 창 띄우기
	alert("로그아웃 되었습니다!");
	location.href="carMain.jsp";
</script>

<%-- <%
	// 메인 페이지로 이동 
	response.sendRedirect("carMain.jsp");
%> --%>
