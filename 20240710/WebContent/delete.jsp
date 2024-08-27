<%@page import="service.SelectService"%>
<%@page import="dto.GuestbookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제하기</title>
</head>
<body>
	<%
		int idx = Integer.parseInt(request.getParameter("idx"));
		GuestbookDTO post = null;
		SelectService service = SelectService.getInstance();

		post = service.selectByIdx(idx);

		if(post == null) {
			// 데이터가 없기 때문에 수정 또는 삭제할 글이 테이블에 존재하지 않으면	에러메시지를 출력하고 listPro.jsp 페이지 이동
			response.sendRedirect("listPro.jsp");
		} else {
			// 데이터가 있으면
			request.setAttribute("post", post);
		}
	%>

	<form action="deleteOK.jsp" method="post">
		<table width="600" align="center" border="1" cellpadding="5"
			cellspacing="0">
			<tr>
				<th colspan="2">삭제할 글 확인</th>
			</tr>

			<tr>
				<th width="100"><label for="name">이름</label></th>

				<td width="500">${post.name}</td>
				<%-- <th width="100">이름</th>
				<td><input type="text" value="${post.name }"></td> --%>
			</tr>

			<tr>
				<th>작성일</th>
				<td><fmt:formatDate value="${post.writeDate}"
						pattern="yyyy년 MM월 dd일 E요일 a h시 mm분" /></td>
				<%-- <th>작성일</th>
				<td><fmt:formatDate value="${post.writeDate }"
						pattern="yyyy년 MM월 dd일 EE요일 a hh시 mm분" /></td> --%>
			</tr>

			<tr>
				<th><label for="memo">메모</label></th>
				<td><label id="memo" rows="10" name="memo"
					style="resize: none; width: 98%;">${post.memo}</label></td>
				<%-- <th>메모</th>
				<td><input type="text" value="${post.memo }"
					style="width: 400px; height: 200px;"></td> --%>
			</tr>

			<tr align="center">
				<td colspan="2">비밀번호<input type="text" name="password">
					<input type="submit" value="삭제하기"> <input type="reset"
					value="다시쓰기"> <input type="button" value="돌아가기"
					onclick="history.back()">
				</td>
			</tr>

		</table>
		<input type="hidden" name="idx" value="${post.idx}" /> <input
			type="hidden" name="currentPage" value="${currentPage}" />
	</form>
</body>
</html>