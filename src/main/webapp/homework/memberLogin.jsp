<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<style>
.user_input {
	border: 1px solid rgb(75, 75, 75);
	width: 320px;
	height: 27px;
	padding: 10px;
	font-size: 18px;
}

input[type=image] {
	margin-top: 2px;
}
</style>
<script>
	function loginValidate(form) {
		if (form.userid.value == "") {
			alert("아이디를 입력하세요.");
			form.userid.focus();
			return false;
		}
		if (form.passwd.value == "") {
			alert("비밀번호를 입력하세요.");
			form.passwd.focus();
			return false;
		}
		/* 	alert("로그인 폼 유효성 체크를 해주세요"); */
		/* 	return false; */
	}
</script>
</head>
<body>
<fieldset>
	<%
	if (session.getAttribute("UserId") == null) {
		// session 영역에 저장된 속성값이 없다면 로그아웃 상태이다.
		// 그러므로 로그인 폼이 화면에 출력되어야 한다.
	%>
	<table border="0" cellpadding="40" cellspacing="0" width="100%">
		<tr>
			<td align="center" valign="middle">
				<table border="0" cellpadding="0" cellspacing="0" width="470">
					<tr>
						<td align="center"><img src="./images/login_logo.gif" /></td>
					</tr>
				</table>
				<form name="loginFrm" action="loginProcess.jsp" method="post"
					onsubmit="return loginValidate(this);">
					<table width="470" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="350"><input type="text" name="userid"
								placeholder="아이디" class="user_input" /></td>
							<td width="120" rowspan="3" align="right"><input
								type="image" src="./images/login_bt.gif" /></td>
						</tr>
						<tr height="5">
							<td></td>
						</tr>
						<tr>
							<td><input type="password" name="passwd" placeholder="****"
								class="user_input" /></td>
						</tr>
					</table>
					<div style="margin-top: 15px;"></div>
					<div style="margin-top: 15px;"></div>
					<table width="470" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td align="left"><a href="#" onClick=""><img
									src="./images/login_member.gif" alt="아직도 회원이 아니세요?" /></a></td>
							<td align="right"><a href="#" onClick=""><img
									src="./images/login_idpw.gif" alt="아이디/비밀번호를 잊어버리셨어요?" /></a></td>
						</tr>
					</table>
				</form>
				<div style="margin-top: 30px;"></div>
			</td>
		</tr>
	</table>
</fieldset>
<%
} else {
// session 영역에 저장된 속성값이 있다면 로그인 된 상태이므로
// 회원 정보 및 로그아웃 버튼을 화면에 출력한다.
%>
<%=session.getAttribute("UserName")%>
님, 로그인 하셨습니다.
<br />
<a href="Logout.jsp">[로그아웃]</a>
<%
}
%>
</body>
</html>