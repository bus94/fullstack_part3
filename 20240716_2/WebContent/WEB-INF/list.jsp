<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 (페이징)</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<%
		
	%>

	<div class="container">
		<select id="pagesize">
			<option value="5">5</option>
			<option value="10">10</option>
			<option value="15">15</option>
			<option value="20">20</option>
		</select><input type="button" class="btn btn-primary" id="pageSearch" value="검색">
	
		<table class="table table-bordered">
			<tr>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<tbody id="tbody">
				
			</tbody>
			
		</table>
		<!-- <div align="center">
			<c:forEach var="page" begin="1" end="">
				<button type="button" class="btn btn-outline-primary" id="pageButton"></button>
			</c:forEach>
		</div> -->
	</div>
	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/list.js"></script>
</body>
</html>