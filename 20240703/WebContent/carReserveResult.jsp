<%@page import="rentcar.RentcarDTO"%>
<%@page import="rentcar.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center">
	<%
		request.setCharacterEncoding("UTF-8");

		// 1. 로그인이 되었는지 안 되어있는지 확인
		// 2. 넘어온 CarReserveDTO 타입으로 저장
		// 3. 결과 창에 차량의 정보 얻어오기
		// 4. 차량 총 금액
		// 5. 옵션 선택 금액 계산 (선택시 1) 10000원씩 추가
	%>

	<jsp:useBean id="rbean" class="rentcar.CarReserveDTO">
		<jsp:setProperty name="rbean" property="*" />
	</jsp:useBean>

	<%
		// getParameter()
		// - Http 요청(get, post 요청 시)시 문자열 또는 폼 데이터에서 값을 가져올 때 사용
		// - 주로 클라이언트가 폼을 제출할 때 사용
		// - 클라이언트(브라우저)에서 서버로 전달된 데이터를 가져올 때
		// get, post 등의 데이터 주고 받을 때

		// 로그인 처리
		// set/getAttribute()
		// - 서버 사이드(서버 안)에서 데이터를 공유할 때 주로 사용
		// - jsp에서 jsp로 데이터를 전달할 때 사용
		// - forward(현재 페이지에서 다음 페이지로 넘어갈 때), include(페이지를 포함할 때) 일 때 주로 사용
		// 페이지끼리 데이터 주고 받을 때
		String id = (String) session.getAttribute("id");
		// id는 여러 페이지에서 쓰이므로 request보다 큰 개념인 session을 이용한 것

		if (id == null) {
	%>

	<script>
		alert("로그인 후 예약 가능합니다.");
		location.href = "carMain.jsp?center=memberLogin.jsp";
	</script>

	<%
		}
		// 날짜 비교
		// Date 클래스 안에 compareTo() 메서드 비교 
		// - 예약 날짜가 현재 날짜보다 이전이라면 음수, 음수이면 alert() 창 띄우기
		// 결과를 받았을 때 로그인, 날짜 모두 정상이라면 데이터 저장해서 결과 페이지 보여주기
		/* out.println(rbean); - id: null이 나옴 */
		rbean.setId(id);

		// 위의 예약을 DAO로 보내서 저장(추가)
		RentcarDAO dao = RentcarDAO.getInstance();
		dao.setReserveCar(rbean);

		// rbean에는 차량의 가격이 저장되어있지 않으므로, DAO 메서드로 차량의 가격 정보를 불러와야한다.
		RentcarDTO carInfo = dao.getSelectByNo(rbean.getNo());

		// 차량 가격, 차량 수량, 대여일 수
		int totalCar = carInfo.getPrice() + rbean.getQty() + rbean.getDday();

		// 옵션 금액을 확인하고 총 금액에 추가하기
		int usein = (rbean.getUsein() == 1 ? 10000 : 0);
		int usewifi = (rbean.getUsewifi() == 1 ? 10000 : 0);
		int useseat = (rbean.getUseseat() == 1 ? 10000 : 0);

		// 선택하면 이벤트로 3일 내내 1만원씩만 추가하면 사용 가능한지, 사용하는 일마다 추가하는 등의 조건 달면 된다. - 여기는 연습이므로 조건 없이 진행
		int totalOption = (usein + usewifi + useseat) * rbean.getDday();
	%>

	<table>
		<tr height="100">
			<td align="center"><font size="6" color="gray"> 차량 예약 완료
					화면 </font></td>
		</tr>
		<tr height="100">
			<td align="center"><img src="img/<%=carInfo.getImg()%>"
				width="470" /></td>
		</tr>
		<tr height="50">
			<td align="center"><font size="5" color="black"> 차량 총 예약 금액
					<%=totalCar%> 원
			</font></td>
		</tr>
		<tr height="50">
			<td align="center"><font size="5" color="black"> 차량 총 옵션 금액
					<%=totalOption%> 원
			</font></td>
		</tr>
		<tr height="50">
			<td align="center"><font size="6" color="red" style="font-weight: bold"> 차량 총 금액 <%=totalOption + totalCar%>
					원
			</font></td>
		</tr>
	</table>
</div>


