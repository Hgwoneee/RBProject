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
						<li class="breadcrumb-item"><i
								class="fa fa-home" aria-hidden="true"></i> Home</li>
						<li class="breadcrumb-item active" aria-current="page">Mypage</li>
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
				<h4>마이페이지</h4>
				<div class="line"></div>
			</div>
			
				<div class="form-group">
					<label for="name">아이디</label> 
					<input type="text" class="form-control" id="exampleInputEmail1"
						name="memId" value="${login.memId}" readonly>
				</div>
				<div class="form-group">
					<label for="text">이름</label> 
					<input type="text" class="form-control" id="name" 
						name="memName" value="${login.memName}" readonly>
				</div>
				<div class="form-group">
					<label for="text">닉네임</label> 
					<input type="text" class="form-control" id="name"
						name="memNicName" value="${login.memNicName}" readonly>
				</div>

			<div class="form-group">
				<div class="custom-control custom-checkbox mr-sm-2">
					<input type="checkbox" class="custom-control-input"
						id="customControlAutosizing">
				</div>
			</div>
			
			
			<div class="form-group">
				<a href="/user/modify" class="btn vizew-btn mt-15">프로필 수정</a>
				&nbsp
				<a href="/user/delete"  class="btn vizew-btn mt-15">회원탈퇴</a>
			</div>

		</div>

	</div>
</div>



<%@include file="../include/footer.jsp"%>