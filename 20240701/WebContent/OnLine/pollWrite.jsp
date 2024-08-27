<%@page import="OnLine.PollRead"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pollWrite.jsp</title>
</head>
<body>
	<h2>pollWrite 페이지</h2>

	<%-- 라디오 버튼을 클릭했을 때 데이터를 웹 화면으로 출력하기 --%>

	<%
		// 한글 깨짐 방지
		request.setCharacterEncoding("UTF-8");

		String temp = request.getParameter("poll");
		out.println(temp);
		
		try{
			String filepath = application.getRealPath("/") + "OnLine\\poll.txt";
			
			ArrayList<String> poll = PollRead.pollRead(filepath);
			
			// poll.txt 파일에서 팀명만 가져와서 출력하고 개수도 저장하기
			int itemCount = 10; // 미완성:  2024-07-01 기준
			
			// 넘어온 투표 데이터가 정상적인 투표 범위라면 카운트 올려주기
			if(temp != null && temp.trim().length() != 0) {
				
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}

		// 에러 체크
		// 투표 데이터가 넘어왔는지, null 또는 공백이 아닌지 검사하기!
		// 검사했을 때 null이면 "null 입니다. 제대로 입력하세요!" 출력하기
		

	%>



</body>
</html>