<%@page import="bookstore.BookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bookstore.BookDAO"%>
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
		// 1. 책의 정보를 가져온다.
		// 2. BookDAO 접근 하기
		// 3. 각각의 분류 book_kind 문학(100), 외국어(200), it서적(300)
		// 4. 책의 정보를 3개씩만 가져와서 반복하면서 출력한다.
		BookDAO dao = BookDAO.getInstance();

		// String book_kind = "";
		// ArrayList<BookDTO> list = dao.getSelectBook(book_kind);
		ArrayList<BookDTO> list =  new ArrayList<>();
		String name = "";

		for (int i = 1; i <= 3; i++) {
			list = dao.getSelectBook(i + "00");

			// 새로운 데이터를 가져올 때 항상 첫 번째 즉 0번째 공간에 데이터를 가져와서 분류를 한다.
			// 만약 switch문에 list.get(j).getBook_kind()라고 하면 j가 3일 땐 결국 인덱스가 3인 데이터를 불러오는데, DB에서 불러오는 내용은 3개씩이므로 에러가 발생할 것이다.
			// ※ switch(j + "00")이라고 써도 잘 출력된다. (- 내가 직접 작성한 내용)
			if (list != null) {
				switch (list.get(0).getBook_kind()) {

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
	<h2>신간 소개</h2>
	<br>
	<h5>
		<%=name%> 분류의 신간 목록: <a href="list.jsp?book_kind=<%=list.get(0).getBook_kind()%>">더보기</a>
	</h5>

	<%
		for (int j = 0; j < 3; j++) {
			
			// 재고 관련
			int book_count = list.get(j).getBook_count();
			String availableSale = "";
			if(book_count > 0) {
				availableSale = "구매 가능";
			} else {
				availableSale = "재고 품절";
			}
	%>
	
	<table class="table table-striped table-bordered">
		<colgroup>
			<col width="150">
			<col width=auto>
			<col width="150">
		</colgroup>
		<tr>
			<td rowspan="6"><img src="img/<%=list.get(j).getBook_image()%>"
				alt="..." width="150" height="200"></td>
			<td><a
				href="bookContent.jsp?book_id=<%=list.get(j).getBook_id()%>"><%=list.get(j).getBook_title()%></a></td>
			<td rowspan="6" class="text-center align-middle fs-5"><%=availableSale%></td>
		<tr>
			<td><%=list.get(j).getPublishing_com()%></td>
		</tr>

		<tr>
			<td><%=list.get(j).getAuthor()%></td>
		</tr>

		<tr>
			<td>정가: <%=list.get(j).getBook_price()%>원
			</td>
		</tr>

		<tr>
			<td class="text-danger">판매금액: <%=(list.get(j).getBook_price()) * (100 - list.get(j).getDiscount_rate()) / 100%>원
			</td>
		</tr>

	</table>
	<%
		}
	%>
	<%
		}
	%>

	<!-- <h1>신간소개</h1><br><br>
	<h5>문학 분류의 신간목록:<a href="#">더보기</h5><br>
	<table>
		<tr>
			<td>
				<img src="img/" >
			</td>
		</tr>
	</table> -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</main>

<%-- <main class="container">

	<%
		// 1. 책의 정보를 가져온다.
		// 2. BookDAO 접근 하기
		// 3. 각각의 분류 book_kind 문학(100), 외국어(200), it서적(300)
		// 4. 책의 정보를 3개씩만 가져와서 반복하면서 출력한다.
		BookDAO dao = BookDAO.getInstance();

		ArrayList<BookDTO> list = dao.getSelectBook("100");
	%>

	<h2>신간 소개</h2>
	<br> <br>
	<h5>문학 분류의 신간 목록: <a href="#">더보기</a></h5>

	<table class="table table-striped table-bordered">
		<colgroup>
			<col width="130">
			<col width=auto>
		</colgroup>
		<tr>
			<td rowspan="6"><img src="img/<%=list.get(0).getBook_image()%>" width="130"
				height="200"></td>

			<td><a
				href="bookContent.jsp?book_id=<%=list.get(0).getBook_id()%>"><%=list.get(0).getBook_title()%></a></td>
		<tr>
			<td><%=list.get(0).getPublishing_com()%></td>
		</tr>

		<tr>
			<td><%=list.get(0).getAuthor()%></td>
		</tr>

		<tr>
			<td>정가: <%=list.get(0).getBook_price()%>
			</td>
		</tr>
		<tr>
			<td>판매금액: <%=list.get(0).getDiscount_rate()%>

			</td>
		</tr>

	</table>

	<!-- <h1>신간소개</h1><br><br>
	<h5>문학 분류의 신간목록:<a href="#">더보기</h5><br>
	<table>
		<tr>
			<td>
				<img src="img/" >
			</td>
		</tr>
	</table> -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</main> --%>