<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>

 <script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>


 

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
						<li class="breadcrumb-item active" aria-current="page">Read</li>
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


		<div class='popup back' style="display: none;"></div>
		<div id="popup_front" class='popup front' style="display: none;">
			<img id="popup_img">
		</div>

		<form role="form" action="modifyPage" method="post">

			<input type='hidden' name='bno' value="${boardVO.bno}"> 
			<input type='hidden' name='page' value="${cri.page}"> 
			<input type='hidden' name='perPageNum' value="${cri.perPageNum}"> 
			<input type='hidden' name='searchType' value="${cri.searchType}"> 
			<input type='hidden' name='keyword' value="${cri.keyword}">

		</form>

				<div class="section-heading style-2">
					<h4>게시글</h4>
					<div class="line"></div>
					<div class="listbtnright">
						<a href="/sboard/list" class="btn vizew-btn2 mt-30">목록</a>
					</div>
				</div>

				<div class="contact-form-area mt-50">
					
						<div class="form-group">
							<label for="title">제목</label> <input type="text"
								class="form-control" id="title" value="${boardVO.title}" readonly>
						</div>

						<div class="form-group">
							<div class="row">
								<div class="col-md-4">
									<label for="author">작성자</label> <input type="text"
										class="form-control" id="author" value="${boardVO.writer}" readonly>
								</div>
								<div class="col-md-4">
									<label for="date">날짜</label>								
									<input class="form-control" id="date" type="text" value="<fmt:formatDate value="${boardVO.regdate}" pattern = "yyyy-MM-dd HH:mm"/>" readonly>
								</div>
								<div class="col-md-4">
									<label for="number">조회수</label> <input type="text"
										class="form-control" id="number" value="${boardVO.viewcnt}" readonly>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="message">내용</label>
							<textarea name="message" class="form-control" id="message"
								readonly="readonly" cols="30" rows="10">${boardVO.content}</textarea>
						</div>
						
						<div>
						<ul class="mailbox-attachments clearfix uploadedList">
						</ul>
						</div>

						
						<c:if test="${login.memNicName == boardVO.writer}">
							<button type="submit" class="btn vizew-btn mt-10" id="modifyBtn">게시글 수정</button>
							<button type="submit" class="btn vizew-btn mt-10" id="removeBtn">게시글 삭제</button>
						</c:if>
						

						<div>
							<div class="contact-form-area mt-50">
								<div class="form-group">
									<div class="section-heading style-2">
										<h4>댓글</h4>
										<div class="line"></div>
										<br>
										<c:if test="${boardVO.replycnt == 0}">
										<p> 등록된 댓글이 없습니다.</p>
										</c:if>
						<div>
							<ul class="timeline">
								<c:if test="${boardVO.replycnt > 0}">
								<li class="time-label" id="repliesDiv">
								<span class="btn vizew-btn mt-10" style="margin-bottom: 30px;">
								댓글 보기 <small id='replycntSmall'> [
								${boardVO.replycnt} ] </small>
								</span>
								</li>
								</c:if>
							</ul>
						</div>
									</div>
								</div>
							</div>
						</div>
						<div class="line"></div>
						<br>
						
						<div class="form-group">
							<input type="hidden" name="replyer" id="newReplyWriter" value="${login.memNicName}"></input>
							<textarea name="replytext" class="form-control" id="newReplyText"
								rows="3" placeholder="댓글내용을 입력해주세요."></textarea>
							<button type="submit" class="btn vizew-btn mt-10" id="replyAddBtn" >댓글 등록</button>
						</div>
				</div>
			</div>
		</div>
	</div>
	
</section>

	<div id="modifyModal" class="modal modal-primary fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" style="display:none;"></h4><strong style="color:white; font-size:25px;">- 댓글 수정 -</strong>
				</div>
				<div class="modal-body" data-rno>
					<p>	
						<input type="text" id="replytext" class="form-control">
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="replyModBtn" style="background-color:#db4437; color:white;">수정</button>
					<button type="button" class="btn btn-danger" id="replyDelBtn" style="background-color:#db4437; color:white;">삭제</button>
					<button type="button" class="btn btn-default" data-dismiss="modal" style="background-color:#db4437; color:white;">닫기</button>
				</div>
			</div>
		</div>
	</div>


<script id="templateAttach" type="text/x-handlebars-template">
<li data-src='{{fullName}}'>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	</span>
  </div>
</li>                
</script>



