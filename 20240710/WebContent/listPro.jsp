<%@page import="dto.GuestbookList"%>
<%@page import="dto.GuestbookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.SelectService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// 이전 페이지에서 넘어오는 화면에 표시할 페이지 번호를 받는다.
	// 게시글을 처음 실행하면 현재 페이지가 없다.
	// null 값이 와서 
	int currentPage = 1;
	
	try {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
	} catch(NumberFormatException e) {
	}

	// 카테고리와 검색어를 받는다.
	String category = request.getParameter("category");
	String item = request.getParameter("item");
	
	/* System.out.println(category + ", " + item); */
	
	// 넘어온 검색어가 있으면 카테고리와 검색어를 세션에 저장하고 넘어온 검색어가 없으면 세션에 저장된 카테고리와 검색어를 읽어온다.
	if(item != null) {
		session.setAttribute("category", category);
		// 검색어의 앞과 끝에 공백이 없도록 설정
		item = item.trim().length() == 0 ? "":item;
		session.setAttribute("item", item);
	} else {
		category = (String) session.getAttribute("category");
		item = (String) session.getAttribute("item");
	}
	
	// 브라우저 화면에 표시할 한 페이지 분량의 글 목록을 얻어온다.
	// 검색어가 넘어온 경우 (내용, 이름, 내용+이름) 구별해서 글 목록 가져오기
	SelectService service = SelectService.getInstance();
	
	/* ArrayList<GuestbookDTO> list = null; */
	// 현재 페이지와 보여질 데이터의 개수
	// 여러 개의 데이터를 저장하는 GuestbookList 클래스를 이용해서 객체 생성을 한다.
	GuestbookList guestbookList = null;
	
	// 검색어가 없는 경우 고려하기
	if(item == null || item.trim().length() == 0) {
		// 검색어 없을 경우 전체 조회
		guestbookList = service.selectList(currentPage);
	} else if(category.equals("내용")) {
		// 내용으로 검색할 경우 item(검색어)
		guestbookList = service.selectListMemo(currentPage, item);
	} else if(category.equals("이름")) {
		// 이름과 카테고리로 검색하는 메서드
		guestbookList = service.selectListName(currentPage, item);
	} else if(category.equals("내용+이름")) {
		// 내용+이름으로 걸색하는 메서드
		guestbookList = service.selectListTotal(currentPage, item);
	}
	
	// 내장 객체 저장하기
	request.setAttribute("guestbookList", guestbookList);
	
	System.out.println(guestbookList);
	
	// request 영역에 저장된 글 목록을 브라우저에 출력하는 페이지로 넘겨준다.
	pageContext.forward("list.jsp");
%>