<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC</title>
</head>
<body>
	<h2>회원 목록 조회 테스트</h2>

	<%
	// DB 연결
	JDBConnect jdbc = new JDBConnect();

	// 정적 쿼리 실행을 위한 statement 객체 생성 및 쿼리문 준비
	String sql = "SELECT id, pass, name, regidate From member";
	Statement stmt = jdbc.con.createStatement();

	// 행에 영향을 주지 않는 쿼리문은 executeQuery()를 사용한다.
	// 반환 타입은 ResultSet이다.
	ResultSet rs = stmt.executeQuery(sql);

	// 반환 받은 결과의 개수만큼 반복하여 출력한다.
	while (rs.next()) {
		// 각 레코드의 컬럼 접근 시 index 혹은 컬럼명을 사용할 수 있다.
		// index는 1부터 시작한다.
		String id = rs.getString(1);
		String pw = rs.getString(2);
		// 컬럼명을 직접 사용한다.
		String name = rs.getString("name");
		java.sql.Date regidate = rs.getDate("regidate");

		out.println(String.format("%s %s %s %s", id, pw, name, regidate) + "<br>");
	}

	// 자원 해제
	jdbc.close();
	%>
</body>
</html>