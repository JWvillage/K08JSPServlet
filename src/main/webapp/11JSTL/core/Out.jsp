<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - out</title>
</head>
<body>
<!--  
out 태그
	: 영역에 저장된 변수를 출력할 때 사용한다.
	escapeXml속성이 true이면 HTML태그가 그대로 출력된다. innerText()와 동일하다.
-->
<!-- 변수 선언. <i>태그를 포함한 문자열 -->
<c:set var="iTag">
	i태그는 <i>기울임</i>을 표현합니다.
</c:set>

<!-- escapeXml 속성은 true가 default 값이다. 즉, HTML태그가 그대로 출력된다. -->
<h4>기본 사용</h4>
<c:out value="${ iTag }" />

<!-- escapeXml 속성이 false가 되면 HTML태그가 적용되어 출력된다. innerHTML()과 동일하다. -->
<h4>escapeXml 속성</h4>
<c:out value="${ iTag }" escapeXml="false" />

<!-- 최초 실행 시에는 파라미터가 없는 상태이므로 default값이 출력된다. -->
<h4>default 속성</h4>
<c:out value="${ param.name }" default="이름없음" />
<!-- value 속성이 null일 때만 default값이 출력되고, 빈 값인 경우에는 출력되지 않는다. -->
<c:out value="" default="빈 문자열도 값입니다." />

<!-- 
최초 실행시 js라는 파라미터가 없는 상태이므로 default로 지정된 EL이 실행된다.
EL은 Javascript 실행을 위해 제작한 JSFunction 클래스의 alertMsg() 메소드를 호출하고 있다.
<script>를 포함한 문자열이 HTML문서에 출력되면 JS함수가 실행되므로 escapeXml 속성을 false로 지정하면 된다.
-->
<h4>default속성을 활용하여 Javascript함수 실행하기</h4>
<c:out value="${ param.js }" escapeXml="false" default="${ JSFunction.alertMsg('하하하', out) }" />

<h4>번외</h4>
<!-- 
if문으로 param.name이 아이유일 때 result 값에 
JSFunction.alertBack("좋아요", out); 를 넣고
-->
<c:if test="${ param.name eq '아이유' }" var="result">
	<%--
		JSFunction.alertBack("좋아요", out);
	--%>
	<span style="color: blue"> 좋아요 </span>
</c:if>
<!-- out 태그로 param.name에 아이유가 들어가면 result를 출력한다. -->
<c:out value="${ param.name }" default="result" />

</body>
</html>