<script id="template" type="text/x-handlebars-template">
  {{#each .}}
    <li class="replyLi" data-rno={{rno}}>
      <div class="single-comment d-flex align-items-center">
        <div class="comment-author-thumbnail"style="margin-right: 20px;">
          <img src="/resources/dist/img/message.png" alt="프로필" style="width: 50px; height: 50px;">
        </div>
        <div class="comment-content flex-grow-1">
          <div class="comment-meta">
            <a class="timeline-header">{{replyer}}</a>
            <a> - {{prettifyDate regdate}}</a>
          </div>
          <p class="timeline-body" style="color: white;">{{replytext}}</p>
        </div>
      
        <div class="timeline-footer">
		{{#if (isLogin replyer)}}
          <a class="btn custom-btn" data-toggle="modal" data-target="#modifyModal"><i class="fas fa-edit"></i>수정</a>
		{{else}}
		  <a class="btn custom-btn" data-toggle="modal" data-target="#modifyModal" style="display: none;"><i class="fas fa-edit"></i>수정</a>
		{{/if}}
        </div>
      </div>
    </li>
  {{/each}}
</script>

<script>
	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
	});
	
	Handlebars.registerHelper('isLogin', function(replyer) {
		  return replyer == "<c:out value='${login.memNicName}'/>";
	});
	
	var printData = function(replyArr, target, templateObject) {

		var template = Handlebars.compile(templateObject.html());

		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);
		

	}

	var bno = ${boardVO.bno};

	var replyPage = 1;

	function getPage(pageInfo) {

		$.getJSON(pageInfo, function(data) {
			printData(data.list, $("#repliesDiv"), $('#template'));
			
			printPaging(data.pageMaker, $(".pagination"));

			$("#modifyModal").modal('hide');
			$("#replycntSmall").html("[ " + data.pageMaker.totalCount + " ]");
			
		});
			
		
	}
	

	var printPaging = function(pageMaker, target) {

		var str = "";

		if (pageMaker.prev) {
			str += "<li><a href='" + (pageMaker.startPage - 1)
					+ "'> << </a></li>";
		}

		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}

		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1)
					+ "'> >> </a></li>";
		}

		target.html(str);
	};

	$("#repliesDiv").on("click", function() {

		if ($(".timeline li").size() > 1) {
			return;
		}
		getPage("/replies/" + bno + "/1");
		
	});

	$(".pagination").on("click", "li a", function(event) {

		event.preventDefault();

		replyPage = $(this).attr("href");

		getPage("/replies/" + bno + "/" + replyPage);

	});

	$("#replyAddBtn").on("click", function() {

		var replyerObj = $("#newReplyWriter");
		var replytextObj = $("#newReplyText");
		var replyer = replyerObj.val();
		var replytext = replytextObj.val();

		$.ajax({
			type : 'post',
			url : '/replies/',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				bno : bno,
				replyer : replyer,
				replytext : replytext
			}),
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					alert("등록 되었습니다.");
					replyPage = 1;
					getPage("/replies/" + bno + "/" + replyPage);
					replyerObj.val("");
					replytextObj.val("");
					location.reload();
				}
			}
		});
	});

	$(".timeline").on("click", ".replyLi", function(event) {

		var reply = $(this);

		$("#replytext").val(reply.find('.timeline-body').text());
		$(".modal-title").html(reply.attr("data-rno"));
		
	});

	$("#replyModBtn").on("click", function() {
		
		var rno = $(".modal-title").html();
		var replytext = $("#replytext").val();

		$.ajax({
			type : 'put',
			url : '/replies/' + rno,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			data : JSON.stringify({
				replytext : replytext
			}),
			dataType : 'text',
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					alert("수정 되었습니다.");
					getPage("/replies/" + bno + "/" + replyPage);
				}
			}
		});
	});

	$("#replyDelBtn").on("click", function() {

		var rno = $(".modal-title").html();
		var replytext = $("#replytext").val();

		$.ajax({
			type : 'delete',
			url : '/replies/' + rno,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : 'text',
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					alert("삭제 되었습니다.");
					getPage("/replies/" + bno + "/" + replyPage);
				}
			}
		});
	});
</script>


<script>
	$(document).ready(
			function() {
							
				
				var formObj = $("form[role='form']");

				console.log(formObj);

				$("#modifyBtn").on("click", function() {
					formObj.attr("action", "/sboard/modifyPage");
					formObj.attr("method", "get");
					formObj.submit();
				});

				/* 	$("#removeBtn").on("click", function(){
				 formObj.attr("action", "/sboard/removePage");
				 formObj.submit();
				 }); */

				$("#removeBtn").on("click", function() {

					
					if(confirm("삭제하시겠습니까?")) {
						
						
						var arr = [];
						$(".uploadedList li").each(function(index) {
							arr.push($(this).attr("data-src"));
						});

						if (arr.length > 0) {
							$.post("/deleteAllFiles", {
								files : arr
							}, function() {

							});
						}

						formObj.attr("action", "/sboard/removePage");
						formObj.submit();
					
					}else {
						return;
					}
					
					}
					
					);

				 
				$("#goListBtn ").on("click", function() {
					formObj.attr("method", "get");
					formObj.attr("action", "/sboard/list");
					formObj.submit();
				});

				var bno = ${boardVO.bno};
				var template = Handlebars.compile($("#templateAttach").html());

				$.getJSON("/sboard/getAttach/" + bno, function(list) {
					$(list).each(function() {

						var fileInfo = getFileInfo(this);

						var html = template(fileInfo);

						$(".uploadedList").append(html);

					});
				});

			});
				
	
</script>


<%@include file="../include/footer.jsp"%>