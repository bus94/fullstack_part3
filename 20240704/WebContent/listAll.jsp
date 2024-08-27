<%@page import="bookstore.BookDAO"%>
<%@page import="bookstore.BookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<main class="container">

	<%
		ArrayList<BookDTO> bookList = null;

		// 책의 모든 정보를 가져오기
		BookDAO dao = BookDAO.getInstance();

		String name = "";

		for (int i = 1; i <= 3; i++) {
			bookList = dao.getSelectBook(i + "00");

			if (bookList != null) {

				switch (bookList.get(0).getBook_kind()) {

				case "100":
					name = "문학";
					break;
				case "200":
					name = "외국어";
					break;
				case "300":
					name = "it서적";
					break;
				default:
					name = "미정";
				}

			}
	%>
	<br>
	<h2>
		[<%=name%>]
	</h2>
	<br>

	<%
		for (int j = 0; j < bookList.size(); j++) {

				// 재고 관련
				int book_count = bookList.get(j).getBook_count();
				String availableSale = "";
				if (book_count > 0) {
					availableSale = "구매 가능";
				} else {
					availableSale = "일시 품절";
				}
	%>

	<table class="table table-striped table-bordered">
		<colgroup>
			<col width="150">
			<col width=auto>
			<col width="150">
		</colgroup>
		<tr>
			<td rowspan="6"><img
				src="img/<%=bookList.get(j).getBook_image()%>" alt="..." width="150"
				height="230"></td>
			<td><a
				href="bookContent.jsp?book_id=<%=bookList.get(j).getBook_id()%>"><%=bookList.get(j).getBook_title()%></a></td>
			<td rowspan="6" class="text-center align-middle fs-5"><%=availableSale%></td>
		<tr>
			<td><%=bookList.get(j).getPublishing_com()%></td>
		</tr>

		<tr>
			<td><%=bookList.get(j).getAuthor()%></td>
		</tr>

		<tr>
			<td>내용: <%=bookList.get(j).getBook_content()%>
			</td>
		</tr>

		<tr>
			<td>정가: <%=bookList.get(j).getBook_price()%>원
			</td>
		</tr>

		<tr>
			<td class="text-danger">판매금액: <%=(bookList.get(j).getBook_price()) * (100 - bookList.get(j).getDiscount_rate()) / 100%>원
			</td>
		</tr>

	</table>
	<%
		}
		}
	%>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</main>