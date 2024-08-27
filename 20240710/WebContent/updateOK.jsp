<%@page import="service.UpdateService"%>
<%@page import="service.SelectService"%>
<%@page import="dto.GuestbookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	int idx = Integer.parseInt(request.getParameter("idx"));
	GuestbookDTO post = null;
	SelectService service = SelectService.getInstance();

	post = service.selectByIdx(idx);

	//GuestbookDTO post = (GuestbookDTO)request.getAttribute("updatepost");
	/* 	System.out.println("updateOK: " + post); */
	String password = request.getParameter("password");
	String memo = request.getParameter("memo");
	String name = request.getParameter("name");
	post.setMemo(memo);
	post.setName(name);

	/* System.out.println("updateOK password: " + password);
	System.out.println("updateOK memo: " + memo);
	System.out.println("updateOK name: " + name); */

	out.println("<script>");
	if (post.getPassword().trim().equals(password)) {
		// 1. 비밀번호 확인 후 일치하면 Service로 보내기
		UpdateService.getInstance().update(post);

		// 2. 정상적으로 서비스 실행되었다면 alert()창으로 완료되었습니다. 출력하기
		out.println("alert('" + post.getIdx() + "번 글 수정완료!')");
	} else {
		// 비밀번호가 오류이면 오류 메시지를 출력한다.
		out.println("alert('비밀번호가 일치하지 않습니다.')");
	}
	out.println("location.href='listPro.jsp'");
	out.println("</script>");
%>