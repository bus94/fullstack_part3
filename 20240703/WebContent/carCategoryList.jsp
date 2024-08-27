<%@page import="java.util.ArrayList"%>
<%@page import="rentcar.RentcarDAO"%>
<%@page import="rentcar.RentcarDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div style="display: inline-block;" width="1000">
	<%
		RentcarDAO dao = RentcarDAO.getInstance();
		// url에서 넘겨주는 값을 꺼내올 때는 밑의 메서드를 사용한다.
		int category = Integer.parseInt(request.getParameter("category"));
		ArrayList<RentcarDTO> list = dao.getSelectByCategory(category);

		String temp = "";
		switch (category) {
		case 1:
			temp = "소형";
			break;

		case 2:
			temp = "중형";
			break;

		case 3:
			temp = "대형";
			break;
		}

		/* System.out.println(list); */
	%>
	<!--
	1. 카테고리를 이용해서 DB에서 카테고리의 번호로 데이터 전부 가져오기
		DAO 클래스 안에서 getCategory(소형, 중형, 대형) 반환되는 타입은 DTO 저장한다. jsp 페이지로 리턴하기
	
	2. 가져온 데이터를 화면에 출력하기
	-->

	<table>
		<tr>
			<h2><%=temp%>
				자동차
			</h2>
		</tr>

		<tr>
		<%
			for (int i = 0; i < list.size(); i++) {
				RentcarDTO bean = list.get(i);
		%>
			<td>
				<a href="carMain.jsp?center=carReserveInfo.jsp?no=<%=bean.getNo()%>">
					<img src="img/<%=bean.getImg()%>" width="300" height="200"></a>
				<p>차량명 | <%=bean.getName()%></p>
			</td>
		<%} %>
		</tr>
	</table>
</div>



