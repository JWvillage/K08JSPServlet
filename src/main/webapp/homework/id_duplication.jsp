<%@page import="utils.JSFunction"%>
<%@page import="homework.MembershipDTO"%>
<%@page import="homework.MembershipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");

//member테이블에 파라미터로 전달된 id가 있는지 확인해야한다. 
MembershipDAO dao = new MembershipDAO(application);

String u_Id = request.getParameter("id");

MembershipDTO dto = dao.idValidate(u_Id);

boolean result = true;

if(dto.getId() == null) {
	result = true;
} else if(dto.getId().equals(u_Id)) {
	result = false;
}

dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>

<!-- JSP 배우기 전 Javascript에서 쓰는 코드 -->
<!-- <script>
// 주소창의 URL을 얻어와서 파라미터로 전달된 id를 브라우저에 출력한다.
window.onload = function(){
  var url = location.href;
  console.log(url);
  var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');
  console.log(parameters[0]); 
  returnValue = parameters[0].split('=')[1];
  document.getElementById('id').value = returnValue;
}
</script> -->

<script>
function Use_Id(){
	opener.document.getElementById("id").value = "<%= id %>";
	self.close();
}
function idCheck(form){
	var id_val = document.getElementById("id_validate");
	// 아이디 입력 X
	if(form.user_id.value == "") {
		alert("아이디를 입력하세요.");
		form.user_id.focus();
		
		// 아이디 입력 O
	} else {
		// 아이디 값을 넣어서 검증할 변수 선언
		var u_id = form.user_id.value;
		
		// 아이디가 8 ~ 16자리인지 확인
		if(u_id.length >= 8 && u_id.length <= 16) {
			// 아이디에 숫자, 영문만 있는지 확인하여 참인지 거짓인지 판단할 변수 선언
			var check = true;
			// 아이디 전체를 문자 하나하나 잘라서 아스키 코드로 확인
			for(var i = 0; i < u_id.length; i++) {
				var ascii = u_id.charCodeAt(i);
				if(!((ascii >= 48 && ascii <= 57)
						|| (ascii >= 65 && ascii <= 90) || (ascii >= 97 && ascii <= 122))) {
					// 아이디의 문자 중 하나라도 숫자, 영문이 아니면 false 반환
					 	check = false;
				}
			}
			// check가 false이면 영문, 숫자 이외의 문자가 입력되었으므로 새로 입력하라는 문구 출력
			if(check == false) {
				/* alert("영문과 숫자만 입력하세요."); */
				id_val.innerHTML = "영문과 숫자만 입력하세요.";
				id_val.style.color = "red";
				form.user_id.focus();
				return false;
			} else {
				// check가 true이면
				// 영문, 숫자만 있으므로 사용가능하다는 문구 출력
				id_val.innerHTML = "사용가능합니다.";
				id_val.style.color = "skyblue";
				/* form.pass1.focus(); */
				/* alert("사용가능한 아이디입니다."); */
			}
		} else {
			// 아이디가 8 ~ 16자리가 아니므로 다시 입력하라는 문구 출력
			/* alert("8~16 자리로 입력하세요.") */
			id_val.innerHTML = "8~16 자리로 입력하세요.";
			id_val.style.color = "red";
			form.user_id.focus();
			return false;
		}
	}
	/* alert("사용가능한 아이디 입니다."); */
}
</script>
</head>
<body>
<h2>아이디 중복확인</h2>
<%
if(result==true){
%>
	<span style="color: skyblue">사용가능합니다.</span>
	<br />
	<input type="text" name="user_id" id="id" value="<%= id %>"/>
	<br />
	<button type="button" onclick="Use_Id();">아이디 사용하기</button>

<%
} else {
%>
<form name="idValFrm" action="idProcess.jsp" onsubmit="return idCheck(this);">
	<table>
		<tr>
			<td>
			<input type="text" name="user_id" id="id" value="<%=id%>"/>
			<br />
			<span id="id_validate" style="color: skyblue"></span>
			</td>
		</tr>
		<tr>
			<td><input type="submit" /></td>
		</tr>
	</table>
</form>
<% 
} 
%>
</body>
</html>