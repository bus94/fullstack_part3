<%@page import="com.board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>_04boardList.jsp</title>

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
	width: 180px;
	height: 150px;
}
</style>

</head>
<body>
	<%
		// BoardDAO에서 저장된 데이터를 가져와야 된다.
		// ArrayList를 리턴 받아서 저장한다.

		// 테이블에 내가 작성한 글을 출력

		ArrayList<BoardDTO> boardList = BoardDAO.getInstance().getBoardList();
		int count = boardList.size();
		/* int count = BoardDAO.getInstance().getAllCount(); */
		
		// 클라이언트가 요청하는 것은 jsp 파일
		
	%>

	<div class="container" align="center">
		<h2>
			게시글 목록(<%=count%>개)
		</h2>


		<table
			class="table table-striped table-hover table-bordered table_size"
			border="1">
			<tr>
				<td colspan="5"><a href="_02boardWrite.jsp">글쓰기</a></td>
			</tr>

			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>

			<%
				// for(Board temp : boardList) {}
				for (int i = 0; i < boardList.size(); i++) {
					BoardDTO temp = boardList.get(i);
			%>
			<tr>
				<td><%=temp.getNum()%></td>
				<td><%=temp.getWriter()%></td>
				<%-- <td><a href="_05boardInfo.jsp"><%=temp.getSubject()%></a></td> --%>
				<td><a href="_05boardInfo.jsp?num=<%= temp.getNum() %>"><%=temp.getSubject()%></a></td>
				<td><%=temp.getRegDate()%></td>
				<td><%=temp.getReadCount()%></td>
			</tr>
			<% 
				}
			%>

			<!-- <tr>
				<td>1</td>
				<td>null</td>
				<td><a href="_05boardInfo.jsp">1</a></td>
				<td>2024-07-02</td>
				<td>0</td>
			</tr> -->

		</table>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>