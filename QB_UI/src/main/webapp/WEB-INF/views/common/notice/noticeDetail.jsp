<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<link href="${pageContext.request.contextPath}/css/noticeView.css"
	rel="stylesheet">
<style>
#replyAddBtn{
	width:100%;
	height:100px;
}
#replyArea{
	width:100%;
	height:100px;
}
.img{
	width:100px;
	height:100px;
}

</style>

<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="row mt">
			<div class="col-lg-12">
				<div class="row content-panel">
					<div class="panel-body ">
						<div class="mail-header row">
							<div class="col-md-8 noticeContent">
								<h4 class="pull-left">${result[0].notice_name}</h4>
							</div>
							<div class="col-md-4">
								<div class="compose-btn pull-right"></div>
							</div>
						</div>
						<div class="mail-sender">
							<div class="row">
								<div class="col-md-8"></div>
								<div class="col-md-4 pull-right noticeDetailWriterDiv">
									<p class="date">
										<strong>${result[0].member_id}</strong>&nbsp; &nbsp; ${result[0].notice_date} &nbsp; &nbsp;
									</p>
								</div>
							</div>
						</div>

						<div class="view-mail noticeContent">
							${result[0].notice_content}
						</div>
						<div class="attachment-mail noticeContent">
							<p>
							<c:choose>
							<c:when test="${empty result[0].notice_file1 && empty result[0].notice_file2}">
								<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-paperclip"></i> 첨부된 파일이 없습니다.</span>
							</c:when>
							</c:choose>
							<c:choose>
							<c:when test="${not empty result[0].notice_file1 ||	not empty result[0].notice_file2}">
								<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-paperclip"></i> 첨부파일</span>
							</c:when>
							</c:choose>
							</p>
							<div class="col-sm-4">
								<c:choose>
								<c:when test="${not empty result[0].notice_file1}">
								<img src="${pageContext.request.contextPath}/upload/notice/${result[0].notice_file1}" class="img" onerror="this.src='${pageContext.request.contextPath}/upload/notice/error.jpg'">
								<br>
								<span class="span">${originFileName1}</span>
								<br>
								<a href="${pageContext.request.contextPath}/file/${result[0].notice_file1}.do">다운로드</a>
								</c:when>
								</c:choose>
							</div>
							<div class="col-sm-4">
								<c:choose>
								<c:when test="${not empty result[0].notice_file2}">
								<img src="${pageContext.request.contextPath}/upload/notice/${result[0].notice_file2}" class="img" onerror="this.src='${pageContext.request.contextPath}/upload/notice/error.jpg'">
								<br>
								<span class="span">${originFileName2}</span>
								<br>
								<a href="${pageContext.request.contextPath}/file/${result[0].notice_file2}.do">다운로드</a>
								</c:when>
								</c:choose>
							</div>
						</div>
						<div id="list1body">
						<c:forEach items="${comment}" var="comment">
						<c:choose>
						<c:when test="${comment.comment_group eq 0}">
						<div class="row noticeView_Comments_1 noticeContent comment_number" id="${comment.comment_num}">
							<div class="col-sm-3">
								<strong>${comment.member_id}</strong><br> ${comment.comment_date}
							</div>
							<div class="col-sm-6 content">${comment.comment_content}</div>
							<div class="col-sm-3">&nbsp;&nbsp;
								<a class="reply"><i class="fa fa-reply"></i>댓글</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<c:choose>
								<c:when test="${name eq comment.member_id}">
								<a class="update"><i class="fa fa-pencil" id="${comment.comment_num}"></i>수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a class="delete"><i class="fa fa-trash-o" id="${comment.comment_num}"></i>삭제</a>
								</c:when>
								<c:otherwise>
								</c:otherwise>
								</c:choose>
								
							</div>
							
						</div>
						</c:when>
						</c:choose>
						
						<c:forEach items="${commentGroup}" var="commentGroup">
						<c:choose>
						<c:when test="${commentGroup.comment_group eq comment.comment_num}">
						<div class="row noticeView_Comments_2 noticeContent" id="${commentGroup.comment_group}">
							<div class="col-sm-3">
								<strong>ㄴ ${commentGroup.member_id}</strong><br>${commentGroup.comment_date}
							</div>
							<div class="col-sm-6 content">${commentGroup.comment_content}</div>
							<div class="col-sm-3">
								<a class="replyReply"><i class="fa fa-reply"></i>댓글</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<c:choose>
								<c:when test="${name eq commentGroup.member_id}">
								<a class="update"><i class="fa fa-pencil" id="${commentGroup.comment_num}"></i>수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a class="delete"><i class="fa fa-trash-o" id="${commentGroup.comment_num}"></i>삭제</a>
								</c:when>
								<c:otherwise>
								</c:otherwise>
								</c:choose>
							</div>
						</div>
						</c:when>
						</c:choose>
						</c:forEach>
						</c:forEach>
						</div>
						<br>
						<div class="row noticeView_Comments_2">
						<div class="col-sm-9">
						<textarea name="replyArea" cols="40" rows="3" id="replyArea"></textarea>
						</div>
						<div class="col-sm-2">
						<button type="button" class="btn btn-default" id="replyAddBtn">등록</button>
						</div> 
						</div>
						
						

						
						<div class="row noticeDetailBtnDiv">
							<se:authorize access="hasRole('ROLE_TEACHER')">
							<a href="teacherMain.do" class="btn btn-theme">글 목록</a>
							</se:authorize>
							<se:authorize access="hasRole('ROLE_ADMIN')">
							<a href="adminClassMain.do?class_name=${result[0].class_name}" class="btn btn-theme">글 목록</a>
							</se:authorize>
							<se:authorize access="hasRole('ROLE_TEACHER') OR hasRole('ROLE_ADMIN')">
							<button type="button" id="updateNotice"class="btn btn-theme">글 수정</button>
							<button type="button" data-toggle="modal" data-target="#DeleteModal" class="btn btn-theme04">글 삭제</button>
							</se:authorize>
						</div>

					</div>

				</div>
			</div>
		</div>
	</section>
