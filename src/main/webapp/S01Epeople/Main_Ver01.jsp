<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Main_Ver01.html</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.2/font/bootstrap-icons.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="./common/jquery/jquery-3.6.0.js"></script>
    <script src="https://kit.fontawesome.com/54b3b8eebf.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
    .Main_img {
      background-image: url(./images/bg-banner.jpg);
      background-size: cover;
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
  	<jsp:include page="Header.jsp" />
    <!-- subHeader -->
    <div class="container-fluid" style="padding-left: 0; padding-right: 0">
      <div class="container-fluid Main_img" style="height: 340px; position: absolute; z-index: 1"></div>
      <!-- subHeader under_bar -->
      <div
        class="container-fluid tab-content"
        id="subHeader_under_bar"
        style="position: absolute; z-index: 3; background-color: #f0f3f9; padding-left: 0; padding-right: 0"
      >
      </div>
      <!-- assist_menu -->
      <div class="container">
        <nav class="navbar" style="z-index: 2">
          <!-- Main_img_text -->
          <div style="position: absolute; display: inline-block; top: 100px; left: 20px; font-size: 3em; z-index: 1">
            <strong>국민의 작은 소리도</strong><br />
            크게 듣겠습니다.
          </div>
          <!-- Search_Bar -->
          <div
            class="row"
            style="
              border: 3px solid rgb(0, 0, 142);
              width: 680px;
              height: 60px;
              margin-top: 290px;
              margin-left: 25px;
              background-color: white;
            ">
            <div class="col-sm-3">
              <button style="border: 0; background-color: white; padding: 12px; padding-right: 0">
                <a href="#search" style="color: black; font-size: 1.2em; font-weight: 400">민원사례검색</a>
              </button>
            </div>
            <div class="col-sm-8">
              <input
                type="text"
                placeholder="민원을 신청하시기 전에 민원 사례를 검색해 보세요."
                style="width: 100%; height: 99%; border: 0; outline: none"
                id="search"
              />
            </div>
            <div class="col-sm-1" style="padding-left: 0">
              <button style="background-color: white; border: 0; padding-left: 13px">
                <i class="bi bi-search" style="font-size: 32px; text-align: center"></i>
                <!-- <img src="./images/search02.png" alt="" style="width: 40px; height: 45px" /> -->
              </button>
            </div>
          </div>
          <!-- Carousel -->
          <div id="demo1" class="carousel slide ms-auto" data-bs-ride="carousel" style="width: 470px; margin-top: 60px; margin-right: 80px">
            <!-- Indicators/dots -->
            <div class="carousel-indicators">
              <button type="button" data-bs-target="#demo1" data-bs-slide-to="0" class="active"></button>
              <button type="button" data-bs-target="#demo1" data-bs-slide-to="1"></button>
              <button type="button" data-bs-target="#demo1" data-bs-slide-to="2"></button>
              <button type="button" data-bs-target="#demo1" data-bs-slide-to="3"></button>
            </div>
            <!-- The slideshow/carousel -->
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="./images/page_image01.jpg" alt="국민정책패널 모집" class="d-block" style="width: 100; height: 100" />
              </div>
              <div class="carousel-item">
                <img src="./images/page_image02.jpg" alt="청소년 청년 아이디어 경진대회" class="d-block" style="width: 100; height: 100" />
              </div>
              <div class="carousel-item">
                <img src="./images/page_image03.jpg" alt="유가족 찾기" class="d-block" style="width: 100; height: 100" />
              </div>
              <div class="carousel-item">
                <img src="./images/page_image04.jpg" alt="공익침해혐의 집중신고기간" class="d-block" style="width: 100; height: 100" />
              </div>
            </div>
            <!-- Left and right controls/icons -->
            <button class="carousel-control-prev" type="button" data-bs-target="#demo1" data-bs-slide="prev">
              <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#demo1" data-bs-slide="next">
              <span class="carousel-control-next-icon"></span>
            </button>
          </div>
        </nav>
      </div>
    </div>
    <!-- SubMenu 3가지 -->
    <div class="container" style="margin-top: 50px">
      <!-- SubMenu_First -->
      <div class="Sub_Menu_01 text-center">
        <div class="subMenu text-center" style="display: inline-block; background-color: #19aad9">
          <a href="" class="sub">
            <img src="./images/icon01.PNG" alt="민원신청" />
            <br />
            <strong>민원신청</strong>
          </a>
        </div>

        <div class="subMenu text-center" style="display: inline-block; background-color: #17419a">
          <a href="" class="sub">
            <img src="./images/icon02.png" alt="민원상담신청" />
            <br />
            <strong>민원상담신청</strong>
          </a>
        </div>

        <div class="subMenu text-center" style="display: inline-block; background-color: #5193f6">
          <a href="" class="sub">
            <img src="./images/icon03.PNG" alt="제안신청" />
            <br />
            <strong>제안신청</strong>
          </a>
        </div>

        <div class="subMenu text-center" style="display: inline-block; background-color: #5973e1">
          <a href="" class="sub">
            <img src="./images/icon04.PNG" alt="결과조회" />
            <br />
            <strong>결과조회</strong>
          </a>
        </div>
      </div>
      <!-- SubMenu_Second -->
      <div class="Sub_Menu_02 text-center">
        <!-- <div class="btn-group semi_btn"> -->
        <a href="" id="semiBtn" class="btn rounded-0">
          <img class="semi_btn_icon" src="./images/Icon05.png" alt="적극행정신청" />
          <p class="semi">적극행정신청</p>
        </a>
        <a href="" id="semiBtn" class="btn rounded-0">
          <img class="semi_btn_icon" src="./images/Icon06.png" alt="소극행정신고" />
          <p class="semi">소극행정신고</p>
        </a>
        <a href="" id="semiBtn" class="btn rounded-0">
          <img class="semi_btn_icon" src="./images/Icon07.png" alt="갑질피해신고" />
          <p class="semi">갑질피해신고</p>
        </a>
        <!-- </div> -->
        <!-- <div class="btn-group semi_btn m-0"> -->
        <a href="" id="semiBtn" class="btn rounded-0">
          <img class="semi_btn_icon" src="./images/Icon08.png" alt="예산낭비신고" />
          <p class="semi">예산낭비신고</p>
        </a>
        <a href="" id="semiBtn" class="btn rounded-0">
          <img class="semi_btn_icon" src="./images/Icon09.png" alt="부패공익 신고" />
          <p class="semi">부패공익 신고</p>
        </a>
        <a href="" id="semiBtn" class="btn rounded-0">
          <img class="semi_btn_icon" src="./images/Icon10.png" alt="행정심판청구" />
          <p class="semi">행정심판청구</p>
        </a>
        <!-- </div> -->
      </div>
      <!-- SubMenu_Third -->
      <div class="container Sub_Menu_03">
        <div id="demo2" class="carousel slide" data-bs-ride="carousel">
          <div class="row" style="padding: 10px">
            <div class="col-sm-1" style="padding-top: 2px; text-align: center">[알립니다]</div>
            <div class="col-sm-10" style="padding-top: 3px">
              <!-- The slideshow/carousel -->
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <div class="under_bar">국민신문고 시스템 점검 작업 안내 ~ 5/19(목)</div>
                  <div class="under_bar">2022-05-18</div>
                </div>
                <div class="carousel-item">
                  <div class="under_bar">광주광역시 및 광주광역시 기초자치단체 지방공휴일 관련 안내</div>
                  <div class="under_bar">2022-05-18</div>
                </div>
              </div>
            </div>
            <div class="col-sm-1">
              <!-- Left and right controls/icons -->
              <div class="controls_box justify-content-end" style="padding-top: 5px">
                <a href="" data-bs-target="#demo2" data-bs-slide="prev" class="carousel-control-prev-icon pr"></a>
                <!-- Indicators/dots -->
                <a href="" data-bs-target="#demo2" onclick=""><i class="fa-solid fa-play"></i></a>
                <a href="" data-bs-target="#demo2" data-bs-slide="next" class="carousel-control-next-icon ne"></a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- last_under_Bar -->
    <!-- 유관사이트 -->
    <div class="under_menu" style="background-color: #696a70; text-align: left; margin-top: 30px; padding-right: 45px">
      <div class="container">
        <ul class="ft_list">
          <a href=" " class="solo" style="color: orange">개인정보처리방침</a>
          <a href=" " class="yyy" style="color: white">&nbsp&nbsp&nbsp이용약관 </a>
          <a href=" " class="eee" style="color: white">&nbsp&nbsp&nbsp오류신고·이용문의</a>
          <a href=" " class="fff" style="color: white">&nbsp&nbsp&nbsp뷰어다운로드</a>
          <a href=" " class="ggg" style="color: white">&nbsp&nbsp&nbsp시각장애인 이용안내</a>
          <li
            class="nav-item dropup"
            style="
              display: inline-block;
              margin-left: 350px;
              border-left: 2px solid rgb(156, 156, 156);
              border-right: 2px solid rgb(156, 156, 156);
            "
          >
            <a class="nav-link dropdown-toggle" href="javascript:void(0)" data-bs-toggle="dropdown" style="color: white"
              >유관사이트 바로가기</a
            >
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">정부민원안내콜센터</a></li>
              <li><a class="dropdown-item" href="#">중앙행정심판위원회</a></li>
              <li><a class="dropdown-item" href="#">정보공개포털</a></li>
              <li><a class="dropdown-item" href="#">정부 24</a></li>
              <li><a class="dropdown-item" href="#">국가법령정보센터</a></li>
              <li><a class="dropdown-item" href="#">정책브리핑</a></li>
              <li><a class="dropdown-item" href="#">적극행정 통합 플랫폼</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
    <!-- bottom of bottom -->
    <div class="container ps-4 pb-4">
      <div style="display: inline-block; font-size: 14px">
        30102 세종특별자치시 도움5로 20 정부세종청사 국민권익위원회<br />

        정부민원안내 콜센터 (국번없이 110번(무료), 365일 24시간 상담가능, 수어상담 평일 09:00~18:00)<br />

        국민신문고 시스템 이용관련 문의 (1600-8172(유료), 070-4140-1458(유료),평일 09:00~18:00)<br />

        COPYRIGHT(c)국민권익위원회 All Rights Reserved.
      </div>
    </div>
  </body>
</html>
