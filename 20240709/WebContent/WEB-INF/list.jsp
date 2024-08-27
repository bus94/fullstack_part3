<%@page import="dto.MvcBoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<style>
a {
	color: black;
	text-decoration: none;
}

a:hover {
	color: red;
	text-decoration: none;
	font-weight: bold;
}
</style>

</head>
<body>

	<table align="center" border="1" width="1000">
		<colgroup>
			<col width="70">
			<col width="620">
			<col width="110">
			<col width="130">
			<col width="70">
		</colgroup>
		<tr align="center">
			<td colspan="5">게시판 보기</td>
		</tr>

		<tr align="right">
			<td colspan="5">4(1 / 1)</td>
		</tr>

		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>이름</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>

		<%-- <c:set var="" value=${list } /> --%>

		<!-- 만약 데이터가 없으면 "테이블에 저장된 글이 없습니다." 출력하기(marquee 태그로) -->
		<c:if test="${boardList == null }">
			<td colspan="5"><marquee>테이블에 저장된 글이 없습니다.</marquee></td>
		</c:if>
		<!-- 만약 데이터가 있다면 배열에서 값을 가져오는 반복문 실행 -->
		<c:if test="${boardList != null }">
			<%--for(타입 변수명: 배열,map,list 같은 문법 --%>
			<c:forEach var="dto" items="${boardList }">
				<tr align="center">
					<td>${dto.idx }</td>
					<td align="left"><a href="contentView.nhn?idx=${dto.idx }">${dto.subject }</a></td>
					<td>${dto.name }</td>
					<!-- jstl에서 제공하는 태그 라이브러리 중 날짜, 시간 등의 형식을 지정할 수 있는 태그
					: fmt -->
					<td><fmt:formatDate value="${dto.writeDate }"
							pattern="yyyy.MM.dd.(E)" /></td>
					<td>${dto.hit }</td>
				</tr>
			</c:forEach>
			<%-- <c:forEach var="i" begin="0" end="3">
				<tr align="center">
					<td>${boardList.get(i).getIdx() }</td>
					<td align="left">${boardList.get(i).getSubject() }</td>
					<td>${boardList.get(i).getName() }</td>
					<td>${boardList.get(i).getWriteDate() }</td>
					<td>${boardList.get(i).getHit() }</td>
				</tr>
			</c:forEach> --%>
		</c:if>
		<tr align="center">
		<!-- 페이징 처리할 공간 -->
			<td colspan="5"><input type="button" value="처음"> <input
				type="button" value="이전"> <input type="button" value="1">
				<input type="button" value="다음"> <input type="button"
				value="마지막"></td>
		</tr>

		<tr align="right">
			<td colspan="5"><input type="button" value="글쓰기" onclick="location.href='insert.nhn'"></td>
		</tr>
		
		<!-- 클릭했을 때 (onclick 실행할 때) 자바스크립트 코드를 지정
		: location.href
		현재 브라우저의 URL을 변경할 때 사용하는 것!
		location 객체는 브라우저의 위치(주소) 정보를 제공한다.
		href 속성 현재 페이지의 URL을 나타낸다.
		-->
		
		
	</table>
</body>
</html>