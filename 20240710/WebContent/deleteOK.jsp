<%@page import="service.DeleteService"%>
<%@page import="dto.GuestbookDTO"%>
<%@page import="service.SelectService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	int idx = Integer.parseInt(request.getParameter("idx"));
	GuestbookDTO post = null;
	SelectService service = SelectService.getInstance();

	post = service.selectByIdx(idx);

	String password = request.getParameter("password");

	out.println("<script>");
	if (post.getPassword().trim().equals(password)) {
		// 1. 비밀번호 확인 후 일치하면 Service로 보내기
		DeleteService.getInstance().delete(post);

		// 2. 정상적으로 서비스 실행되었다면 alert()창으로 완료되었습니다. 출력하기
		out.println("alert('" + post.getIdx() + "번 글 삭제완료!')");
	} else {
		// 비밀번호가 오류이면 오류 메시지를 출력한다.
		out.println("alert('비밀번호가 일치하지 않습니다.')");
	}
	out.println("location.href='listPro.jsp'");
	out.println("</script>");
%>
