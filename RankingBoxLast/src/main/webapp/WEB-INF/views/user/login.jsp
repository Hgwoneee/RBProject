<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="description" content>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<title>랭킹박스 - Go Craze</title>

<link rel="icon" type="image/x-icon" href="/resources/dist/img/logoicon.png">

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
							<h4>로그인</h4>
							<div class="line"></div>
						</div>
						<form action="/user/loginPost" method="post" onsubmit="return validateForm()">
							<div class="form-group">
								<input type="text" class="form-control" id="memId"
									name="memId" placeholder="ID">
									 <span id="memIdError" style="color: red;"></span>
							</div>
							<div class="form-group">
								<input type="password" class="form-control" name="memPw"
									id="memPw" placeholder="Password">
									 <span id="memIdError" style="color: red;"></span>
							</div>
							<div class="form-group">
								<div class="custom-control custom-checkbox mr-sm-2">
									<input type="checkbox" name="useCookie"
										class="custom-control-input" id="customControlAutosizing">
									<label class="custom-control-label"
										for="customControlAutosizing">Remember me</label>
								</div>
							</div>
							<button type="submit" id="submit" class="btn vizew-btn w-100 mt-30">로그인</button>
							<button id="signupButton" type="button"
								class="btn vizew-btn w-100 mt-30">회원가입</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
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
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>
	<script defer
		src="https://static.cloudflareinsights.com/beacon.min.js/v84a3a4012de94ce1a686ba8c167c359c1696973893317"
		integrity="sha512-euoFGowhlaLqXsPWQ48qSkBSCFs3DPRyiwVu3FjR96cMPx+Fr+gpWRhIafcHwqwCqWS42RZhIudOvEI+Ckf6MA=="
		data-cf-beacon='{"rayId":"82769625f86fe02d","version":"2023.10.0","token":"cd0b4b3a733644fc843ef0b185f98241"}'
		crossorigin="anonymous"></script>
	<script>
    // JavaScript를 사용하여 클릭 시 리다이렉션 수행
    document.getElementById("signupButton").addEventListener("click", function() {
        window.location.href = "/user/register";
    });
</script>

</body>
</html>