<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.2/font/bootstrap-icons.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="./common/jquery/jquery-3.6.0.js"></script>
<script src="https://kit.fontawesome.com/54b3b8eebf.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
    /* Whole */
    a {
      text-decoration: none;
    }

    /* Header */
    .header {
      padding-top: 9px;
      padding-bottom: 8px;
      padding-right: 200px;
      text-align: right;
      /* max-width: 1550px; */
      font-size: 14px;
      height: 42px;
    }
    .header a {
      padding: 4px;
      padding-left: 20px;
    }

    /* subHeader */
    ul li a.main_logo {
      padding-left: 70px;
      display: inline-block;
      padding-top: 13px;
      /* border: 1px solid red; */
    }
    .subHeader {
      display: inline-block;
      position: relative;
      padding-left: 0;
      /* border: 1px solid red; */
    }
    a.subHeader_Menu {
      font-size: 22px;
      color: black;
      padding: 17px;
      display: inline-block;
    }
    button li::marker {
      color: lightgray;
    }
    #move1 {
      position: relative;
      bottom: 65px;
    }
    #move2 {
      position: relative;
      bottom: 150px;
    }
    .under_menu1:hover {
      background-color: rgb(99, 99, 223);
      color: white;
    }
    .fa-xmark-large {
      /* line-height: 30px; */
      color: rgb(255, 255, 255);
      background-color: rgb(109, 145, 255);
    }
    .fa-magnifying-glass {
      /* line-height: 30px; */
    }
    #inputpart::-webkit-input-placeholder {
      color: white;
    }
    #inputpart {
      /* width: 560px; */
      text-align: left;
    }

    /* Sub_Menu_01 */
    .subMenu {
      width: 250px;
      height: 163px;
      padding-top: 20px;
      position: relative;
      margin-right: 60px;
    }
    @keyframes ani01 {
      50% {
        transform: scale(1.1);
      }
      100% {
        transform: scale(1);
      }
    }
    a.sub {
      width: 250px;
      height: 163px;
      display: inline-block;
      padding-top: 20px;
      position: absolute;
      top: 0;
      left: 0;
    }
    a.sub:hover img {
      animation: ani01 1s infinite;
    }
    a strong {
      color: #ffffff;
      font-size: 21px;
      font-weight: 400;
      display: inline-block;
      position: relative;
    }
    a strong:before,
    a strong:after {
      content: '';
      border-bottom: 1px solid #fff;
      position: absolute;
      bottom: 0;
      width: 0;
    }
    a strong:before {
      left: 0px;
    }
    a strong:after {
      right: 0px;
    }
    a:hover strong:before,
    a:hover strong:after {
      width: 50%;
    }
    a strong:before,
    a strong:after {
      transition: 0.3s ease;
      transition: 0.3s ease;
    }

    /* Sub_Menu_02 */
    .Sub_Menu_02 {
      padding-right: 58px;
      padding-top: 30px;
    }
    #semiBtn {
      border: 1px solid rgb(175, 175, 175);
      font-size: 1em;
      width: 200.5px;
      display: inline-block;
      height: 50px;
      margin-left: -3px;
      margin-right: -3px;
    }
    @keyframes ani02 {
      100% {
        transform: rotateY(360deg);
      }
    }
    div p.semi {
      margin: 0;
      display: inline-block;
    }
    #semiBtn:hover .semi_btn_icon {
      animation: ani02 1s infinite;
    }
    #semiBtn:hover p.semi {
      transform: scale(1.05);
    }

    /* Sub_Menu_03 */
    .Sub_Menu_03 {
      margin: 0 auto;
      background-color: rgb(230, 230, 230);
      margin-top: 30px;
      width: 1205px;
      margin-right: 75px;
    }
    .under_bar {
      display: inline;
      padding-right: 55px;
    }
    .ne,
    .pr {
      width: 20px;
      height: 20px;
    }
    i.fa-play {
      border: 0;
      background-color: #e6e6e6;
      color: black;
    }
  </style>
