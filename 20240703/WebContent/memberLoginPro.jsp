<%@page import="rentcar.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// 회원 아이디와 패스워드가 일치하는지 비교하기 위해 RentcarDAO 객체 불러오기
	RentcarDAO dao = RentcarDAO.getInstance();
	
	// 해당 회원이 있는지 여부를 숫자로 표현
	int result = dao.getMember(id, pw);
	
	// 결과를 받아서 alert() 창을 띄울 것
	if(result == 0) {
%>
<script>
	alert("회원 아이디 또는 비밀번호를 확인하세요.");
	location.href="carMain.jsp?center=memberLogin.jsp";
</script>
<%} else {
	// 로그인이 되었다면 다른 여러 페이지가 로그인 한 아이디값을 공유해서 사용한다. → session에 저장한다.
	// 저장될 땐 Object 타입으로 저장 된다.
	// → 업캐스팅! (따라서 상속 구조로 이루어져있어야한다.)
	session.setAttribute("id", id);
	/* response.sendRedirect("carMain.jsp"); */
%>
<script>
	alert("로그인이 성공적으로 완료되었습니다.");
	location.href="carMain.jsp?center=center.jsp";
</script>
<%} %>

<!-- 객체 생성을 하고 나서(:9) 모든(*) 정보(메서드 포함)를 가져온다(:10) -->
<jsp:useBean id="memberDTO" class="rentcar.MemberDTO">
	<jsp:setProperty name="memberDTO" property="*" />
</jsp:useBean>