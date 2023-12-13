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
						<li class="breadcrumb-item active" aria-current="page">Community</li>
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
					<h4>커뮤니티</h4>					
					<div class="line"></div>
				</div>
				
				<table class="bltTbl">
					<colgroup>
						<col style="width: 88px;">
						<col style="width: 450px;">
						<col style="width: 180px;">
						<col style="width: 180px;">
						<col style="width: 80px;">
					</colgroup>
					
					<a href="/sboard/register" class="btn vizew-btn2 mt-15">글쓰기</a>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${list}" var="boardVO">
							<tr>
								<td>${boardVO.bno}</td>
								<td><a
									href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&bno=${boardVO.bno}'>
										${boardVO.title} 
										<c:if test= "${boardVO.replycnt > 0}">
										<strong>[ ${boardVO.replycnt} ]</strong>
										</c:if>
								</a></td>
								<td>${boardVO.writer}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${boardVO.regdate}" /></td>
								<td>${boardVO.viewcnt}</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>


					<div class="text-center">
					<nav class="mt-50">
						<ul class="pagination  justify-content-center">

							<c:if test="${pageMaker.prev}">
								<li class="page-item"><a class="page-link"
									href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li class="page-item"
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a class="page-link" href="list${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li class="page-item"><a class="page-link"
									href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>

						</ul>
						</nav>
					</div>

				</div>


				<form id="artsearch">
					<select name="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							선택</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							제목</option>
						<option value="c"
							<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
							내용</option>
						<option value="w"
							<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
							작성자</option>
						<option value="tc"
							<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
							제목 + 내용</option>
						<option value="cw"
							<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
							내용 + 작성자</option>
						<option value="tcw"
							<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
							제목 + 내용 + 작성자</option>
					</select> <input type="text" name='keyword' id="keywordInput"
						value='${cri.keyword }'>
						&nbsp
					<button id='searchBtn'>검색</button>
				</form>
				</div>
			</div>
		</div>
	</div>
</section>

<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("등록이 완료되었습니다.");
		location.replace(self.location);
	}
	
	if (result == 'SUCCESSDEL') {
		alert("삭제 되었습니다.")
	}
	
</script>

<script>
	$(document).ready(
			function() {

				$('#searchBtn').on(
						"click",
						function(event) {

							self.location = "sboard/list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						});
			});
</script>



<%@include file="../include/footer.jsp"%>