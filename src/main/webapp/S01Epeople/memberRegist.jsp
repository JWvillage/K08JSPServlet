<%@page import="utils.JSFunction"%>
<%@page import="S01Epeople.MembershipDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Page</title>
    <link rel="stylesheet" href="./common/style.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
    $(function() {
        //라디오를 버튼모양으로 바꿔주는 jQuery UI
        $("input[type=radio]").checkboxradio({
            icon: false
        });
        //날짜선택을 편리하게 - Date Picker
        $("#birthday").datepicker({
            dateFormat : "yy-mm-dd",
            showOn: "both",
            buttonImage: "./images/pick.jpg",
            buttonImageOnly: true,
        });    
        $('img.ui-datepicker-trigger').css({'position':'relative','top':'11px','width':'33px','marginTop':'-5px'});
    } );
    </script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
    function zipcodeFind(){
        new daum.Postcode({
            oncomplete: function(data) {
                //DAUM 우편번호API가 전달해주는 값을 콘솔에 출력
                console.log("zonecode", data.zonecode);
                console.log("address", data.address);
                //회원 가입폼에 적용
                var f = document.registFrm;//<form>태그의 DOM객체를 변수에 저장
                // 우편번호(zonecode)
                f.zipcode.value = data.zonecode;
                // 주소(address)
                f.address1.value = data.address;
                f.address2.focus();
            }
        }).open();
    }
    </script>
    <script>
    // submit 시 필수 입력 사항 입력 여부 확인
    function registValidate(form){
     	var id_val = document.getElementById("id_validate");
     	var p_check = document.getElementById("pass_check");
     	if(form.user_id.value == "") {
    		alert("아이디를 입력하세요.");
        	form.user_id.focus();
        	return false;
    	} else {
    		if (id_val.innerHTML != "사용가능합니다.") {
    		alert("아이디를 확인하세요.");
    		form.user_id.focus();
    		return false;
    		} 
    	}
     	if(form.pass1.value == "") {
     		alert("비밀번호를 입력하세요.");
        	form.pass1.focus();
        	return false;
     	} else {
     		if(p_check.innerHTML != "사용가능합니다.") {
     			alert("비밀번호를 확인하세요.");
     			form.pass1.focus();
            	return false;
     		}
     	}
     	if(form.pass2.value == "") {
     		alert("비밀번호를 확인하세요.");
     		form.pass2.focus();
     		return false;
     	}
		// submit 후 비밀번호 확인 시 다르면 경고창 띄우기
		if(form.pass1.value != form.pass2.value) {
     		alert("비밀번호를 다시 확인하세요.");
        	form.pass2.focus();
        	return false;
     	} 
     	if(form.name.value == "") {
     		alert("이름을 입력하세요.");
        	form.name.focus();
        	return false;
     	}
     	if(form.birthday.value == "") {
     		alert("생년월일을 입력하세요.");
        	form.birthday.focus();
        	return false;
     	}   	
     	if(form.zipcode.value == "") {
     		alert("우편번호를 입력하세요.");
        	form.zipcode.focus();
        	return false;
     	}
     	if(form.address1.value == "") {
     		alert("주소를 입력하세요.");
        	form.address1.focus();
        	return false;
     	}
     	if(form.address2.value == "") {
     		alert("세부주소를 입력하세요.");
     		form.address2.focus();
     		return false;
     	}
     	if(form.email1.value == "" || form.email2.value == "") {
     		alert("이메일을 입력하세요.");
        	form.email1.focus();
        	return false;
     	} else {
     		if(email_validate.innerHTML != "사용가능합니다.") {
     			alert("이메일을 확인하세요.");
     			form.email1.focus();
     			return false;
     		}
     	}
     	if(form.mobile1.value == "" || form.mobile2.value == "" || form.mobile3.value == "") {
     		alert("휴대번호를 입력하세요.");
        	form.mobile1.focus();
        	return false;
     	}
		/* alert("폼값이 전송되기 전 유효성 체크를 해주세요."); */

    }
    
    // 아이디 focus 시 유효성 검사
    function idCheck(form){
    	var id_val = document.getElementById("id_validate");
    	// 아이디 입력 X
    	if(form.user_id.value == "") {
    		id_val.innerHTML = "아이디를 입력하세요.";
			id_val.style.color = "red";
    		/* form.user_id.focus(); */
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
    				if(!((ascii >= 48 && ascii <= 57) || (ascii >= 97 && ascii <= 122))) {
    					// 아이디의 문자 중 하나라도 숫자, 영문이 아니면 false 반환
   					 	check = false;
    				}
    			}
    			// check가 false이면 영문, 숫자 이외의 문자가 입력되었으므로 새로 입력하라는 문구 출력
    			if(check == false) {
    				/* alert("영문과 숫자만 입력하세요."); */
    				id_val.innerHTML = "영문(소문자), 숫자만 입력하세요.";
    				id_val.style.color = "red";
    				/* form.user_id.focus(); */
    			} else {
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
    			/* form.user_id.focus(); */
    		}
    	}
    	return false;
    }
    
    // 아이디 중복 확인
    function id_Duplication_Check(form) {
    	var id_val = document.getElementById("id_validate");
    	// 아이디 입력 X
    	if(form.user_id.value == "") {
    		alert("아이디 입력 후 중복확인하세요.");
    		form.user_id.focus();
    		
    		// 아이디 입력 O
    	} else {
    		// 사용가능한 아이디 일 때
    		if(id_val.innerHTML == "사용가능합니다.") {
    			// 중복확인 팝업창 띄우기
    			window.open("id_duplication.jsp?id=" + form.user_id.value, "idover", "width=500px, height=300px");
    		// 사용가능한 아이디가 아니면 경고창 띄우기
    		} else {
    			alert("사용 가능한 아이디가 아닙니다.");
    			form.user_id.focus();
    		}
    	}
	}
    
    // 비밀번호 입력 시 유효성 검사
    function passCheck(form) {
    	if(form.pass1.value != null) {
    		var u_pass = form.pass1.value;
    		var check = document.getElementById("pass_check");
    		
    		if(u_pass.length >= 6 && u_pass.length <= 20) {
    			var num = 0;
    			var upp_Alpha = 0;
    			var low_Alpha = 0;
    			var symbol = 0;
    			for(var i = 0; i < u_pass.length; i++) {
    				var ascii = u_pass.charCodeAt(i);
    				if(ascii >= 48 && ascii <= 57) num++;
    				if(ascii >= 65 && ascii <= 90) upp_Alpha++;
    				if(ascii >= 97 && ascii <= 122) low_Alpha++;
    				if((ascii >= 33 && ascii <= 47) || (ascii >= 58 && ascii <= 64)
    						|| (ascii >= 91 && ascii <= 96)
    						|| (ascii >= 123 && ascii <= 126)) symbol++;
    			}
    			if( num > 0 && upp_Alpha > 0 && low_Alpha > 0 && symbol > 0 ) {
        			check.innerHTML = "사용가능합니다.";
    				check.style.color = "skyblue";
        			form.pass2.focus();
    			} else {
    				check.innerHTML = "영문(대소문자)/숫자/특수문자가 모두 포함되어야 합니다.";
    				check.style.color = "red";
        			/* form.pass1.focus(); */
    			}
    		} else {
    			check.innerHTML = "6~20 자리로 입력하세요.";
				check.style.color = "red";
    			/* form.pass1.focus(); */
    		}
    	}
    }
    
    /* Email 입력 */
    // email1 유효성 검사
    function emailCheck(form){
    	var email_val = document.getElementById("email_validate");
    	// email 입력 X
    	if(form.email1.value != "") {
    		// email 값을 넣어서 검증할 변수 선언
    		var u_email = form.email1.value;
    		
   			// email에 숫자, 영문만 있는지 확인하여 참인지 거짓인지 판단할 변수 선언
   			var check = true;
   			// 아이디 전체를 문자 하나하나 잘라서 아스키 코드로 확인
   			for(var i = 0; i < u_email.length; i++) {
   				var ascii = u_email.charCodeAt(i);
   				if(!((ascii >= 48 && ascii <= 57) || (ascii >= 97 && ascii <= 122))) {
   					// 아이디의 문자 중 하나라도 숫자, 영문이 아니면 false 반환
  					 	check = false;
   				}
   			}
   			// check가 false이면 숫자, 영문 이외의 문자가 입력되었으므로 새로 입력하라는 문구 출력
   			if(check == false) {
   				/* alert("영문과 숫자만 입력하세요."); */
   				email_val.innerHTML = "이메일 주소의 형식이 적합하지 않습니다.";
   				email_val.style.color = "red";
   			} else {
   				// 영문, 숫자만 있으므로 사용가능하다는 문구 출력
				email_val.innerHTML = "사용가능합니다.";
				email_val.style.color = "skyblue";
   			}
    	}
    	return false;
    }
    
    // email2 유효성 검사
    function inputEmail(form){
    	
		if(form.email_domain.value == "") {
			form.email2.value = "";
			form.email2.readOnly = false;
			form.email2.focus();
		} else {
			form.email2.value = form.email_domain.value;
			form.email2.readOnly = true;
		}
		
    	/* alert("이메일을 선택하면 도메인 부분에 입력되게 해주세요.") */
    }
    
    // 전화번호 focus ( 휴대전화, 집전화 )
    function commonFocusMove(obj, charLen, nextObj){
		
    	if(obj.value.length == charLen) {
    		document.getElementsByName(nextObj)[0].focus();
    	}
    }
    
    // 비밀번호, 휴대폰 번호, 전화번호 입력시 잘못된 사항
    $(function () {
        $('#pwd1').keyup(function () {
          $('#pwd2').val('');
          $('#msg').val('');
        });

        $('#pwd2').keyup(function () {
          if ($('#pwd1').val() == $('#pwd2').val()) {
            $('#msg').html('비밀번호 일치').attr('style', 'color: skyblue');
            $('input[name=name]').focus();
          } else {
            $('#msg').html('비밀번호 불일치').attr('style', 'color: red');
            $('#pwd2').focus();
          }
        });
        
        $('input[name=mobile2]').keyup(function(){
        	if(isNaN($('input[name=mobile2]').val()) == true) {
        		alert("숫자만 입력하세요.");
        		$('input[name=mobile2]').val('');
        		$('input[name=mobile2]').focus();
        	}
        });
        
        $('input[name=mobile3]').keyup(function(){
        	if(isNaN($('input[name=mobile3]').val()) == true) {
        		alert("숫자만 입력하세요.");
        		$('input[name=mobile3]').val('');
        		$('input[name=mobile3]').focus();
        	}
        });
        
        $('input[name=tel2]').keyup(function(){
        	if(isNaN($('input[name=tel2]').val()) == true) {
        		alert("숫자만 입력하세요.");
        		$('input[name=tel2]').val('');
        		$('input[name=tel2]').focus();
        	}
        });
        
        $('input[name=tel3]').keyup(function(){
        	if(isNaN($('input[name=tel3]').val()) == true) {
        		alert("숫자만 입력하세요.");
        		$('input[name=tel3]').val('');
        		$('input[name=tel3]').focus();
        	}
        });
      });
    </script>
