<%@page import="utils.JSFunction"%>
<%@page import="homework.MembershipDTO"%>
<%@page import="homework.MembershipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//회원가입 페이지에서 사용자가 입력한 회원 정보 받기
String userId = request.getParameter("user_id");
String userPwd = request.getParameter("pass2");
String userName = request.getParameter("name");
String userGen = request.getParameter("gender");
String userBirth = request.getParameter("birthday");
String userZCode = request.getParameter("zipcode");
String userAddr = request.getParameter("address1") + request.getParameter("address2");
String userEmAddr = request.getParameter("email1") + "@" + request.getParameter("email2");
String userMobNum = request.getParameter("mobile1") + "-" + request.getParameter("mobile2") + "-"
		+ request.getParameter("mobile3");
String userPhoNum;
// 집 전화는 필수 입력사항이 아니므로 빈칸이 아니면 값을 넣고 빈칸이면 null이 되도록!
if(request.getParameter("tel1") != "" || request.getParameter("tel2") != "" || request.getParameter("tel3") != "") {
	userPhoNum = request.getParameter("tel1") + "-" + request.getParameter("tel2") + "-"
		+ request.getParameter("tel2");		
} else {
	userPhoNum = "";
}

//JDBC를 통해 오라클 접속
MembershipDAO dao = new MembershipDAO(application);

// dto에 값들 저장
MembershipDTO dto = new MembershipDTO(userId, userPwd, userName, userGen, userBirth, userZCode, userAddr, userEmAddr,
		userMobNum, userPhoNum);

// 값이 입력되면 dao.memberInsert(dto)는 1을 return 하므로..
if (dao.memberInsert(dto) == 1) {
	// 1이면 "가입 성공" 메세지를 경고창에 띄우고 memberLogin.jsp로 이동
	JSFunction.alertLocation("가입 성공", "memberLogin.jsp", out);
} else {
	// 1이 아니면 "가입 실패" 메세지를 경고창에 띄우고 다시 back!!
	JSFunction.alertBack("가입 실패", out);
}
// DB 작업이 끝나면 자원 해제
dao.close();
%>