<body>
	<!-- Header -->
	<nav class="navbar header navbar-expand-sm"
		style="background-color: #696a70">
		<div class="container-fluid">
			<div class="container">
				<%
				if (session.getAttribute("UserId") == null) {
					// session 영역에 저장된 속성값이 없다면 로그아웃 상태이다.
					// 그러므로 로그인 폼이 화면에 출력되어야 한다.
				%>
				<ul class="navbar-nav">
					<li class="nav-item top_menu ms-auto"><a
						href="memberLogin.jsp" class="text-white Header_Menu">로그인</a></li>
					<li class="nav-item"><a href="memberRegist.jsp"
						class="text-white Header_Menu">회원가입</a></li>
					<li class="nav-item"><a href="" class="text-white Header_Menu">고객센터</a>
					</li>
					<li class="nav-item"><a href="" class="text-white Header_Menu">&nbsp;<i
							class="bi bi-globe"></i> Foreign Language
					</a></li>
				</ul>
				<%
				} else {
				// session 영역에 저장된 속성값이 있다면 로그인 된 상태이므로
				// 회원 정보 및 로그아웃 버튼을 화면에 출력한다.
				%>
				<span style="color: white"> ${ sessionScope.UserName } 님, 로그인
					하셨습니다. </span> <a href="Logout.jsp" style="color: white">[로그아웃]</a>
				<%
				}
				%>
			</div>
		</div>
	</nav>
	<!-- subHeader -->
	<div class="container-fluid" style="padding-left: 0; padding-right: 0">
		<div class="container">
			<nav class="navbar subHeader navbar-expand-sm bg-white pt-1 pb-0">
				<div class="container">
					<a href="" class="main_logo navbar-brand"> <img
						src="./images/epeople_logo.png" width="230" alt="epeople_logo" />
					</a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#mynavbar">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="mynavbar">
						<ul class="nav nav-tabs">
							<li class="nav-item"><a href="#menu1"
								class="nav-link subHeader_Menu" data-bs-toggle="tab">민원</a></li>
							<li class="nav-item"><a href="#menu2"
								class="nav-link subHeader_Menu" data-bs-toggle="tab">민원상담</a></li>
							<li class="nav-item"><a href="#menu3"
								class="nav-link subHeader_Menu" data-bs-toggle="tab">국민제안</a></li>
							<li class="nav-item"><a href="#menu4"
								class="nav-link subHeader_Menu" data-bs-toggle="tab">국민생각함</a></li>
							<li class="nav-item"><a href="#menu5"
								class="nav-link subHeader_Menu" data-bs-toggle="tab">&nbsp;정책실현</a>
							</li>
							<li class="nav-item"><a href="#menu6"
								class="nav-link subHeader_Menu" data-bs-toggle="tab">민원빅데이터</a>
							</li>
							<li class="nav-item"><a href="#menu7"
								class="nav-link subHeader_Menu" data-bs-toggle="tab">&nbsp;<i
									class="fa-solid fa-magnifying-glass"></i>&nbsp;
							</a></li>
							<li class="nav-item"><a href="#menu8"
								class="nav-link subHeader_Menu" data-bs-toggle="tab">&nbsp;<i
									class="fa-solid fa-bars"></i>&nbsp;
							</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
		<div class="container-fluid Main_img"
			style="height: 340px; position: absolute; z-index: 1"></div>
		<!-- subHeader under_bar -->
		<div class="container-fluid tab-content" id="subHeader_under_bar"
			style="position: absolute; z-index: 3; background-color: #f0f3f9; padding-left: 0; padding-right: 0">
			<div class="tab-pane container active" id="home">
				<a href="http://localhost:8081/Main_Ver02.html"></a>
			</div>
			<!-- 민원 하단바 -->
			<div class="tab-pane container fade" id="menu1"
				style="padding-top: 40px; background-color: #f0f3f9">
				<div style="display: inline-block; width: 350px; padding-left: 80px">
					<div style="border-top: 5px solid #00b7ff; width: 70px"></div>
					<h1>민원</h1>
					<div style="width: 150px; height: 230px">
						국민의 작은 의견도 소중히 여기는 <br /> 국민 소통창구 <img
							src="./images/민원 하단바 이미지.png" alt="민원바 이미지"
							style="width: 100px; margin-left: 70px" />
					</div>
				</div>
				<div style="display: inline-block; padding-right: 20px">
					<div>
						<button type="button" class="btn under_menu1 btn-light p-2 mb-2"
							style="width: 220px; text-align: left">
							<li>일반민원</li>
						</button>
					</div>
					<div>
						<button type="button" class="btn under_menu1 btn-light p-2 mb-2"
							style="width: 220px; text-align: left">
							<li>적극행정 국민신청</li>
						</button>
					</div>
					<div>
						<button type="button" class="btn under_menu1 btn-light p-2 mb-2"
							style="width: 220px; text-align: left">
							<li>소극행정 신고센터</li>
						</button>
					</div>
					<div>
						<button type="button" class="btn under_menu1 btn-light p-2 mb-2"
							style="width: 220px; text-align: left">
							<li>갑질피해 신고센터</li>
						</button>
					</div>
				</div>

				<div style="display: inline-block; padding-right: 20px">
					<div>
						<button type="button" class="btn under_menu1 btn-light p-2 mb-2"
							style="width: 220px; text-align: left">
							<li>민원소개</li>
						</button>
					</div>
					<div>
						<button type="button" class="btn under_menu1 btn-light p-2 mb-2"
							style="width: 220px; text-align: left">
							<li>예산낭비 신고</li>
						</button>
					</div>
					<div>
						<button type="button" class="btn under_menu1 btn-light p-2 mb-2"
							style="width: 220px; text-align: left">
							<li>예산절감 제안</li>
						</button>
					</div>
					<div>
						<button type="button" class="btn under_menu1 btn-light p-2 mb-2"
							style="width: 220px; text-align: left">
							<li>예산낭비신고 소개</li>
						</button>
					</div>
				</div>
			</div>

			<!-- 민원상담 하단바 -->
			<div class="tab-pane container fade" id="menu2"
				style="padding-top: 40px; background-color: #f0f3f9">
				<div style="display: inline-block; width: 350px; padding-left: 80px">
					<div style="border-top: 5px solid #00b7ff; width: 70px"></div>
					<h1>민원상담</h1>
					<div style="width: 150px; height: 217px">
						<img src="./images/민원상담 하단바 이미지.png" alt="민원상담 이미지"
							style="width: 100px; margin-left: 70px" />
					</div>
				</div>

				<div style="display: inline-block; padding-right: 20px">
					<div>
						<button type="button" class="btn under_menu1 btn-light p-2 mb-2"
							style="width: 220px; text-align: left">
							<li>민원상담신청</li>
						</button>
					</div>
					<div>
						<button type="button" class="btn under_menu1 btn-light p-2 mb-2"
							style="width: 220px; text-align: left">
							<li>민원상담 신청결과</li>
						</button>
					</div>
					<div>
						<button type="button" class="btn under_menu1 btn-light p-2 mb-2"
							style="width: 220px; text-align: left">
							<li>민원상담 안내</li>
						</button>
					</div>
				</div>
			</div>

			<!-- 국민제안 하단바 -->
			<div class="tab-pane container fade" id="menu3"
				style="padding-top: 40px; background-color: #f0f3f9">
				<div style="display: inline-block; width: 350px; padding-left: 80px">
					<div style="border-top: 5px solid #00b7ff; width: 70px"></div>
					<h1>국민제안</h1>
					<div style="width: 150px; height: 230px">
						정책과 관련한 <br /> 좋은아이디어가 <br /> 있을때 <img
							src="./images/국민제안 하단바 이미지.png" alt="민원상담 이미지"
							style="width: 100px; margin-left: 70px" />
					</div>
				</div>
				<div style="display: inline-block; padding-right: 20px">
					<div>
						<button type="button" class="btn under_menu1 btn-light p-2 mb-2"
							style="width: 220px; text-align: left">
							<li>일반제안</li>
						</button>
					</div>
					<div>
						<button type="button" class="btn under_menu1 btn-light p-2 mb-2"
							style="width: 220px; text-align: left">
							<li>공모제안</li>
						</button>
					</div>
					<div>
						<button type="button" class="btn under_menu1 btn-light p-2 mb-2"
							style="width: 220px; text-align: left">
							<li>공개제안</li>
						</button>
					</div>
					<div>
						<button type="button" class="btn under_menu1 btn-light p-2 mb-2"
							style="width: 220px; text-align: left">
							<li>실시제안</li>
						</button>
					</div>
				</div>

				<div style="display: inline-block; padding-right: 20px" id="move2">
					<div>
						<button type="button" class="btn under_menu1 btn-light p-2 mb-2"
							style="width: 220px; text-align: left">
							<li>국민제안 소개</li>
						</button>
					</div>
				</div>
			</div>
			<!-- 국민생각함 -->
			<div class="tab-pane container fade" id="menu4"></div>
			<!-- 정책실현 하단바 -->
			<div class="tab-pane container fade" id="menu5"
				style="padding-top: 40px; background-color: #f0f3f9">
				<div style="display: inline-block; width: 350px; padding-left: 80px">
					<div style="border-top: 5px solid #00b7ff; width: 70px"></div>
					<h1>정책실현</h1>
					<div style="width: 150px; height: 230px">
						국민 여러분의 <br /> 참여가 이렇게 <br /> 바뀌었습니다. <img
							src="./images/정책실현 하단바 이미지.png" alt="민원상담 이미지"
							style="width: 100px; margin-left: 70px" />
					</div>
				</div>
				<!-- move1 position:relative -->
				<div style="display: inline-block; padding-right: 20px" id="move1">
					<div>
						<button type="button" class="btn under_menu1 btn-light p-2 mb-2"
							style="width: 220px; text-align: left">
							<li>생각실현</li>
						</button>
					</div>
					<div>
						<button type="button" class="btn under_menu1 btn-light p-2 mb-2"
							style="width: 220px; text-align: left">
							<li>제도개선</li>
						</button>
					</div>
					<div>
						<button type="button" class="btn under_menu1 btn-light p-2 mb-2"
							style="width: 220px; text-align: left">
							<li>민원해결</li>
						</button>
					</div>
				</div>
			</div>
			<!-- 민원빅데이터 -->
			<div class="tab-pane container fade" id="menu6"></div>
			<!-- 돋보기 하단바 -->
			<div class="tab-pane container-fluid fade" id="menu7"
				style="background-color: #5193f6">
				<div class="container pb-5">
					<div
						style="display: inline-block; width: 620px; margin-left: 250px"
						class="border-bottom border-3 border-white pt-5">
						<input id="inputpart" type="text"
							style="outline-style: none; border: 0; font-size: 25px; color: white; background-color: #5193f6; width: 570px; padding-left: 20px;"
							placeholder="찾으시는 검색어를 입력하세요" />
						<a href="#"><i class="bi bi-search"
							style="font-size: 30px; color: white; position: relative"></i></a>
					</div>
				</div>
			</div>
			<!-- 전체 메뉴 -->
			<div class="tab-pane container fade" id="menu8"></div>
		</div>
	</div>
</body>
</html>