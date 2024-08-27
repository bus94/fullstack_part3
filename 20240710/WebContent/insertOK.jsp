<%@page import="service.InsertService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="dto" class="dto.GuestbookDTO">
	<jsp:setProperty property="*" name="dto" />
</jsp:useBean>

<%-- ${dto} --%>

<%
	// Service 클래스
	// - sql 명령을 실행하기 전에 전처리 작업을 수행하는 클래스
	// 	ibatis의 객체를 반환 받는다.

	// insesrt.jsp 에서 넘어온 데이터를 객체로 만들고 guestbook 테이블에 저장하기 위해서 service안에 insert() 메서드를 호출한다.
	InsertService.getInstance().insert(dto);
	response.sendRedirect("listPro.jsp");
%>