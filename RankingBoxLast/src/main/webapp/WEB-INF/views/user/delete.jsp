<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>

<div class="preloader d-flex align-items-center justify-content-center">
	<div class="lds-ellipsis">
		<div></div>
		<div></div>
		<div></div>
		<div></div>
	</div>
</div>


<div class="vizew-breadcrumb">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><i class="fa fa-home"
							aria-hidden="true"></i> Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">Mypage</li>
						<li class="breadcrumb-item active" aria-current="page">Delete</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>


<div class="container">
	<div class="row justify-content-center">
		<div class="col-12 col-md-7 col-lg-8">

			<div class="section-heading style-2">
				<h4>회원 탈퇴</h4>
				<div class="line"></div>
			</div>

			<form action="/user/delete" method="post">

				<div class="form-group">
					<label for="name">아이디 </label> <input type="text"
						name="memId" class="form-control" id="memId"
						value="${login.memId}" readonly>
					<span style="color: red;">한번 탈퇴하시면 복구 할 수 없습니다. 신중하게 결정해주세요.</span>
				</div>
				

					<button type="submit" id="submit"
						class="btn vizew-btn mt-15 mx-auto d-block">회원탈퇴</button>

					<div class="form-group"></div>
			</form>
		</div>

	</div>
</div>



<%@include file="../include/footer.jsp"%>