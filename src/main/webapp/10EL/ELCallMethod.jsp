<%@page import="el.MyELClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 일반적인 메소드를 사용하기 위해서 객체 생성 후 영역에 저장한다.
MyELClass myClass = new MyELClass();
pageContext.setAttribute("myClass", myClass);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어(EL) - 메소드 호출</title>
</head>
<body>
<!-- 일반적인 메소드 호출 -->
<h3>영역에 저장 후 메소드 호출하기</h3>
001225-3000000 => ${ myClass.getGender("001225-3000000") } <br />
001225-2000000 => ${ myClass.getGender("001225-2000000") } <br />

<!-- 정적메소드의 경우 별도의 처리 없이 클래스명으로 호출할 수 있다. -->
<h3>클래스명을 통해 정적 메소드 호출하기</h3>
${ MyELClass.showGugudan(7) }

<h3>JSP 코드를 통해 메소드 호출하기</h3>
<%
out.print(MyELClass.isNumber("백20") ? "숫자임" : "숫자 아님");
out.print("<br>");

boolean isNumStr = MyELClass.isNumber("120");
if(isNumStr == true)
	out.print("숫자입니다.");
else
	out.print("숫자가 아닙니다.");
%>
</body>
</html>