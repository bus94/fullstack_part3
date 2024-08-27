<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shopMain.jsp</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
	
</head>
<body>
	<%
		String center = request.getParameter("center");

		if (center == null) {
			center = "center.jsp";
		}
	%>

	<div class="container mt-3">
		<table class="table table-bordered">
		<colgroup>
			<col width=25%>
			<col width=75%>
		</colgroup>
			<tr>
				<jsp:include page="header.jsp" />
			</tr>

			<tr>
				<td><jsp:include page="left.jsp" /></td>
				<td><jsp:include page="<%=center%>" /></td>
			</tr>

			<tr>
				<td colspan="2"><jsp:include page="footer.jsp" /></td>
			</tr>
		</table>
	</div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>