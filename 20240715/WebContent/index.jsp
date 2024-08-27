<%@page import="service.MvcBoardService"%>
<%@page import="dto.MvcBoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// MvcBoardService 클래스 호출
		ArrayList<MvcBoardDTO> list = MvcBoardService.getInstance().selectAll();
	
		// EL 태그 사용하려면 내장 객체에 저장해야한다.
		request.setAttribute("list", list);
		
		// data의 개수를 반환해서 출력하는 명령문 (페이징 처리를 위함)
		// 1. DB 접근을 위해 연결 정보 가져오기 MvcBoardService클래스로
		// 2. count 메서드 생성
		// 3. mapper 가져오고 dao 호출
		// 4. xml 파일과 연결할 id 값 생성
		// 5. xml에 있는 sql 실행하고
		// 6. 결과를 리턴 받아 EL 태그 사용하기위해 내장 객체 반드시 저장하기
		int count = MvcBoardService.getInstance().count();
		request.setAttribute("count", count);
		
		// 한 건 조회
		// 1. 글 번호를 알아야한다.
		// 2. Service 클래스로 넘긴다.
		// 3. DB 연결 정보 가져오고, dao 호출
		// 4. dao, xml 파일을 호출
		// 5. sql문이 실행
		// 6. dao 한테 결과 전송
		// 7. index.jsp로 리턴
		// 8. 내장객체에 저장해서 출력하기
		MvcBoardDTO dto = MvcBoardService.getInstance().selectByIdx(2);
		request.setAttribute("dto", dto);
		
		// 업데이트
		// 1. 수정할 subject 제목, content 내용 저장하기
		// 2. Service 클래스로 제목과 내용 보내기
		// 3. DB 정보 가져오고 DAO 호출
		// 4. dao에서 sql 호출(id값 생성)
		// 5. sql 실행하면 결과
		// 6. service 수정된 dto 가져오기
		// 7. index.jsp로 리턴
		// 8. 내장객체에 저장해서 출력
		
		// mybatis에서 변수값을 사용하려면 #{변수명}
		MvcBoardDTO updateDTO = MvcBoardService.getInstance().update(1, "수정제목", "수정내용");
		request.setAttribute("updateDTO", updateDTO);
		
		// 1. update시 기존 내용이 사라짐
		//		기존 내용은 있고, 새로운 내용만 추가하기
		// 		객체를 복사 후 setter/getter 이용해서 추가하기
		// 2. 삭제
		
		// 삭제 후 내용
	/* 	MvcBoardDTO deleteDTO = MvcBoardService.getInstance().delete(33);
		request.setAttribute("deleteDTO", deleteDTO); */
		
		// 3. 페이징처리
	%>
	
	<%-- ${list} --%>
	
	<h2>한 건 수정하기</h2>
	<p>${updateDTO}</p>
	
	<h2>한 건 조회</h2>
	<p>${dto}</p><br><br>
	
	<p>데이터의 총 개수: ${count}

	<%-- 
		마이바티스(Mybatis)
		- 자바 객체 간의 매핑 지원한다.
		- sql 쿼리를 좀 더 쉽게 관리할 수 있도록 분리시키고 자동으로 매칭시켜주는 것
		
		- 동적 쿼리문 지원
			쿼리문 자체에 if, foreach 지원
		
		- 마이바티스 설정
		  1. DB 연결정보 파일 (ex. db.properties: driver, url, username, password)
		  2. sql문 저장하는 파일 (ex. mvcboard.xml)
		  3. config 파일 (ex. config.xml)
		  4. 위의 내용을 객체로 생성하는 자바 파일 (ex. MySession.java)
	 --%>
	 
	 
	 
</body>
</html>