<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dto.Person"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl01.jsp</title>
</head>
<body>
	<%--
		JSTL(JSP Standard Tag Library)
		- EL 태그 처럼 JSP 페이지에서 자바코드를 사용하지 않기 위한 도구
		- 조건문, 반복문을 태그 형태로 지원
		- JSTL 사용하면 <% %> 스크립틀릿 내용 없이 간결하게 태그 형태로 사용할 수 있다.
		
		JSTL을 사용하기 위해선 라이브러리를 추가해야한다.
		
		라이브러리를 추가하는 방법
		1) WebContent → WEB-INF → lib → jstl-1.2.jar
		2) build path → add to build path 클릭
		3) taglib 태그 명령문을 추가
		
		jstl도 가운데 content 내용이 없다면
		닫는 태그를 같이 써도 된다. → <c:set />
		 EL에서 사용할 변수나 자바빈즈를 생성할 때 사용한다.
		 영역에 속성을 저장할 때는 setAttribute() 메서드와 같은 역할
		 
		 <c:set var="변수명" value="값" scope="영역" />
			var → 변수명을 설정한다.
			value → 변수에 저장할 데이터
			scope → session, pageContext, Application, request 내장 객체에 저장할 수 있다.
					기본적으로 저장되는 곳은 pageContext
			target → 자바빈즈 설정
			property → 자바빈즈 속성 set/getter
	 --%>

	<h2>JSTL core 태그 예제</h2>
	<c:set var="dirVar" value="100" />
	<c:set var="dirVar2" value="${ dirVar mod 5 }" />
	<c:set var="dirVar3" value="<%=new Date()%>" />
	<c:set var="dirVar4"> 
		변수 값 이렇게 설정
	</c:set>

	<h4>자바 빈즈 생성 1 - 생성자를 이용</h4>
	<c:set value='<%=new Person("홍길동", 20)%>' var="personVar1"
		scope="request" />
	<!-- jstl에서 변수를 저장할 때 각각의 영역이 다르면 중복되는 변수명을 쓸 수 있다. 
		pageContext 먼저 검색하여 personVar1이 있으면 그 값을 출력하고 없으면 request로 가서 검색해서 있으면 출력
		없으면 session에서 변수를 검색하고 있으면 출력, 없으면 application 영역으로 가서 검색
		있으면 출력하고, 없으면 아무것도 출력하지 않거나 null 값을 반환한다.
	-->
	<c:set value='<%=new Person("김준완", 31)%>' var="personVar1" />

	<ul>
		<li>dirVar: ${dirVar}</li>
		<li>dirVar2: ${dirVar2}</li>
		<li>dirVar3: ${dirVar3}</li>
		<li>dirVar4: ${dirVar4}</li>

		<li>이름: ${personVar1.name}</li>
		<li>나이: ${personVar1.age}</li>

		<li>request 이름: ${requestScope.personVar1.name}</li>
		<li>request 나이: ${requestScope.personVar1.age}</li>
	</ul>

	<%
		ArrayList<Person> pList = new ArrayList<Person>();

		pList.add(new Person("홍길동", 20));
		pList.add(new Person("이익준", 24));
	%>

	<c:set var="personList" value='<%=pList%>' scope="request" />

	<p>이름: ${personList[0].name }</p>
	<p>나이: ${personList[0].age }</p>
	<p>이름: ${personList[1].name }</p>
	<p>나이: ${personList[1].age }</p>

	<h4>Map 구조 이용하기</h4>
	<%
		Map<String, Person> pMap = new HashMap<>();
		pMap.put("person1", new Person("지웅", 30));
		pMap.put("person2", new Person("희웅", 50));
	%>

	<c:set var="personMap" value='<%=pMap%>' scope="session" />

	<p>이름: ${personMap.person1.name }</p>
	<p>나이: ${personMap.person1.age }</p>
	<p>이름: ${personMap.person2.name }</p>
	<p>나이: ${personMap.person2.age }</p>

	<!-- 변수를 삭제 -->

	<c:remove var="personMap" scope="session" />

	<h4>personMap 삭제 후 출력</h4>
	<p>이름: ${personMap.person1.name }</p>
	<p>나이: ${personMap.person1.age }</p>

	<!-- 중복 되는 변수명들이 내장 객체 안에 있다.
	personVar1  page,request 삭제 -->

	<c:remove var="personVar1" scope="request" />

	<h4>중복되는 변수를 삭제했을 때 출력</h4>

	<ul>
		<!-- pageContext 영역 -->
		<li>이름: ${personVar1.name}</li>
		<li>나이: ${personVar1.age}</li>

		<!-- request 영역 -->
		<li>request 이름: ${requestScope.personVar1.name}</li>
		<li>request 나이: ${requestScope.personVar1.age}</li>
	</ul>

</body>
</html>