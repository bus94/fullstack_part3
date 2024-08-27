<%@page import="com.board.BoardDAO"%>
<%@page import="com.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>_08boardDelete.jsp</title>

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
</style>

</head>
<body>

	<%
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDTO board = BoardDAO.getInstance().getBoardByNum(num);
	%>

	<div class="container" align="center">
		<h2>게시글 삭제하기</h2>
		<form method="post" action="_09boardDeletePro.jsp">
			<table
				class="table table-striped table-hover table-bordered table_size"
				border="1">
				<tr>
					<th>비밀번호 입력</th>
					<td><input type="password" name="password"></td>
				</tr>

				<tr>
					<td colspan="2"><input type="hidden" name="num"
						value="<%=num%>"> <input type="submit" value="삭제하기">
						<input type="button" value="목록으로"
						onclick="window.location.href='_04boardList.jsp'"> <!-- <input type="button" value="삭제하기"> <input
					type="button" value="목록으로"
					onclick="location.href='_04boardList.jsp'"></td> -->
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