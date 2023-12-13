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
						<li class="breadcrumb-item"><i
								class="fa fa-home" aria-hidden="true"></i> Home</li>
						<li class="breadcrumb-item active" aria-current="page">Community</li>
						<li class="breadcrumb-item active" aria-current="page">Modify</li>
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


		<form role="form" action="modifyPage" method="post">

			<input type='hidden' name='page' value="${cri.page}"> 
			<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
			<input type='hidden' name='searchType' value="${cri.searchType}">
			<input type='hidden' name='keyword' value="${cri.keyword}">


				<div class="section-heading style-2">
					<h4>게시글 수정</h4>
					<div class="line"></div>
				</div>

				<div class="contact-form-area mt-50">
					
						<div class="form-group">
							<label for="title">제목</label> 
							<input type="text" class="form-control" name='title' value="${boardVO.title}">
						</div>

						<div class="form-group">
							<div class="row">
								<div class="col-md-4">
									<input type="hidden" class="form-control"  name='bno' value="${boardVO.bno}" readonly>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<div class="row">
								<div class="col-md-4">
									<input type="hidden" class="form-control" name="writer" value="${boardVO.writer}" readonly>
								</div>
							</div>
						</div>
						</div>
						
						<div class="form-group">
							<label for="message">내용</label>
							<textarea class="form-control"  name="content"
							 cols="30" rows="10">${boardVO.content}</textarea>
						</div>
						
						<div class="form-group">
							<label for="file">첨부파일(File Drag & Drop)</label>
							<div class="fileDrop">이곳에 파일을 드래그해주세요.</div>
							
							<br>
							
						<ul class="mailbox-attachments clearfix uploadedList">
						</ul>	
							
							<br>							
							<button type="submit" class="btn vizew-btn mt-10" id="modifyBtn">저장</button>
							<button type="button" class="btn vizew-btn mt-10" id="cancelBtn">취소</button>
						</div>					
					</form>	
				</div>
			</div>
		</div>
		
</section>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>

<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

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
$(document).ready(function(){
		
	var formObj = $("form[role='form']");
	
	formObj.submit(function(event){
		event.preventDefault();
		
		var that = $(this);
		
		var str ="";
		$(".uploadedList .delbtn").each(function(index){
			 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
		});
		
		that.append(str);

		console.log(str);
		
		that.get(0).submit();
	});
	
	
	$("#cancelBtn").on("click", function(){
	  history.back();
	});
	
});




var template = Handlebars.compile($("#template").html());


$(".fileDrop").on("dragenter dragover", function(event){
	event.preventDefault();
});


$(".fileDrop").on("drop", function(event){
	event.preventDefault();
	
	var files = event.originalEvent.dataTransfer.files;
	
	var file = files[0];

	//console.log(file);
	
	var formData = new FormData();
	
	formData.append("file", file);	
	
	$.ajax({
		  url: '/uploadAjax',
		  data: formData,
		  dataType:'text',
		  processData: false,
		  contentType: false,
		  type: 'POST',
		  success: function(data){
			  
			  var fileInfo = getFileInfo(data);
			  
			  var html = template(fileInfo);
			  
			  $(".uploadedList").append(html);
		  }
		});	
});


$(".uploadedList").on("click", ".delbtn", function(event){
	
	event.preventDefault();
	
	var that = $(this);
	 
	$.ajax({
	   url:"/deleteFile",
	   type:"post",
	   data: {fileName:$(this).attr("href")},
	   dataType:"text",
	   success:function(result){
		   if(result == 'deleted'){
			   that.closest("li").remove();
		   }
	   }
   });
});


var bno = ${boardVO.bno};
var template = Handlebars.compile($("#template").html());

$.getJSON("/sboard/getAttach/"+bno,function(list){
	$(list).each(function(){
		
		var fileInfo = getFileInfo(this);
		
		var html = template(fileInfo);
		
		 $(".uploadedList").append(html);
		
	});
});

$(".uploadedList").on("click", ".mailbox-attachment-info a", function(event){
	
	var fileLink = $(this).attr("href");
	
	if(checkImageType(fileLink)){
		
		event.preventDefault();
				
		var imgTag = $("#popup_img");
		imgTag.attr("src", fileLink);
		
		console.log(imgTag.attr("src"));
				
		$(".popup").show('slow');
		imgTag.addClass("show");		
	}	
});

$("#popup_img").on("click", function(){
	
	$(".popup").hide('slow');
	
});	


</script>



<%@include file="../include/footer.jsp"%>