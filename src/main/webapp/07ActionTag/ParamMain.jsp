<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String pValue = "방랑시인";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그 - param</title>
</head>
<body>
<!-- 자바빈 생성 : request 영역에 저장 -->
<jsp:useBean id="person" class="common.Person" scope="request" />
<!-- 값 설정 -->
<jsp:setProperty property="name" name="person" value="김삿갓"/>
<jsp:setProperty property="age" name="person" value="56"/>
<!-- 다음 페이지로 포워드. 이 때 3개의 파라미터를 전달한다. -->
<jsp:forward page="ParamForward.jsp?param1=김병연">
	<jsp:param value="경기도 양주" name="param2"/>
	<jsp:param value="<%= pValue %>" name="param3"/>
</jsp:forward>
	<!-- 
	쿼리 스트링으로 param1을 전달하고, 액션 태그를 통해 2개를 전달한다.
	시작 태그와 종료 태그를 나눠서 작성하는 경우, 태그 사이에 HTML 주석을
	기술하면 에러가 발생한다.
	-->
</body>
</html>