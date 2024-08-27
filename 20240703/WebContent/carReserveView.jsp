<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<%
		request.setCharacterEncoding("UTF-8");
		// 예약확인 페이지
		// 로그인이 되어있으면 예약 내역을 보여준다.
		// DAO 현재 예약된 아이디를 이용해서 내용 가져오기

		String id = (String) session.getAttribute("id");

		if (id == null) {
	%>

	<script>
		alert("로그인 후 예약 확인이 가능합니다.");
		location.href = "carMain.jsp?center=memberLogin.jsp";
	</script>

	<%
		}
	%>

	<table align="center">
		<tr height="100">
			<td align="center"><font size="6" color="gray"> 차량 예약 완료
					화면 </font></td>
		</tr>
		<table class="table table-striped table-bordered table-hover">
			<tr height="50">
				<td align="center"><font size="5" color="black">이미지 </font></td>
				<td align="center"><font size="5" color="black">이름</font></td>
				<td align="center"><font size="5" color="black">대여일 </font></td>
				<td align="center"><font size="5" color="black">대여기간</font></td>
				<td align="center"><font size="5" color="black">금액</font></td>
				<td align="center"><font size="5" color="black">수량</font></td>
				<td align="center"><font size="5" color="black">보험</font></td>
				<td align="center"><font size="5" color="black">wifi</font></td>
				<td align="center"><font size="5" color="black">베이비시트</font></td>
				<td align="center"><font size="5" color="black">네비게이션</font></td>
				<td align="center"><font size="5" color="black">삭제</font></td>
			</tr>
		</table>
	</table>
</div>

