<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	// 로그 아웃 버튼을 클릭하면 세션에 있는 내용을 지운다. 닫기. 무효화
	session.invalidate();
%>
<script>
	alert("로그 아웃 되었습니다!");
	location.href="shopMain.jsp";
</script>