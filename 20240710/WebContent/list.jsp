<%@page import="dto.GuestbookList"%>
<%@page import="dto.GuestbookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.SelectService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 보기</title>
</head>
<body>

	<%
		/* // DB에서 select 조회한 결과를 list.jsp에 출력하기
		ArrayList<GuestbookDTO> list = SelectService.getInstance().selectList();
		
		// EL 표기법을 사용하고 싶으면 무조건 list 변수의 내장객체 범위를 지정해야된다.
		request.setAttribute("list", list); */

		// Data의 개수를 저장하는 변수를 생성
		int count = SelectService.getInstance().count();

		request.setAttribute("count", count);

		// 밑의 문장이
		// request.setCharacterEncoding("UTF-8"); 와 같은 내용을 태그 형태로 사용한 것
	%>
	<c:set var="list" value="${guestbookList.list }" />
	<fmt:requestEncoding value="UTF-8" />

	<table width="1000" align="center" border="1">
		<tr>
			<th>방명록 보기</th>
		</tr>

		<tr>
			<td align="right">${count}개(${guestbookList.currentPage } /
				${guestbookList.totalPage })</td>
		</tr>

		<tr>
			<td>
				<!--  만약 데이터가 없으면 테이블에 저장된 글이 없습니다. 
             			만약 데이터가 있다면 데이터를 출력하시오! --> <c:if test="${count == 0}">
					<marquee>테이블에 저장된 글이 없습니다.</marquee>
				</c:if> <c:if test="${count != 0}">
					<jsp:useBean id="date" class="java.util.Date" />
					<c:forEach var="dto" items="${list }">
						<table border="1" width="100%" align="center">
							<tr>
								<td>${dto.idx }.${dto.name }(${dto.ip })님이<fmt:formatDate
										value="${dto.writeDate }" pattern="yyyy.MM.dd(E)" /> 에 남긴 글<input
									type="button" value="수정"
									onclick="location.href='update.jsp?idx=${dto.idx }'"><input
									type="button" value="삭제"
									onclick="location.href='delete.jsp?idx=${dto.idx }'"><br>
									${dto.memo }
								</td>
							</tr>
						</table>
					</c:forEach>
				</c:if>
			</td>
		</tr>
		<!-- 카테고리별 검색어를 입력받는다 -->
		<tr align="center">
			<td>
				<!-- 페이징 처리할 공간 --> <!-- 총 페이지 개수에 따라서 페이지 버튼 생성 --> <c:forEach
					var="i" begin="1"
					end="${guestbookList.totalPage }" step="1">
					<c:if test="${guestbookList.currentPage == i }">
						<button type="button" disabled="disabled">${i }</button>
					</c:if>
					<c:if test="${guestbookList.currentPage != i }">
						<button type="button" onclick="location.href='?currentPage=${i}'">${i}</button>
					</c:if>
				</c:forEach> <!-- <td><input type="button" value="처음"> <input
				type="button" value="이전"> <input type="button" value="1">
				<input type="button" value="다음"> <input type="button"
				value="마지막"></td> -->
			</td>
		</tr>
		<tr align="center">
			<td><form action="listPro.jsp" method="post">
					<select name="category" style="width: 100px; height: 30px;">
						<option>내용</option>
						<option>이름</option>
						<option>내용+이름</option>
					</select> <input type="text" name="item" value="${item }"
						style="width: 200px; height: 25px; padding-left: 10px;"> <input
						type="submit" value="검색" style="width: 100px; height: 30px;" />
				</form></td>
		</tr>
		<tr>
			<td align="right"><input type="button" value="글쓰기"
				onclick="location.href='insert.jsp'" /></td>
		</tr>
	</table>


</body>
</html>