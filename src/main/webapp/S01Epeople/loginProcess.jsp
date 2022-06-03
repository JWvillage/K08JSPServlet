<%@page import="utils.JSFunction"%>
<%@page import="homework.MembershipDTO"%>
<%@page import="homework.MembershipDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 로그인 페이지에서 사용자가 입력한 회원 정보 받기
String userId = request.getParameter("userid");
String userPwd = request.getParameter("passwd");

// JDBC를 통해 오라클 접속
MembershipDAO dao = new MembershipDAO(application);
// 받아온 아이디, 패스워드를 매개변수로 메소드 호출. 일치하는 회원 정보가 있는지 확인한다.
MembershipDTO membershipDTO = dao.memberLogin(userId, userPwd);
// DB 작업이 끝나면 자원 해제
dao.close();

// 회원인증(로그인)에 성공한 경우
if(membershipDTO.getId() != null) {
	/*
	Session 영역에 아이디와 이름을 저장한다.
	Session 영역은 페이지를 이동하더라도 웹 브라우저를 닫을 때까지 영역이 공유되어 접근할 수 있다.
	*/
	session.setAttribute("UserId", membershipDTO.getId());
	session.setAttribute("UserName", membershipDTO.getName());
	// 로그인 페이지로 이동한다.
	response.sendRedirect("Main_Ver01.jsp");
} else {
	JSFunction.alertBack("로그인 오류입니다.", out);
}
%>
