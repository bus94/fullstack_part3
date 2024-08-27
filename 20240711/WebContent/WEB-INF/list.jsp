<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 출력!</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">

</head>
<body>

	<div class="container">
		<h2 class="mt-4">게시판 리스트</h2>
		<div align="right">
			<form action="list.nhn" method="get">
				<!-- 선택 값이 변경 될 때 마다 자바스크립트 코드 폼을  자동으로 서버 전송시킨다. -->
				<select name="pageSize" onchange="this.form.submit()">
					<option value="5" ${mvclist.pageSize == 5? 'selected' : ''}>5개씩</option>
					<option value="10" ${mvclist.pageSize == 10? 'selected' : ''}>10개씩</option>
					<option value="15" ${mvclist.pageSize == 15? 'selected' : ''}>15개씩</option>
					<option value="20" ${mvclist.pageSize == 20? 'selected' : ''}>20개씩</option>
				</select> <input type="button" value="검색">
			</form>
			<!-- <form action="list.nhn" method="post">
				<select name="cho" value="pageSize">
					<option value="5">5개씩</option>
					<option value="10">10개씩</option>
					<option value="15">15개씩</option>
					<option value="20">20개씩</option>
				</select> <input type="submit" value="검색">
			</form> -->
		</div>
		<br>
		<table
			class="table table-bordered border-primary table-striped table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>제목</th>
					<th>내용</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${mvclist.list}">
					<tr>
						<td>${board.idx}</td>
						<td>${board.name}</td>
						<td>${board.subject}</td>
						<td>${board.content}</td>
						<td>${board.hit}</td>
						<td>${board.writeDate}</td>
						<%-- <fmt:formatDate value="${board.writeDate}"
								pattern="yyyy.MM.dd(E)" /> --%>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div align="center">
			<c:forEach var="page" begin="1" end="${mvclist.totalPage}" step="1">
				<button type="button" class="btn btn-outline-primary"
					onclick="location.href='?currentPage=${page}&pageSize=${mvclist.pageSize}'">
					${page}</button>
				<!-- <input type="button" value="버튼" align="center"> -->
			</c:forEach>
		</div>

		<div>
			<br>
			<p align="center">긍정!! 오늘도 힘내봅시다! 긍정!!</p>
		</div>

		<!-- 페이징 처리하기
			버튼 만들기
			1. 총 게시글의 개수를 가져오기
			2. 가져온 게시글 + 보여줄 개수
			3. 총 페이지 수를 저장
			4. 현재 페이지 알고 있어야 하고, 그 페이지에 맞는 글을 가져오기 - 글의 시작 번호와 끝 번호를 알고 있어야한다.
			5. service → dao → xml
			6. list.jsp에서 출력하기
		 -->

	</div>




	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<!--  내가 만드는 js 파일! -->
	<script src="${pageContext.request.contextPath}/js/list.js"></script>
</body>
</html>