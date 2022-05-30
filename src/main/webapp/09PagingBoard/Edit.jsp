<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 글쓰기 페이지 진입 전 로그인을 확인한다. 만약 로그인 되지 않았다면 로그인 페이지로 이동한다. -->
<%@ include file="./IsLoggedIn.jsp" %>
<%
// 수정할 게시물의 일련번호를 파라미터로 받아온다.
String num = request.getParameter("num");

BoardDAO dao = new BoardDAO(application);
BoardDTO dto = dao.selectView(num);
// 게시물 조회를 위해 상세보기에서 작성했던 메소드를 그대로 이용한다.
String sessionId = session.getAttribute("UserId").toString();
/*
본인이 작성한 글이 아니어도 URL 패턴을 분석하면 수정페이지로 진입할 수 있으므로,
진입 전 본인확인을 추가로 하는 것이 안전하다.
*/
// session영역에 있는 아이디와 게시물에 저장된 아이디가 같은지 비교한다.
if(!sessionId.equals(dto.getId())) {
	JSFunction.alertBack("작성자 본인만 수정할 수 있습니다.", out);
}
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script>
function validateForm(form) {
	if(form.title.value == "") {
		alert("제목을 입력하세요.");
		form.title.focus();
		return false;
	}
	if(form.content.value == "") {
		alert("내용을 입력하세요.");
		form.content.focus();
		return false;
	}
}
</script>
</head>
<body>
<!-- 액션 태그를 통해 공통링크 페이지를 include한다. -->
<jsp:include page="../Common/Link.jsp" />
<h2>회원제 게시판 - 수정하기(Edit)</h2>
<form name="writeFrm" method="post" action="EditProcess.jsp" onsubmit="return validateForm(this);">

<!-- 게시물의 일련번호를 서버로 전송하기 위해 hidden 타입의 input태그가 필요하다. -->
<input type="hidden" name="num" value="<%= dto.getNum() %>"/>
	<table border="1" width="90%">
		<tr>
			<td>제목</td>
			<td>
				<input type="text" name="title" style="width: 90%" value="<%= dto.getTitle() %>"/>
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea name="content" style="width: 90%; height: 100%"><%= dto.getContent() %></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit">작성 완료</button>
				<button type="reset">다시 입력</button>
				<button type="button" onclick="location.href='List.jsp';">목록 보기</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>