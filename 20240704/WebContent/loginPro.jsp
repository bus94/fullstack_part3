<%@page import="bookstore.CustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	request.setCharacterEncoding("UTF-8");

	// 1. 아이디와 비밀번호를 form 태그로 전송 되었기 때문에(get/post 방식으로 넘어온 것!) 파라미터로 꺼내기
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");

	int result = CustomerDAO.getInstance().userCheck(id, passwd);

	if (result == 1) {
		// 여러 페이지가 로그인한 id를 공유할 수 있도록
		session.setAttribute("id", id);
%>
<!-- 자바스크립트 코드로 팝업 창 보이기 -->
<
<script>
	alert("로그인이 성공적으로 완료되었습니다.");
	location.href="shopMain.jsp";
</script>
<%
	/* response.sendRedirect("shopMain.jsp"); */
	} else {
%>
<!-- 자바스크립트 코드로 팝업 창 보이기 -->
<script>
	alert("회원 아이디 또는 비밀번호를 확인하세요.");
	history.go(-1); // 이전 페이지 돌아가기
</script>
<%
	}
%>