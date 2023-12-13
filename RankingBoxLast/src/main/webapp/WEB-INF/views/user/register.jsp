<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="description" content>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<title>랭킹박스 - Go Craze</title>

<link rel="icon" href="/resources/dist/img/logoicon.png">

<link href="/resources/dist/css/style.css" rel="stylesheet"
	type="text/css" />
<script nonce="dbdc5b53-6149-4bb2-a711-c2d35b3278a6">(function(w,d){!function(j,k,l,m){j[l]=j[l]||{};j[l].executed=[];j.zaraz={deferred:[],listeners:[]};j.zaraz.q=[];j.zaraz._f=function(n){return async function(){var o=Array.prototype.slice.call(arguments);j.zaraz.q.push({m:n,a:o})}};for(const p of["track","set","debug"])j.zaraz[p]=j.zaraz._f(p);j.zaraz.init=()=>{var q=k.getElementsByTagName(m)[0],r=k.createElement(m),s=k.getElementsByTagName("title")[0];s&&(j[l].t=k.getElementsByTagName("title")[0].text);j[l].x=Math.random();j[l].w=j.screen.width;j[l].h=j.screen.height;j[l].j=j.innerHeight;j[l].e=j.innerWidth;j[l].l=j.location.href;j[l].r=k.referrer;j[l].k=j.screen.colorDepth;j[l].n=k.characterSet;j[l].o=(new Date).getTimezoneOffset();if(j.dataLayer)for(const w of Object.entries(Object.entries(dataLayer).reduce(((x,y)=>({...x[1],...y[1]})),{})))zaraz.set(w[0],w[1],{scope:"page"});j[l].q=[];for(;j.zaraz.q.length;){const z=j.zaraz.q.shift();j[l].q.push(z)}r.defer=!0;for(const A of[localStorage,sessionStorage])Object.keys(A||{}).filter((C=>C.startsWith("_zaraz_"))).forEach((B=>{try{j[l]["z_"+B.slice(7)]=JSON.parse(A.getItem(B))}catch{j[l]["z_"+B.slice(7)]=A.getItem(B)}}));r.referrerPolicy="origin";r.src="/cdn-cgi/zaraz/s.js?z="+btoa(encodeURIComponent(JSON.stringify(j[l])));q.parentNode.insertBefore(r,q)};["complete","interactive"].includes(k.readyState)?zaraz.init():j.addEventListener("DOMContentLoaded",zaraz.init)}(w,d,"zarazData","script");})(window,document);</script>

</head>


