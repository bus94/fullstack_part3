<%@page import="rentcar.RentcarDTO"%>
<%@page import="rentcar.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 3개의 이미지를 클릭하면 각각 상세 정보를 출력하는 페이지를 구현하기 -->
<div>
	<%
		RentcarDAO dao = RentcarDAO.getInstance();
		/* System.out.println(dao); */

		// carReserveMain에서 상세페이지를 누르면 no가 넘어온다. 그 하나를 url에서 꺼내기
		int no = Integer.parseInt(request.getParameter("no"));
		RentcarDTO dto = dao.getSelectByNo(no);
		/*out.println(dto); */

		String temp = "";
		int category = dto.getCategory();

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
	%>

	<form action="carMain.jsp?center=carOptionSelect.jsp" method="post">

		<table>
			<tr height="100">
				<td align="center" colspan="3"><font size="6" color="gray">
						<%=dto.getName()%> 차량 선택
				</font></td>
			</tr>
			<tr>
				<td rowspan="6" width="500" align="center"><img alt=""
					src="img/<%=dto.getImg()%>" width="450"></td>
				<td width="250" align="center">차량이름</td>
				<td width="250" align="center"><%=dto.getName()%></td>
			</tr>
			<tr>
				<td width="250" align="center">차량수량</td>
				<td width="250" align="center"><select name="qty">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
				</select></td>
			</tr>
			<tr>
				<td width="250" align="center">차량분류</td>
				<td width="250" align="center"><%=temp%></td>
			</tr>
			<tr>
				<td width="250" align="center">대여가격</td>
				<td width="250" align="center"><%=dto.getPrice()%>원</td>
			</tr>
			<tr>
				<td width="250" align="center">제조회사</td>
				<td width="250" align="center"><%=dto.getCompany()%></td>
			</tr>
			<tr>
				<td width="250" align="center">
					<%-- 이전 차량에 관한 정보 --%> <input type="hidden" name="no"
					value="<%=dto.getNo()%>" /> <input type="hidden" name="img"
					value="<%=dto.getImg()%>" /> <input type="submit"
					value="옵션선택후 구매하기" />
				</td>
			</tr>
		</table>

		<br /> <br /> <br /> <font size="5" color="gray">차랑 정보 보기</font>
		<p>
			<%=dto.getInfo()%>
	</form>

	<%-- <table>
		<tr colspan="2">
			<h2><%=dto.getName()%>
				차량 선택
			</h2>
		</tr>

		<tr>
			<td><img src="img/<%=dto.getImg()%>"></td>
			<td>
				<table>
					<tr>
						<td>차량이름</td>
						<td><%=dto.getName()%></td>
					</tr>

					<tr>
						<td>차량수량</td>
						<td>
							<select>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select>
						</td>
					</tr>

					<tr>
						<td>차량분류</td>
						<td><%=dto.getCategory()%></td>
					</tr>
					
					<tr>
						<td>대여가격</td>
						<td><%=dto.getPrice()%>원</td>
					</tr>
					
					<tr>
						<td>제조회사</td>
						<td><%=dto.getCompany()%></td>
					</tr>
					
					<tr>
						<td>
							<button>옵션선택 후 구매하기</button>
						</td>
					</tr>
				</table>
			</td>
		</tr>

	</table>
	
	<div>
		<h2>차량 정보 보기</h2>
		<p><%=dto.getName()%> 자동차 입니다.</p>
	</div> --%>

</div>