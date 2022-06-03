<%@page import="utils.BoardPage"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//DAO 객체 생성을 통해 오라클 DB에 접속한다.
//application 내장 객체를 DAO 객체의 생성자로 전달하여 생성자에서 web.xml의 컨텍스트 초기화
//파라미터를 즉시 읽어올 수 있도록 처리한다.
BoardDAO dao = new BoardDAO(application);

//검색어가 있는 경우 파라미터 저장을 위해 Map 계열의 컬렉션을 생성한다.
Map<String, Object> param = new HashMap<String, Object>();
//해당 페이지로 전달된 파라미터를 받아온다.
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");

//검색어가 있는 경우에만 파라미터를 Map컬렉션에 저장한다.
//목록에 최초로 진입한 경우라면 파라미터는 없는 상태일 것이다.
if (searchWord != null) {
	// 검색을 위한 테이블의 컬럼명 : title, content
	param.put("searchField", searchField);
	// 클라이언트가 입력한 검색어
	param.put("searchWord", searchWord);
}
//board테이블에 저장된 게시물의 개수를 카운트 한다.
int totalCount = dao.selectCount(param);

//목록에 출력할 레코드를 추출한다.

/* 페이지 처리 Start */

// 컨텍스트 초기화 파라미터를 얻어온 후 사칙연산을 위해 정수로 변환한다.
int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));

// 전체 페이지 수를 계산한다. ( 전체 게시물의 개수 / 페이지 당 게시물 개수 = 결과의 올림처리)
int totalPage = (int)Math.ceil((double)totalCount / pageSize);

/*
목록에 첫 진입시에는 페이지 관련 파라미터가 없는 상태이므로 무조건 1page로 지정한다.
만약 파라미터 pageNum이 있다면 request 내장 객체를 통해 받은 후 페이지 번호로 지정한다.
List.jsp => 이와 같이 파라미터가 없는 상태일 때는 null
List.jsp?pageNum= => 이와 같이 파라미터는 있는 데 값이 없을 때는 반값으로 체크된다.
따라서 아래 if문은 2개의 조건으로 구성해야 된다.
*/
int pageNum = 1;
String pageTemp = request.getParameter("pageNum");
if(pageTemp != null && !pageTemp.equals(""))
	pageNum = Integer.parseInt(pageTemp);

// 게시물의 구간 계산
// 각 페이지의 시작번호(rownum)
int start = (pageNum - 1) * pageSize + 1;
// 각 페이지의 종료번호
int end = pageNum * pageSize;
// 계산된 값을 DAO로 전달하기 위해 Map컬렉션에 저장
param.put("start", start);
param.put("end", end);
/* 페이지 처리 End */

List<BoardDTO> boardLists = dao.selectListPage(param);
//만약 검색어가 있다면 해당 조건에 맞는 게시물만 select 해야한다.
//따라서 검색어 여부에 따라 where 절이 조건부로 추가된다.

//자원 해제
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
<jsp:include page="../Common/Link.jsp" />

<h2>목록 보기(List) - 현재 페이지 : <%= pageNum %> (전체 : <%= totalPage %>)</h2>
<!-- 검색 form -->
<!-- form 태그에 action 속성이 없으면 form값은 현재 페이지로 전송된다. -->
<form method="get">
<table border="1" width="90%">
<tr>
	<td align="center">
		<select name="searchField">
			<option value="title">제목</option>
			<option value="content">내용</option>
		</select>
		<input type="text" name="searchWord"/>
		<input type="submit" value="검색하기" />
	</td>
</tr>
</table>
</form>
<!-- 게시물 목록 테이블(표) -->
<table border="1" width="90%">
<!-- 각 컬럼의 이름 -->
<tr>
	<th width="10%">번호</th>
	<th width="50%">제목</th>
	<th width="15%">작성자</th>
	<th width="10%">조회수</th>
	<th width="15%">작성일</th>
</tr>
<%
// List 컬렉션에 저장된 내용이 없을 때 true를 반환하는 isEmpty()메소드를 사용해서
// 출력할 게시물이 있는지 확인한다.
if (boardLists.isEmpty()) {
	// 게시물이 하나도 없을 때
%>
<tr>
	<td colspan="5" align="center">
		등록된 게시물이 없습니다.
	</td>
</tr>
<%
} else {
	// 게시물이 있는 경우라면..
	// 게시물의 출력 번호
	int virtualNum = 0;
	int countNum = 0;
	// 게시물의 개수만큼 즉, List컬렉션에 저장된 DTO 객체의 개수만큼 반복한다. 
	for (BoardDTO dto : boardLists) {
		// 전체 레코드 수를 1씩 차감하면서 List에 출력한다.
		// virtualNum = totalCount--;
		
		//현재 페이지 번호를 적용한 가상 번호 계산하기
		virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++);
%>
	<tr align="center">
		<td><%= virtualNum %></td>
		<td align="left">
			<a href="View.jsp?num=<%= dto.getNum() %>"><%= dto.getTitle() %></a>
		</td>
		<td align="center"><%= dto.getId() %></td>           
        <td align="center"><%= dto.getVisitcount() %></td>   
        <td align="center"><%= dto.getPostdate() %></td>
	</tr>
<%
	}
}
%>
</table>
<table border="1" width="90%">
    <tr align="center">
    	<td>
    	<!--  
    	request.getRequestURI() : request 내장 객체를 통해 현재 페이지에서
    		HOST 부분을 제외한 전체 경로명을 얻어올 수 있다. 여기서 얻은 경로명을 통해
    		"경로명?pageNum=페이지번호"와 같은 바로가기 링크를 만들게 된다.
    	-->
    		<%= BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI()) %>
    	</td>
        <td>
         <button type="button" onclick="location.href='Write.jsp';">
         	글쓰기
         </button>
        </td>
    </tr>
</table>
</body>
</html>