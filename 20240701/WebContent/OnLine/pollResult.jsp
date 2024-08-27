<%@page import="OnLine.PollRead"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pollResult.jsp</title>
</head>
<body>
	<%
		String filepath = application.getRealPath("/");
		filepath += "OnLine\\poll.txt";

		ArrayList<String> poll = PollRead.pollRead(filepath);
	%>

	<form action="pollWrite.jsp" method="post">
		<table border="1" width="500" align="center">
			<tr>
				<th><%=poll.get(0)%></th>
			</tr>

			<%
				for (int i = 1; i < 11; i++) {
			%>
			<tr>
				<td><%=poll.get(i)%></td>
			</tr>
			<%
				}
			%>

		</table>
	</form>
</body>
</html>