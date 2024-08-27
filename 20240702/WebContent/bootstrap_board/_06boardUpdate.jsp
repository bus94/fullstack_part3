<%@page import="com.board.BoardDAO"%>
<%@page import="com.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>_06boardUpdate.jsp</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<style>
body {
	padding: 50px;
}

.table_size {
	width: auto;
}

.memo {
	width: 100%;
	height: 200px;
}
</style>

</head>
<body>

	<%
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDTO board = BoardDAO.getInstance().getBoardByNum(num);
	%>

	<div class="container" align="center">
		<h2>게시글 수정하기</h2>

		<form method="post" action="_07boardUpdatePro.jsp">
			<table
				class="table table-striped table-hover table-bordered table_size"
				border="1">
				<tr>
					<th>번호</th>
					<th><%=board.getNum()%></th>
					<th>조회수</th>
					<th><%=board.getReadCount()%></th>
				</tr>

				<tr>
					<th>작성자</th>
					<th><%=board.getWriter()%></th>
					<th>이메일</th>
					<th><input type="email" name="email"
						value="<%=board.getEmail()%>"></th>
				</tr>

				<tr>
					<th>제목</th>
					<th><input type="text" name="subject"
						value="<%=board.getSubject()%>"></th>
					<th>작성일</th>
					<th><%=board.getRegDate()%></th>
				</tr>

				<tr>
					<th>내용</th>
					<td colspan="3"><textarea rows="10" cols="50" name="content"><%=board.getContent()%></textarea> <%-- <input type="text" name="memo" class="memo"
						placeholder="<%=board.getContent()%>"> --%></td>
				</tr>

				<tr>
					<td colspan="4" align="center"><input type="hidden" name="num"
						value="<%=board.getNum()%>"><input type="submit" value="수정하기">
						<input type="reset" value="다시작성하기"> <input type="button"
						value="목록으로" onclick="window.location.href='_04boardList.jsp'"></td>
				</tr>

			</table>
		</form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>