</section>

<!-- 삭제 모달창 -->
<div class="modal fade" id="DeleteModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">알림창</h4>
								<!-- modal-header 끝 -->
							</div>
							<div class="modal-body"><h4>정말 삭제하시겠습니까?</h4><br>
							<h5>해당 글을 삭제할 시 다시 복구할 수 없습니다</h5>
							</div>
							<div class="modal-footer">
								<div class="form-group">
									<div class="col-lg-offset-2 col-lg-10">
										<button id="deleteNotice" class="btn btn-theme" value="">확인</button>
										<button class="btn btn-theme04" type="button"
											data-dismiss="modal">취소</button>
									</div>
								</div>
							</div>
							<!-- modal-content 끝 -->
						</div>
						<!-- modal-dialog 끝 -->
					</div>
				</div>
			
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
$(document).ready(function(){
	var notice_num = "<c:out value='${result[0].notice_num}'/>";
	var class_name = "<c:out value='${result[0].class_name}'/>";
	var member_id = "${name}";
	var count = 0;
	
	$(document).on('click','.reply',function(){
		
 	   		
		if($(this).text()=='댓글'&&count==0){
			$(this).parent().parent().after("<div class='row noticeView_Comments_2 noticeContent commcomm'><div class='col-sm-3'>ㄴ <input type='text' class='replyInput' maxlength='40' required style=width:500px;><a class='replyAdd'><i class='fa fa-plus-square'></i>등록</a></div></div>");
			$(this).html('<i class="fa fa-share"></i>취소');	
			count=1;
		}else if($(this).text()=='취소'){
			$('.commcomm').remove();
			$(this).html('<i class="fa fa-reply"></i>댓글');
			count = 0;
		}else if($(this).text()=='댓글'&&count==1){
			$('.commcomm').prev().children().eq(2).children().eq(0).html('<i class="fa fa-reply"></i>댓글');
			$('.commcomm').remove();
			$(this).parent().parent().after("<div class='row noticeView_Comments_2 noticeContent commcomm'><div class='col-sm-3'>ㄴ <input type='text' class='replyInput' maxlength='40' required style=width:500px;><a class='replyAdd'><i class='fa fa-plus-square'></i>등록</a></div></div>");
			$(this).html('<i class="fa fa-share"></i>취소');
			count=1;
		}
 	   	
 	   	
	});
	
	$(document).on('click','.replyAdd',function(){
		var replyInput = $(this).siblings('.replyInput').eq(0).val();
		var comment_num = $(this).parent().parent().prev().attr('id');
		$.ajax({
			 type : "post",
			 url : "${pageContext.request.contextPath}/teacher/commentReply.do",
			 data:"notice_num="+notice_num+"&class_name="+class_name+"&comment_num="+comment_num+"&replyInput="+replyInput,  
			 success : function(data){
			 	   	$.ajax({
			 	   		type : "post",
			 	   		url : "${pageContext.request.contextPath}/teacher/noticeDetailAjax.do",
			 	   		data : "class_name="+class_name+"&notice_num="+notice_num,
			 	   		success: function(data){
			 	   				$('#list1body').html(data);
			 	   		}
			 	   	});
			 },
			 error: function(error){
			 alert("에러야!");
			 }
			 }); 
		
	});
	
	$(document).on('click','.replyReply',function(){
		
		if($(this).text()=='댓글'&&count==0){
			$(this).parent().parent().after("<div class='row noticeView_Comments_2 noticeContent commcomm'><div class='col-sm-3'>ㄴ <input type='text' class='replyInput' style=width:500px;><a class='replyReplyAdd'><i class='fa fa-plus-square'></i>등록</a></div></div>");
			$(this).html('<i class="fa fa-share"></i>취소');
			count=1;
		}else if($(this).text()=='취소'){
			$('.commcomm').remove();
			/* $(this).parent().parent().next().remove(); */
			$(this).html('<i class="fa fa-reply"></i>댓글');
			count = 0;
		}else if($(this).text()=='댓글'&&count==1){
			$('.commcomm').prev().children().eq(2).children().eq(0).html('<i class="fa fa-reply"></i>댓글');
			$('.commcomm').remove();
			$(this).parent().parent().after("<div class='row noticeView_Comments_2 noticeContent commcomm'><div class='col-sm-3'>ㄴ <input type='text' class='replyInput' maxlength='40' required style=width:500px;><a class='replyAdd'><i class='fa fa-plus-square'></i>등록</a></div></div>");
			$(this).html('<i class="fa fa-share"></i>취소');
			count=1;
		}
		});
	
	$(document).on('click','.replyReplyAdd',function(){
		var replyInput = $(this).siblings('.replyInput').eq(0).val();
		var comment_num = $(this).parent().parent().prev().attr('id');
		console.log(replyInput);
		console.log(comment_num);
		$.ajax({
			 type : "post",
			 url : "commentReply.do",
			 data:"notice_num="+notice_num+"&class_name="+class_name+"&comment_num="+comment_num+"&replyInput="+replyInput,  
			 success : function(data){
			 	   	$.ajax({
			 	   		type : "post",
			 	   		url : "noticeDetailAjax.do",
			 	   		data : "class_name="+class_name+"&notice_num="+notice_num,
			 	   		success: function(data){
			 	   				$('#list1body').html(data);
			 	   		}
			 	   	});
			 },
			 error: function(error){
			  alert("에러야!"); 
			 }
			 });
					});

	
	$('#replyAddBtn').click(function(){
		var textarea = $('#replyArea').val();
		if(textarea == "" || textarea == null){
			swal("댓글을 입력하지 않았습니다", "글을 입력 후 다시 등록버튼을 누르세요", "error");
		}else{
		$.ajax({
			 type : "post",
			 url : "commentInsert.do",
			 data:"notice_num="+notice_num+"&class_name="+class_name+"&textarea="+textarea,  
			 success : function(data){
			 	   	$.ajax({
			 	   		type : "post",
			 	   		url : "noticeDetailAjax.do",
			 	   		data : "class_name="+class_name+"&notice_num="+notice_num,
			 	   		success: function(data){
			 	   				$('#list1body').html(data);
			 	   				$('#replyArea').val("");
			 	   		}
			 	   	});
			 },
			 error: function(error){
			  alert("에러야!"); 
			 }
			 });
		}
		
	});
	
	
	$(document).on('click','.update',function(){
		var value = $(this).parent().prev().text();
		console.log(value);
		var comment_n = $(this).children().attr('id');
		if($(this).text()=='수정'){
			$(this).parent().prev().html("<input type='text' style=width:400px; value='"+value+"'>&nbsp;&nbsp;&nbsp;<a class='updateReply' id='"+comment_n+"'><i class='fa fa-pencil'></i>수정 </a>");
			$(this).html("<a class='updateCancel'><i class='fa fa-share'></i>취소");	
		}else{
			$(this).parent().prev().html("");
			$(this).parent().prev().append(value);
			$(this).html("<a class='update'><i class='fa fa-pencil'></i>수정</a>");
		}	
	});
	
	$(document).on('click','.updateCancel',function(){
		$.ajax({
 	   		type : "post",
 	   		url : "noticeDetailAjax.do",
 	   		data : "class_name="+class_name+"&notice_num="+notice_num,
 	   		success: function(data){
 	   				$('#list1body').html(data);
 	   		}
 	   	});
					});
	
	$(document).on('click','.updateReply',function(){
		var comment_num = $(this).attr('id');
		var comment_content = $(this).prev().val();
		$.ajax({
 	   		type : "post",
 	   		url : "noticeReplyUpdate.do",
 	   		data : "comment_num="+comment_num+"&comment_content="+comment_content,
 	   		success: function(data){
	 	   		$.ajax({
		 	   		type : "post",
		 	   		url : "noticeDetailAjax.do",
		 	   		data : "class_name="+class_name+"&notice_num="+notice_num,
		 	   		success: function(data){
		 	   				$('#list1body').html(data);
		 	   		}
		 	   	});
 	   		}
 	   	});
					});
	
	$(document).on('click','.delete',function(){
		var comment_num = $(this).children().attr('id');
		
		$.ajax({
 	   		type : "post",
 	   		url : "commentReplyDelete.do",
 	   		data : "comment_num="+comment_num,
 	   		success: function(data){
	 	   		$.ajax({
		 	   		type : "post",
		 	   		url : "noticeDetailAjax.do",
		 	   		data : "class_name="+class_name+"&notice_num="+notice_num,
		 	   		success: function(data){
		 	   				$('#list1body').html(data);
		 	   		}
		 	   	});
 	   		}
 	   	});
					});
	
	
	$(document).on('click','#updateNotice',function(){
		location.href="noticeUpdate.do?notice_num="+notice_num+"&class_name="+class_name;
	});
	
	$('#deleteNotice').click(function(){
		location.href="noticeDelete.do?notice_num="+notice_num+"&class_name="+class_name;
		
	});
	
	
	
});
</script>
