<%@page import="project.dto.MemberDTO"%>
<%@page import="project.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// ajax로 넘어온 데이터를 객체화 시킨다.
	
	// MemberService 클래스
	// MemberDAO 클래스를 호출해서 비교한 후 세션에 저장하기
	// index.jsp로 이동해서 로그인이 되었는지, 안 되었는지 확인하기
%>
<jsp:useBean id="dto" class="project.dto.MemberDTO">
	<jsp:setProperty name="dto" property="*"/> 
</jsp:useBean>

<%
	System.out.println(dto);

	// Service 호출하기
	// DAO 호출하기
	MemberDTO ansDto = MemberService.getInstance().login(dto);
	if(ansDto != null) {
		session.setAttribute("id", ansDto.getId());
	}
	
	// Ajax() 비동기 통신을 했을 때
	// out.println(); 서버에서 웹으로 데이터를 전송하는 역할로 사용한다. 자바스크립트의 data 변수에 문자 형식으로 들어간다
/* 	response.setContentType("application/json");
	response.setCharacterEncoding("UTF-8"); */
	
	// 처리 결과를 반환한다.
	out.println(ansDto);
%>