<%@page import="rentcar.RentcarDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="rentcar.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center">
	<%
		// DB에서 연결하여 자동차 3대만 불러주는 데이터를 가져온다.(최신순)
		RentcarDAO dao = RentcarDAO.getInstance();

		// ArrayList을 이용해서 3대를 저장한다.
		ArrayList<RentcarDTO> list = dao.getSelectCar();
	%>

	<table>
		<tr>
			<td colspan="3">
				<h2>최신형 자동차</h2>
			</td>
		</tr>

		<tr height="250">
			<%
				for (int i = 0; i < list.size(); i++) {
					RentcarDTO dto = list.get(i);
			%>
			<td align="center"><a
				href="carMain.jsp?center=carReserveInfo.jsp?no=<%=dto.getNo()%>">
					<img src="img/<%=dto.getImg()%>" width="300" height="200">
			</a>
				<p>
					차량명:
					<%=dto.getName()%></p></td>
			<%
				}
			%>
		</tr>
	</table>

	<hr size="3" color="red">
	<h3>차량 검색하기</h3>

	<form action="carMain.jsp?center=carCategoryList.jsp" method="post">
		<select name="category">
			<option value="1">소형</option>
			<option value="2">중형</option>
			<option value="3">대형</option>
		</select> <input type="submit" value="검색" />
	</form>

</div>