<%@page import="bookstore.BookDTO"%>
<%@page import="bookstore.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
	<%
		// 1. url 요청으로 넘어온 book_id값 꺼내기
		// 2. 로그인 유무에 따라서 session영역 확인
		// 3. 책 한건의 정보를 가져오기 
		//    DAO 접근해서 메서드 호출해서 데이터
		//    가져오기 

		String book_id = request.getParameter("book_id");
		System.out.println(book_id);
		String id = (String) session.getAttribute("id");
		System.out.println(id);

		if (id == null) {
			id = "not";
		}

		BookDAO dao = BookDAO.getInstance();
		System.out.println(dao);
		BookDTO dto = dao.getBook(Integer.parseInt(book_id));
		System.out.println(dto);
	%>

	<main class="container">

		<br>

		<%
			// 재고 관련
			int book_count = dto.getBook_count();
			String availableSale = "";
			if (book_count > 0) {
				availableSale = "구매 가능";
			} else {
				availableSale = "일시 품절";
			}
		%>

		<form action="cartInsert.jsp" method="post">
			<table class="table table-striped table-bordered">
				<colgroup>
					<col width="150">
					<col width=auto>
					<col width="150">
				</colgroup>
				<tr>
					<td rowspan="6"><img src="img/<%=dto.getBook_image()%>"
						alt="..." width="150" height="230"></td>
					<td><a href="bookContent.jsp?book_id=<%=dto.getBook_id()%>"><%=dto.getBook_title()%></a></td>
					<td rowspan="6" class="text-center align-middle fs-5"><%=availableSale%></td>
				<tr>
					<td><%=dto.getPublishing_com()%></td>
				</tr>

				<tr>
					<td><%=dto.getAuthor()%></td>
				</tr>

				<tr>
					<td>내용: <%=dto.getBook_content()%>
					</td>
				</tr>

				<tr>
					<td>정가: <%=dto.getBook_price()%>원
					</td>
				</tr>

				<tr>
					<td class="text-danger">판매금액: <%=(dto.getBook_price()) * (100 - dto.getDiscount_rate()) / 100%>원
					</td>
				</tr>

				<tr>
					<td colspan="3" class="text-center">
						<!-- 수량 옆에 버튼을 생성 --> 수량: <input type="text" name="buy_count"
						value="1">개 <%
							if (!id.equals("not")) {
						%> <input type="button" value="장바구니에 담기"> 
						<!-- 기존에 저장되어있는 정보를 같이 넘기기 -->
						<input type="hidden" name="book_id" value="<%=book_id%>">
						<input type="hidden" name="book_image"
						value="<%=dto.getBook_image()%>"> <input type="hidden"
						name="book_title" value="<%=dto.getBook_title()%>"> <input
						type="hidden" name="book_price" value="<%=dto.getBook_price()%>">
						<%
							}
						%> <input type="button" value="메인으로"
						onclick="window.location.href='shopMain.jsp'">
					</td>
				</tr>

			</table>
		</form>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
			crossorigin="anonymous"></script>
	</main>
</body>
</html>