<body>
	<div class="preloader d-flex align-items-center justify-content-center">
		<div class="lds-ellipsis">
			<div></div>
			<div></div>
			<div></div>
			<div></div>
		</div>
	</div>

	<div class="Rankingbox">
		<img src="/resources/dist/img/core-img/logo.png" alt="랭킹박스">
	</div>

	<div class="vizew-login-area section-padding-80">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 col-md-6">
					<div class="login-content">

						<div class="section-heading">
							<h4>회원가입</h4>
							<div class="line"></div>
						</div>
						<form action="/user/register" method="post" onsubmit="return validateForm()">

							<div class="form-group" style="display: flex;">
								<input type="text" class="form-control" id="memId" name="memId"
									placeholder="아이디"> 	
									&nbsp
									<button type="button" id="idChk" onclick="fn_idChk();" value="N"
										class="btn vizew-btn">중복확인</button>		
							</div>
							
							<div style="margin-bottom: 20px;">
							<span id="memIdError" style="color: red";></span>
							</div>
							
							<div class="form-group">
								<input type="password" class="form-control" name="memPw"
									id="memPw" placeholder="비밀번호"> 
									<span id="memPwError" style="color: red;"></span>
							</div>
							<div class="form-group">
								<input type="password" class="form-control" name="memPwcheek"
									id="memPwcheek" placeholder="비밀번호확인"> 
									<span id="memPwcheekError" style="color: red;"></span>
							</div>
							<div class="form-group">
								<input type="name" class="form-control" id="memName"
									name="memName" placeholder="이름"> 
									<span id="memNameError" style="color: red;"></span>
							</div>
							<div class="form-group">
								<input type="name" class="form-control" id="memNicName"
									name="memNicName" placeholder="닉네임"> 
									<span id="memNicNameError" style="color: red;"></span>
							</div>
							<div class="form-group">
								<div class="custom-control custom-checkbox mr-sm-2">
									<input type="checkbox" class="custom-control-input"
										id="customControlAutosizing">

								</div>
							</div>
							<button type="submit" id="submit"
								class="btn vizew-btn w-100 mt-30">가입하기</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
	function validateForm() {
   		var memId = document.getElementById('memId').value;
    	var memPw = document.getElementById('memPw').value;
    	var memPwcheek = document.getElementById('memPwcheek').value;
    	var memName = document.getElementById('memName').value;
    	var memNicName = document.getElementById('memNicName').value;
    	var memIdError = document.getElementById('memIdError');
    	var memPwError = document.getElementById('memPwError');
    	var memNameError = document.getElementById('memNameError');
    	var memNicNameError = document.getElementById('memNicNameError');
    	var idChkVal = $("#idChk").val();
    	var isValid = true;

    // 간단한 유효성 검사
    if (memId === '') {
        memIdError.innerHTML = '아이디를 입력하세요.';
        isValid = false;
    } else if(idChkVal == "N"){
    	memIdError.innerHTML = '중복확인을 해주세요.';
        isValid = false;
    } else {
        memIdError.innerHTML = '';
    }

    if (memPw === '') {
        memPwError.innerHTML = '비밀번호를 입력하세요.';
        isValid = false;
    } else {
        memPwError.innerHTML = '';
    }
    
    if (memName === '') {
        memNameError.innerHTML = '이름을 입력하세요.';
        isValid = false;
    } else {
        memNameError.innerHTML = '';
    }
    
    if (memNicName === '') {
        memNicNameError.innerHTML = '닉네임을 입력하세요.';
        isValid = false;
    } else {
        memNicNameError.innerHTML = '';
    }
    
    if (memPwcheek === '') {
        memPwcheekError.innerHTML = '비밀번호를 한번 더 확인해주세요.';
        isValid = false;
    } else if (memPw !== memPwcheek) {
        memPwcheekError.innerHTML = '비밀번호와 비밀번호 확인이 일치하지 않습니다.';
        isValid = false;
    } else {
        memPwcheekError.innerHTML = '';
    }
    
    if(idChkVal == "N"){
		memIdError.innerHTML = '중복확인을 해주세요.';
        isValid = false;
	}
    
    return isValid;
    
}
	
	function fn_idChk(){
		$.ajax({
			url : "/user/idChk",
			type : "post",
			dataType : "json",
			data : {"memId" : $("#memId").val()},
			success : function(data){
				if(data == 1){
					$("#idChk").attr("value", "N");
					alert("중복된 아이디입니다.");
				}else if(data == 0){
					$("#idChk").attr("value", "Y");
					alert("사용가능한 아이디입니다.");
				}
			}
		})
	}
	
</script>




	<script type="text/javascript">
</script>

	<script src="/resources/js/jquery/jquery-2.2.4.min.js"></script>

	<script src="/resources/js/bootstrap/popper.min.js"
		type="text/javascript"></script>

	<script src="/resources/js/bootstrap/bootstrap.min.js"></script>

	<script src="/resources/js/plugins/plugins.js"></script>

	<script src="/resources/js/active.js"></script>

	<script async
		src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>

	<script>
    window.dataLayer = window.dataLayer || [];
    function gtag() { dataLayer.push(arguments); }
    gtag('js', new Date());

    gtag('config', 'UA-23581568-13');
  </script>
	<script defer
		src="https://static.cloudflareinsights.com/beacon.min.js/v84a3a4012de94ce1a686ba8c167c359c1696973893317"
		integrity="sha512-euoFGowhlaLqXsPWQ48qSkBSCFs3DPRyiwVu3FjR96cMPx+Fr+gpWRhIafcHwqwCqWS42RZhIudOvEI+Ckf6MA=="
		data-cf-beacon='{"rayId":"82769625f86fe02d","version":"2023.10.0","token":"cd0b4b3a733644fc843ef0b185f98241"}'
		crossorigin="anonymous"></script>

</body>

</html>
