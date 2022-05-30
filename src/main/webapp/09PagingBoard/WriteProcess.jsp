<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 글쓰기 처리 전 로그인이 되었는지 확인한다. 글쓰기 페이지에 매우 오랜시간 작업없이
머물렀을 경우 session은 끊어질 수 있다. -->
<%@ include file="./IsLoggedIn.jsp"%>
<%
// 폼값 받기
String title = request.getParameter("title");
String content = request.getParameter("content");

// 사용자가 입력한 폼값을 저장하기 위해 DTO객체를 생성
BoardDTO dto = new BoardDTO();
// DTO에 데이터 저장
dto.setTitle(title);
dto.setContent(content);
// 특히 작성자 아이디의 경우 폼값이 아닌 session영역에 저장된 데이터를 이용
dto.setId(session.getAttribute("UserId").toString());

// DAO 객체 생성을 통해 DB 연결 및 회원정보 입력 처리
BoardDAO dao = new BoardDAO(application);

// 기존에 1개씩 입력하는 방식
// int iResult = dao.insertWrite(dto);


// 더미데이터 100개 한꺼번에 입력하기

int iResult = 0;
for(int i = 0; i <= 100; i++) {
	dto.setTitle(title + "-" + i);
	iResult = dao.insertWrite(dto);
}




dao.close();

if (iResult == 1) {
	// 글쓰기 성공 시 List로 이동
	response.sendRedirect("List.jsp");
} else {
	// 실패한 경우 글쓰기 페이지로 이동하기 위해 뒤로 이동
	JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
}
%>