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
						<li class="breadcrumb-item active" aria-current="page">Modify</li>
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
				<h4>프로필 수정</h4>
				<div class="line"></div>
			</div>

			<form action="/user/modify" method="post"
				onsubmit="return validateForm()">

				<div class="form-group">
					<label for="name">아이디 (변경할 수 없습니다.)</label> <input type="text"
						name="memId" class="form-control" id="memId"
						value="${login.memId}" readonly>
				</div>
				
			

				<div class="form-group">
					<label for="name">새 비밀번호</label> <input type="password" name="newPassword" id="newPassword"
					 class="form-control" placeholder="새 비밀번호">
					<span id="memPwError2" style="color: red;"></span>
				</div>


				<div class="form-group">
					<label for="name">이름</label> <input type="text" name="memName"
						class="form-control" id="memName" placeholder="새 이름"> <span
						id="memNameError" style="color: red;"></span>
				</div>

				<div class="form-group">
					<label for="name">닉네임</label> <input type="text" name="memNicName"
						class="form-control" id="memNicName" placeholder="새 닉네임">
					<span id="memNicNameError" style="color: red;"></span>
				</div>

				<div class="form-group">
					<div class="custom-control custom-checkbox mr-sm-2">
						<input type="checkbox" class="custom-control-input"
							id="customControlAutosizing">
					</div>
				</div>

				<button type="submit" id="submit"
					class="btn vizew-btn mt-15 mx-auto d-block">저장</button>

				<div class="form-group"></div>
			</form>
		</div>

	</div>
</div>


<script>
function validateForm() {
    
    var newPassword = document.getElementById('newPassword').value;
    var memName = document.getElementById('memName').value;
    var memNicName = document.getElementById('memNicName').value;
    var memPwError = document.getElementById('memPwError');
    var memPwError2 = document.getElementById('memPwError2');
    var memNameError = document.getElementById('memNameError');
    var memNicNameError = document.getElementById('memNicNameError');
    var isValid = true;



    if (newPassword === '') {
        // 새로운 비밀번호 미입력 시 처리
        memPwError2.innerHTML = '새로운 비밀번호를 입력하세요.';
        isValid = false;
    } else {
        memPwError2.innerHTML = '';
    }


    if (memName === '') {
        // 이름 미입력 시 처리
        memNameError.innerHTML = '이름을 입력하세요.';
        isValid = false;
    } else {
        memNameError.innerHTML = '';
    }

    if (memNicName === '') {
        // 닉네임 미입력 시 처리
        memNicNameError.innerHTML = '닉네임을 입력하세요.';
        isValid = false;
    } else {
        memNicNameError.innerHTML = '';
    }

    return isValid;
}
</script>

<%@include file="../include/footer.jsp"%>
