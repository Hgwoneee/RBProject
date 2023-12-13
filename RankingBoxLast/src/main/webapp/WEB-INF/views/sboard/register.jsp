<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>


<style>
.fileDrop {
	width: 100%;
	height: 100px;
	border: 1px dotted gray;
	background-color: lightslategrey;
	margin: auto;
	color: black;
}
</style>




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
							aria-hidden="true"></i> Home</li>
						<li class="breadcrumb-item active" aria-current="page">Community</li>
						<li class="breadcrumb-item active" aria-current="page">Register</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>

<section class="contact-area mb-80">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-md-7 col-lg-8">

				<div class="section-heading style-2">
					<h4>게시글</h4>
					<div class="line"></div>
				</div>

				<div class="contact-form-area mt-50">
					<form id="registerForm" role="form" method="post">
						<div class="form-group">
							<label for="name">제목</label> <input type="text" name='title'
								class="form-control" id="title1" value="제목을 입력해주세요.">
									<span id="titleError" style="color: red;"></span>
						</div>
						<div class="form-group">
							<label for="name">작성자</label> <input type="text" name="writer"
								class="form-control" id="name" value="${login.memNicName}"
								readonly>
						</div>
						<div class="form-group">
							<label for="message">내용</label>
							<textarea class="form-control" id="content1" name="content"
								cols="30" rows="10" >내용을 입력해주세요.</textarea>
								<span id="contentError" style="color: red;"></span>
						</div>
						<div class="form-group">
							<label for="file">첨부파일(File Drag & Drop)</label>
							<div class="fileDrop">이곳에 파일을 드래그해주세요.</div>

							<ul class="mailbox-attachments clearfix uploadedList"></ul>

							<button type="submit" class="btn vizew-btn mt-30" >등록</button>
							&nbsp <a href="/sboard/list" class="btn vizew-btn mt-30">목록</a>
						</div>
					</form>
				</div>
			</div>
			</div>
			</div>
</section>


<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
	</span>
  </div>
</li>                
</script>

<script>


	var template = Handlebars.compile($("#template").html());

	$(".fileDrop").on("dragenter dragover", function(event) {
		event.preventDefault();
	});

	$(".fileDrop").on("drop", function(event) {
		event.preventDefault();

		var files = event.originalEvent.dataTransfer.files;

		var file = files[0];

		var formData = new FormData();

		formData.append("file", file);

		$.ajax({
			url : '/uploadAjax',
			data : formData,
			dataType : 'text',
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {

				var fileInfo = getFileInfo(data);

				var html = template(fileInfo);

				$(".uploadedList").append(html);
			}
		});
	});

	$(".uploadedList").on("click", ".delbtn", function(event) {

		event.preventDefault();

		var that = $(this);

		$.ajax({
			url : "/deleteFile",
			type : "post",
			data : {
				fileName : $(this).attr("href")
			},
			dataType : "text",
			success : function(result) {
				if (result == 'deleted') {
					that.closest("li").remove();
				}
			}
		});
	});

	
	$("#registerForm").submit(
			
			function(event) {
				
				event.preventDefault();

				var that = $(this);

				var str = "";
				$(".uploadedList .delbtn").each(
						function(index) {
							str += "<input type='hidden' name='files[" + index
									+ "]' value='" + $(this).attr("href")
									+ "'> ";
						});

				that.append(str);

				that.get(0).submit();
			});
</script>


<%@include file="../include/footer.jsp"%>