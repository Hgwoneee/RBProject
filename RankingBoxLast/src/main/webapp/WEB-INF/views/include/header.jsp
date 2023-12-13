<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<!--html5 문서임을 선언하는 부분-->

<html lang="ko">
<!--html 문서의 시작을 나타내며, 'lang' 속성으로 한국어를 사용함을 나타냄-->
<head>
<!--웹페이지의 헤더 부분으로, 메타 정보, 페이지 제목, 스타일 시트 등이 여기에 위치-->
<meta charset="UTF-8">
<!--문자 인코딩을 UTF-8로 설정-->
<meta name="description" content>
<!--페이지에 대한 설명을 제공하는 메타 태그, 현재는 내용이 비어있는 상태이며, 실제로는 페이지 설명이 들어감-->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Explorer의 호환성 모드 설정을 최신 버전으로 설정-->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!--반응형 웹 디자인을 위한 뷰포트 설정-->
<title>랭킹박스 - Go Craze</title>
<!--웹페이지의 제목을 나타내며, 현재는 "랭킹박스 & hehe"로 설정-->
<link rel="icon" href="/resources/dist/img/logoicon.png">
<!--파비콘을 설정하는 부분으로, favicon.ico 파일이 img/core-img/ 경로에 위치해야 합니다.-->
<link href="/resources/dist/css/style.css" rel="stylesheet"
	type="text/css" />
<!--외부 스타일 시트인 'style.css'파일을 연결하는 부분-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
	



</head>
<!--헤더태그 끝-->

<body>

	<!--로딩 중 표시를 위한 디자인된 요소-->
	<div class="preloader d-flex align-items-center justify-content-center">
		<div class="lds-ellipsis">
			<div></div>
			<div></div>
			<div></div>
			<div></div>
		</div>
	</div>

	<!--웹페이지 헤더 영역-->
	<header class="header-area">

		<!--상단 헤더 영역-->
		<div class="top-header-area">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-12 col-md-6">

						<!--브레이킹 뉴스 영역-->
						<div class="breaking-news-area d-flex align-items-center">
							<div class="news-title">
								<p>popularityNews:</p>
							</div>
							<div id="breakingNewsTicker" class="ticker">
								<ul>
									<li><a href="single-post.html">뉴스1 - 제목1</a></li>
									<li><a href="single-post.html">뉴스2 - 제목2</a></li>
									<li><a href="single-post.html">뉴스3 - 제목3</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-12 col-md-6">

						<!--상단 메타 데이터 및 소셜 정보-->
						<div
							class="top-meta-data d-flex align-items-center justify-content-end">
							<div class="top-social-info">
								<a href="https://www.youtube.com/"><i
									class="fa-brands fa-youtube"></i></a> <a
									href="https://www.instagram.com/?hl=ko"><i
									class="fa-brands fa-instagram"></i></a>
							</div>

							<!--환영 메시지-->
							<div>${login.memName}님 안녕하세요.</div>

							<!--로그아웃 버튼-->
							<div id="greeting-message"></div>
							<button id="logout-btn" onclick="location.href='/user/logout'">로그아웃</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!--메인 메뉴영역-->
		<div class="vizew-main-menu" id="sticker">
			<div class="classy-nav-container breakpoint-off">
				<div class="container">

					<!--네비게이션 바-->
					<nav class="classy-navbar justify-content-between" id="vizewNav">	

						<!--로고이 이미지-->
						<a href="/index" class="nav-brand"><img
							src="/resources/dist/img/core-img/logo.png" alt></a>

					
							<!--네비게이션 목록-->
							<div class="classynav">
								<ul>
									<!--메뉴 항목들-->
									<li class="active"><a href="/index">Home</a></li>
									<li><a href="/sboard/list">Community</a></li>
									<li><a href="/user/myPage">MyPage</a></li>
								</ul>
	</header>