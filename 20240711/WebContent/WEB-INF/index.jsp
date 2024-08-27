<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// index 페이지를 호출하면 바로 응답 새로운 요청
	// 게시글 가져오는 자바 서블릿 호출하기
	response.sendRedirect("list.nhn");

%>