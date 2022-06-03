<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 로그아웃 처리를 위한 방법
session.removeAttribute("UserId");
session.removeAttribute("UserName");

session.invalidate();

response.sendRedirect("Main_Ver01.jsp");
%>
