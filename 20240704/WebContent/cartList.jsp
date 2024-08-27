<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
	<h2>장바구니</h2>

	<main class="container">

		<br>

		<table class="table table-striped table-bordered">
			<colgroup>
				<col width=auto>
			</colgroup>
			<tr>
				<th>번호</th>
				<th>책이름</th>
				<th>판매가격</th>
				<th>수량</th>
				<th>금액</th>
			</tr>

			<tr>
				<%@ include file="cartInsert.jsp"%>
			</tr>

			<tr>
				<td colspan="5" class="fw-bold">총 금액:</td>
			</tr>

			<tr>
				<td colspan="5" class="text-center"><input type="button"
					value="구매하기"> <input type="button" value="쇼핑계속"
					onclick="window.location.href='shopMain.jsp'"> <input
					type="button" value="장바구니비우기"></td>
			</tr>

		</table>


		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
			crossorigin="anonymous"></script>
	</main>
</body>
</html>