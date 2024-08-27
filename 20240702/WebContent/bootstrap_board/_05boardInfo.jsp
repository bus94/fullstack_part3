<%@page import="com.board.BoardDAO"%>
<%@page import="com.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>_05boardInfo.jsp</title>

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
	width: auto;
	height: 200px;
}
</style>

</head>
<body>

	<%
		// url을 타고 넘어온 num값을 꺼낸다.
		// a 링크를 눌렀을 때 다른 페이지 달라는 요청이 들어왔기 때문에 request객체에 자동으로 저장된다. (04번과 05번이 연결된 것!)

		// 문자로 저장된 값을 기본 자료형 int로 변환하기
		int num = Integer.parseInt(request.getParameter("num"));

		// 위의 num을 이용해서 boardDTO 한 건을 가지고 와서 출력하기
		BoardDTO board = BoardDAO.getInstance().getBoardByNum(num);
	%>

	<div class="container" align="center">
		<h2>게시글 내용</h2>

		<form method="post" action="_06boardUpdate.jsp">

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
					<th><%=board.getEmail()%></th>
				</tr>

				<tr>
					<th>제목</th>
					<th><%=board.getSubject()%></th>
					<th>작성일</th>
					<th><%=board.getRegDate()%></th>
				</tr>

				<tr>
					<th>내용</th>
					<td colspan="3" class="memo"><%=board.getContent()%></td>
				</tr>

				<tr>
					<td colspan="4" align="center">
						<input type="hidden" name="num"
						value="<%=board.getNum()%>"> 
						<input type="submit"
						value="수정하기"> 
						<input type="button" value="삭제하기"
						onclick="window.location.href='_08boardDelete.jsp?num=<%=board.getNum()%>'">
						<input type="button" value="목록으로"
						onclick="window.location.href='_04boardList.jsp'"> <!-- <input type="button" value="수정하기" onclick="location.href='_06boardUpdate.jsp'">
					<input type="button" value="삭제하기" onclick="location.href='_08boardDelete.jsp'"> 
					<input type="button" value="목록으로" onclick="location.href='_04boardList.jsp'"> -->
					</td>
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