</head>
<body>
<form action="registProcess.jsp" method="post" name="registFrm" onsubmit="return registValidate(this)">
<div class="AllWrap">
    <div class="wrap_regiform">
        <p><span style="color: red">*</span>필수입력사항</p>
        <table class="regi_table">
            <colgroup>
                <col width="180px">
                <col width="*">
            </colgroup>
            <tr>
                <td><span class="red">*</span> 아이디</td>
                <td>
                    <input type="text" class="w01" name="user_id" id="id" value="" onblur="idCheck(this.form);" />
	                    <button type="button" onclick="id_Duplication_Check(this.form);">중복확인</button>
                    <br />
                    <span id="id_validate" style="color: skyblue"></span>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <span class="comment">※ 8~16자의 영문과 숫자만 가능합니다.</span>                
                </td>
            </tr>
            <tr>
                <td><span class="red">*</span> 비밀번호</td>
                <td>
                    <input type="password" class="w01" id="pwd1" name="pass1" value="" onblur="passCheck(this.form);"/><br />
                    <span id="pass_check"></span>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <span class="comment">
                        ※ 영문/숫자/특수문자 조합 6~20자 이상 입력해주세요.
                    </span>
                </td>
            </tr>
            <tr>
                <td><span class="red">*</span> 비밀번호확인</td>
                <td>
                    <input type="password" class="w01" id="pwd2" name="pass2" value="" /><br />
                    <span id="msg"></span>
                </td>
            </tr>
            <tr>
                <td><span class="red">*</span> 이름</td>
                <td>
                    <input type="text" class="w01" name="name" value="" />
                    
                    <label for="radio-1">남</label>
                    <input type="radio" name="gender" id="radio-1" value="남" checked>
                    <label for="radio-2">여</label>
                    <input type="radio" name="gender" id="radio-2" value="여">
                    
                </td>
            </tr>
            <tr>
                <td><span class="red">*</span> 생년월일</td>
                <td style="padding: 0px 0 5px 5px;">
                    <input type="text" class="w02" name="birthday" id="birthday" value="" />
                    <!-- <img src="./images/pick.jpg" id="pick" class="pick" /> -->
                </td>
            </tr>
            <tr>
                <td><span class="red">*</span> 주소</td>
                <td>
                    <input type="text" class="w03" name="zipcode" value="" readonly/>
                    <button type="button" onclick="zipcodeFind();">우편번호찾기</button> 
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="text" class="w04" name="address1" value="" readonly/>                
                    <input type="text" class="w04" name="address2" value="" />
                </td>
            </tr>
            <tr>
                <td><span class="red">*</span> 이메일</td>
                <td>
                    <input type="text" class="w05" name="email1" value="" onblur="emailCheck(this.form);" />
                    @
                    <input type="text" class="w05" name="email2" value="" />
                    <select name="email_domain" class="s01" onchange="inputEmail(this.form);" >
                        <option value="">직접입력</option>
                        <option value="naver.com">naver.com</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option value="gmail.com">gmail.com</option>
                    </select>
                    <br />
                    <span id="email_validate" style="color: skyblue"></span>
                </td>
            </tr>
            <tr>
                <td><span class="red">*</span> 휴대폰번호</td>
                <td>
                    <select name="mobile1" class="s02" onchange="commonFocusMove(this, 3, 'mobile2');">
                        <option value=""></option>
						<option value="010">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                        <option value="018">018</option>
                        <option value="019">019</option>
                    </select>
                    -
                    <input type="text" class="w06" name="mobile2" maxlength="4" 
                        value="" onkeyup="commonFocusMove(this, 4, 'mobile3');" />
                    -
                    <input type="text" class="w06" name="mobile3" maxlength="4" 
                        value="" onkeyup="commonFocusMove(this, 4, 'tel1');" />
                </td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td>
                    <select name="tel1" class="s02" onchange="commonFocusMove(this, 3, 'tel2');">
                        <option value=""></option>
						<option value="02 ">02 </option>                        
                        <option value="031">031</option>
						<option value="032">032</option>
						<option value="033">033</option>
                    </select>
                    -
                    <input type="text" class="w06" name="tel2" maxlength="4" value="" onkeyup="commonFocusMove(this, 4, 'tel3');" />
                    -
                    <input type="text" class="w06" name="tel3" maxlength="4" value="" />
                </td>
            </tr>
        </table>
        <div style="text-align: center; margin-top:10px;">
            <button type="submit" class="btn_search">회원가입</button>
            <button type="reset" class="btn_search">다시쓰기</button>
        </div>
    </div>
</div>
</form>
</body>
</html>