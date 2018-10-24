﻿<%-- 
	@JSP:questionManagement.jsp
	@DATE:2018-10-12
	@Author:양회준
	@Desc:새로운 문제 만들기 및 수정(스토리보드 34 of 41)
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- 2018.10.10 정원 내 문제함 UI 추가 -->
<link
	href="${pageContext.request.contextPath}/css/questionManagement.css"
	rel="stylesheet">

<!-- 문제 수정 모달창 시작 -->	
		<div class="modal fade" id="singleUpdateModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true"
					data-modal-id="${question.question_num}">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">문제 수정</h4>
								<!-- modal-header 끝 -->
							</div>
							<div class="modal-body"><h4>정말 수정하시겠습니까?</h4><br>
							<h5>문제 제출자 또는 다른 사용자가 해당 문제를 사용하여 <br>
							 시험지 생성 또는 시험지 임시저장 했을 경우 <br>
							 그 문제는 삭제/수정이 불가능합니다.<br><br>
							 
							 "확인"버튼을 누르시면 문제 수정 페이지로 이동합니다.
							 </h5>
							</div>
							<div class="modal-footer">
								<div class="form-group">
									<div class="col-lg-offset-2 col-lg-10">
									
										<button id="singleUpdateConfirmBtn" name="updatebtn" class="btn btn-theme" 
										value="" data-dismiss="modal" aria-label="Close">
										확인</button>
										<button class="btn btn-theme04" type="button" data-dismiss="modal">
										취소</button>
										
									</div>
								</div>
							</div>
							<!-- modal-content 끝 -->
						</div>
						<!-- modal-dialog 끝 -->
					</div>
				</div>
<!-- 문제 수정 모달창 끝 -->	

<!-- 문제 삭제 모달창 시작 -->	
		<div class="modal fade" id="singleDeleteModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true"
					data-modal-id="${question.question_num}">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">문제 삭제</h4>
								<!-- modal-header 끝 -->
							</div>
							<div class="modal-body"><h4>정말 삭제하시겠습니까?</h4><br>
							<h5>문제 제출자 또는 다른 사용자가 해당 문제를 사용하여 <br>
							 시험지 생성 또는 시험지 임시저장 했을 경우 <br>
							 그 문제는 삭제/수정이 불가능합니다.
							 </h5>
							</div>
							<div class="modal-footer">
								<div class="form-group">
									<div class="col-lg-offset-2 col-lg-10">
									
										<button id="singleDeleteConfirmBtn" name="deletebtn" class="btn btn-theme" 
										value="" data-dismiss="modal" aria-label="Close">
										확인</button>
										<button class="btn btn-theme04" type="button" data-dismiss="modal">
										취소</button>
										
									</div>
								</div>
							</div>
							<!-- modal-content 끝 -->
						</div>
						<!-- modal-dialog 끝 -->
					</div>
				</div>
<!-- 문제 삭제 모달창 끝 -->	



<!-- 2018.10.10 재훈 새 문제 만들기 UI 추가 -->
<!-- 2018.10.12 회준 새 문제 만들기 UI 추가 -->

<!--main content start-->
<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="col-lg-12 mt">
			<div class="row content-panel">
				<div class="panel-heading">
					<ul class="nav nav-tabs nav-justified">
						<li class="active"><a data-toggle="tab" href="#overview">내
								문제함</a></li>
						<li><a data-toggle="tab" href="#newQuestion"
							class="contact-map">새 문제 만들기</a></li>
					</ul>
				</div>

				<!-- /panel-heading -->
				<div class="panel-body">
					<div class="tab-content">
						<div id="overview" class="tab-pane active">
							<div class="row">
								<div class="col-lg-12">

									<h3 id="h3id">내가 만든 문제
										<input type="text" name="member_id" id="member_id"
										value="${memberDto.member_id}" style="display: none">
										<input type="text" name="question_num" id="question_num"
										value="" style="display: none">
									</h3>
									
									<hr>

									<select id="question_lg_category" class="form-control-static myQuestionSelectCategory"
										name="lg_category_name">
										<option value="" selected disabled>대분류 선택</option>
										<c:forEach items="${lgCatList}" var="lgCatList">
											<option value="${lgCatList.lg_category_code}">${lgCatList.lg_category_name}</option>
										</c:forEach>
									</select> 
									
									<select id="question_md_category" class="form-control-static myQuestionSelectCategory"
										name="md_category_name">
										<option value="">중분류 선택</option>
									</select> 
									
									<select id="question_sm_category" class="form-control-static myQuestionSelectCategory"
										name="sm_category_name">
										<option value="">소분류 선택</option>
									</select> 
									
									<select class="form-control-static myQuestionSelectCategory" name="level_code" id="level_type">
										<option value="">난이도</option>
										<c:forEach items="${quesLevelList}" var="quesLevelList">
											<option value="${quesLevelList.level_code}">${quesLevelList.level_name}</option>
										</c:forEach>
									</select> 
									
									<select class="form-control-static myQuestionSelectCategory" 
									id="questiontype" name="questionType">
										<option value="">문제타입</option>
										<option value="">전체</option>
										<option value="객관식">객관식</option>
										<option value="단답형">단답형</option>
									</select> 
									
									<input type="button" id="viewAll"
										class="btn btn-theme myQuestionSelectBtn pull-right"
										value="전체조회"> 
										<input type="button"
										class="btn btn-theme myQuestionSelectBtn pull-right"
										id="questionsearch"
										value="검색"> 
										<input type="text"
										class="form-control myQuestionTextField pull-right"
										id="keyword" placeholder="키워드를 입력하세요.">

								</div>
								<!-- /detailed -->
							</div>
							<hr>

							<div class="row content-panel" id="myQuestionPanel">
								<form action="" method="post" id="pickQuestionForm" onsubmit="return false;">
					                           
					                           <!-- 문제 하나의 div 시작 -->
					                           <div id="myQuestions"> 
													
					                           </div>
					                           <!-- 문제 하나의 div 끝 -->
					            </form>
							</div>
							
						 <p> 페이징 처리 들어갈 자리 </p>
						</div>
						
						<!-- /OVERVIEW -->
						<!-- 정원 추가 끝 -->


<!--#####################      새로운 문제 만들기 탭 시작               ##################### -->
<!--%%%%%%%%%%%%%%%%%%%%%      재훈 18.10.10 추가 시작             %%%%%%%%%%%%%%%%%%%%%%-->
<!--%%%%%%%%%%%%%%%%%%%%%      회준 18.10.12 수정 시작             %%%%%%%%%%%%%%%%%%%%%%-->
						<div id="newQuestion" class="tab-pane">
							<div class="row">
								<div class="col-lg-12">
									<form class="formNewQuestion" action="insertQuestion.do"
										method="post" onsubmit="return check()">
										
										<input type="text" name="member_id"
										value="${memberDto.member_id}" style="display: none">
										
										<h3 id="h3id">새로운 문제 만들기</h3>
										<hr>
										<h4>
											<i class="fa fa-angle-right"></i> 출제자: ${memberDto.member_name} ( ${memberDto.member_id} )
										</h4>
										<hr>
										<div>
											<h4 class="mb quesCategory">
												<i class="fa fa-angle-right"></i> 문제 분류
											</h4>
											<select id="question_lg_category2"
												class="form-control-static" name="lg_category_name">
												<option value="" selected disabled>대분류 선택</option>
												<c:forEach items="${lgCatList}" var="lgCatList">
													<option value="${lgCatList.lg_category_code}">${lgCatList.lg_category_name}</option>
												</c:forEach>
											</select> <select id="question_md_category2"
												class="form-control-static" name="md_category_name">
												<option value="">중분류 선택</option>
											</select> <select id="question_sm_category2"
												class="form-control-static" name="sm_category_code">
												<option value="">소분류 선택</option>
											</select> <select id="level_type2" class="form-control-static"
												name="level_code">
												<option value="">난이도</option>
												<c:forEach items="${quesLevelList}" var="quesLevelList">
													<option value="${quesLevelList.level_code}">${quesLevelList.level_name}</option>
												</c:forEach>
											</select>
										</div>
										<h4 class="quesCategory">
											<i class="fa fa-angle-right"></i> 문제 유형
										</h4>
										<span class="radio quesCategorybig"> 
											<label class="questionChoiceRadioButton"> 
												<input type="radio" name="question_type" id="question_type_1"
												value="객관식" checked onclick="questionType('questionChoice');" checked>객관식
											</label> &nbsp;&nbsp; 
											<label class="questionChoiceRadioButton">
												<input type="radio" name="question_type" id="question_type_2"
												value="단답형" onclick="questionType('questionShortAnswer');">단답형
										</label>
										</span>
										<hr>
										<div class="form-group" id="questionMoonje">
											<div class="row">
												<div class="col-lg-6 ">
													<h4>
														<i class="fa fa-angle-right"></i> 문제 내용 입력
													</h4>
													<textarea name="question_name" class="form-control"
														placeholder="문제 내용을 입력해주세요." rows="3" required></textarea>
													<div class="fileupload fileupload-new" data-provides="fileupload">
														<div class="fileupload-preview fileupload-exists thumbnail"
															style="max-width: 400px; max-height: 250px; line-height: 20px;">
														</div>
														<span>
															<span class="btn btn-theme02 btn-file">
																<span class="fileupload-new">
																	<i class="fa fa-paperclip"></i>image
																</span> 
																<span class="fileupload-exists">
																	<i class="fa fa-undo"></i>Change
																</span> 
																<input type="file" name="question_img" class="default"/>
															</span>
															<a href="" class="btn btn-theme04 fileupload-exists" data-dismiss="fileupload">
															<i class="fa fa-trash-o"></i>Remove</a>
														</span>
													</div>
												</div>
												<!--문제 종료-->

												<!--객관식 보기 시작-->
												<div id="questionChoice" style="display: '';" class="col-lg-6">
													<h4>
														<i class="fa fa-angle-right"></i> 객관식 정답 입력
													</h4>
													<div class="radio" id="answerChoiceText">
														
														<label class="questionChoiceRadioButton"> 
															<input type="radio" name="question_answer" value="1" id="questionAnswerRadio1">
															1번
														</label>&nbsp;&nbsp; 
														
														<label class="questionChoiceRadioButton">
															<input type="radio" name="question_answer" value="2" id="questionAnswerRadio2">
															2번
														</label>&nbsp;&nbsp;
														
														<label class="questionChoiceRadioButton">
															<input type="radio" name="question_answer" value="3" id="questionAnswerRadio3">
															3번
														</label>&nbsp;&nbsp;
														 
														<label class="questionChoiceRadioButton">
															<input type="radio" name="question_answer" value="4" id="questionAnswerRadio4">
															4번
														</label>&nbsp;&nbsp; 
														
														<label class="questionChoiceRadioButton">
															<input type="radio" name="question_answer" value="5" id="questionAnswerRadio5">
															5번
														</label>&nbsp;&nbsp;
														
													</div>
													<br>
													
													<hr>
													
													
													<h4>

														<i class="fa fa-angle-right"></i>객관식 보기 입력

													</h4>
													<select id="howManyChoices" class="form-control-static" name="howManyChoices">
													
														
														<option value="2">보기 개수: 2개</option>
														<option value="3">보기 개수: 3개</option>
														<option value="4">보기 개수: 4개</option>
														<option value="5" selected>보기 개수: 5개</option>
													</select> <br> <br>
													
													
													<!-- 1번 보기 -->
													<div id="choiceInput">
													<b><input type="text" name="question_choice_num"
														value="1" style="display: none">1.</b>
													   <input type="text" name="question_choice_content" id="question_choice_content1"
														class="form-control-inline" placeholder="1번 보기 내용을 입력해주세요.">
														
													  <span class="fileupload fileupload-new" data-provides="fileupload">
														<div class="fileupload-preview fileupload-exists thumbnail"
															style="max-width: 300px; max-height: 180px; line-height: 20px;">
															<input type="file" name="files[0]" class="default"/>
														</div>
														<span>
															<span class="btn btn-theme02 btn-file">
																<span class="fileupload-new">
																	<i class="fa fa-paperclip"></i>image
																</span> 
																<span class="fileupload-exists">
																	<i class="fa fa-undo"></i>Change
																</span> 
																<input type="file" name="files[0]" class="default"/>
															</span>
															<a href="" class="btn btn-theme04 fileupload-exists" data-dismiss="fileupload">
															<i class="fa fa-trash-o"></i>Remove</a>
														</span>
													</span><br>
													<!-- 2번 보기 -->
													<b><input type="text" name="question_choice_num"
														value="2" style="display: none">2.</b>
													   <input type="text" name="question_choice_content" id="question_choice_content2"
														class="form-control-inline" placeholder="2번 보기 내용을 입력해주세요.">
													   <span class="fileupload fileupload-new" data-provides="fileupload">
														<div class="fileupload-preview fileupload-exists thumbnail"
															style="max-width: 300px; max-height: 180px; line-height: 20px;">
														</div>
														<span>
															<span class="btn btn-theme02 btn-file">
																<span class="fileupload-new">
																	<i class="fa fa-paperclip"></i>image
																</span> 
																<span class="fileupload-exists">
																	<i class="fa fa-undo"></i>Change
																</span> 
																<input type="file" name="files[1]" class="default"/>
															</span>
															<a href="" class="btn btn-theme04 fileupload-exists" data-dismiss="fileupload">
															<i class="fa fa-trash-o"></i>Remove</a>
														</span>
													</span><br>
													<!-- 3번 보기 -->
													<b><input type="text" name="question_choice_num"
														value="3" style="display: none">3.</b>
													   <input type="text" name="question_choice_content" id="question_choice_content3"
														class="form-control-inline" placeholder="3번 보기 내용을 입력해주세요.">
													   <span class="fileupload fileupload-new" data-provides="fileupload">
														<div class="fileupload-preview fileupload-exists thumbnail"
															style="max-width: 300px; max-height: 180px; line-height: 20px;">
														</div>
														<span>
															<span class="btn btn-theme02 btn-file">
																<span class="fileupload-new">
																	<i class="fa fa-paperclip"></i>image
																</span> 
																<span class="fileupload-exists">
																	<i class="fa fa-undo"></i>Change
																</span> 
																<input type="file" name="files[2]" class="default"/>
															</span>
															<a href="" class="btn btn-theme04 fileupload-exists" data-dismiss="fileupload">
															<i class="fa fa-trash-o"></i>Remove</a>
														</span>
													</span><br>
													<!-- 4번 보기 -->
													<b><input type="text" name="question_choice_num"
														value="4" style="display: none">4.</b>
													   <input type="text" name="question_choice_content" id="question_choice_content4"
														class="form-control-inline" placeholder="4번 보기 내용을 입력해주세요.">
													   <span class="fileupload fileupload-new" data-provides="fileupload">
														<div class="fileupload-preview fileupload-exists thumbnail"
															style="max-width: 300px; max-height: 180px; line-height: 20px;">
														</div>
														<span>
															<span class="btn btn-theme02 btn-file">
																<span class="fileupload-new">
																	<i class="fa fa-paperclip"></i>image
																</span> 
																<span class="fileupload-exists">
																	<i class="fa fa-undo"></i>Change
																</span> 
																<input type="file" name="files[3]" class="default"/>
															</span>
															<a href="" class="btn btn-theme04 fileupload-exists" data-dismiss="fileupload">
															<i class="fa fa-trash-o"></i>Remove</a>
														</span>
													</span><br>
													<!-- 5번 보기 -->
													<b><input type="text" name="question_choice_num"
														value="5" style="display: none">5.</b>
													   <input type="text" name="question_choice_content" id="question_choice_content5"
														class="form-control-inline" placeholder="5번 보기 내용을 입력해주세요.">
													   <span class="fileupload fileupload-new" data-provides="fileupload">
															<div class="fileupload-preview fileupload-exists thumbnail"
																style="max-width: 300px; max-height: 180px; line-height: 20px;">
															</div>
														<span>
															<span class="btn btn-theme02 btn-file">
																<span class="fileupload-new">
																	<i class="fa fa-paperclip"></i>image
																</span> 
																<span class="fileupload-exists">
																	<i class="fa fa-undo"></i>Change
																</span> 
																<input type="file" name="files[4]" class="default"/>
															</span>
															<a href="" class="btn btn-theme04 fileupload-exists" data-dismiss="fileupload">
															<i class="fa fa-trash-o"></i>Remove</a>
														</span>
													</span><br>
													</div> <!-- choicesInput 끝 -->
												</div><!--객관식 보기 내용 입력 종료 -->

												<!--단답형 보기 시작-->
												<div id="questionShortAnswer" style="display:none;" class="col-lg-6">
													<h4>
														<i class="fa fa-angle-right"></i> 단답형 정답 입력
													</h4>
													<!-- 단답형 정답 입력란 -->
													<input type="text" class="form-control" name="question_answer"
														id="questionType2Answer" placeholder="정답을 입력해주세요." required disabled>
												</div>
												<!--단답형 내용 입력 종료 -->
											</div>
											<!--문제 내용, 정답, 보기 입력 grid 종료 -->
										</div>
										<!--문제 내용, 정답, 보기 입력 종료 -->
										<hr>
										<button type="reset" class="btn btn-secondary quesCategory">
										입력 취소</button>
										<button type="submit" class="btn btn-theme quesCategory pull-right" id="btnSubmit">
										문제 등록</button>
										
									</form>
								</div>
								<!-- 문제만들기 패널 종료 -->
								<!-- /form-panel -->
							</div>

							<!--%%%%%%%%%%%%%%%%%%%%%     회준 18.10.12 수정 끝         %%%%%%%%%%%%%%%%%%%%%-->
							<!--%%%%%%%%%%%%%%%%%%%%%     재훈 18.10.10 추가 끝         %%%%%%%%%%%%%%%%%%%%%-->



						</div>
						<!-- /tab-content -->
					</div>
					<!-- /panel-body -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /col-lg-12 -->
	</section>
	<!-- /wrapper -->
</section>
<!-- /MAIN CONTENT -->
<!--main content end-->

<script
	src="${pageContext.request.contextPath}/lib/onet-js/questionManagement.js"
	type="text/javascript"></script>

<!-- 문제 분류 셀렉트메뉴 선택시 하위분류 뿌려주기, 관리자-전체문제, 강사-내가 만든 문제 스크립트 시작  -->
<script>
	$(document).ready(function() {
		$('#question_lg_category')
				.change(
						function() {
							$('#question_md_category').children(
									'option:not(:first)').remove();
							<c:forEach items="${mdCatList}" var="mdlist">
							if (document.getElementById("question_lg_category").value == "${mdlist.lg_category_code}") {
								$('#question_md_category')
										.append("<option value=${mdlist.md_category_code}>${mdlist.md_category_name}</option>")
							}
							</c:forEach>
							$('#question_sm_category').children(
							'option:not(:first)').remove();
						})

		$('#question_md_category')
				.change(
						function() {
							$('#question_sm_category').children(
									'option:not(:first)').remove();
							<c:forEach items="${smCatList}" var="smlist">
							if (document.getElementById("question_md_category").value == "${smlist.md_category_code}") {
								$('#question_sm_category')
										.append("<option value=${smlist.sm_category_code}>${smlist.sm_category_name}</option>")
							}
							</c:forEach>
						})

		$('#question_lg_category2')
				.change(
						function() {
							$('#question_md_category2').children(
									'option:not(:first)').remove();
							<c:forEach items="${mdCatList}" var="mdlist">
							if (document
									.getElementById("question_lg_category2").value == "${mdlist.lg_category_code}") {
								$('#question_md_category2')
										.append("<option value=${mdlist.md_category_code}>${mdlist.md_category_name}</option>")
							}
							</c:forEach>
							$('#question_sm_category2').children(
							'option:not(:first)').remove();
						})

		$('#question_md_category2')
				.change(
						function() {
							$('#question_sm_category2').children(
									'option:not(:first)').remove();
							<c:forEach items="${smCatList}" var="smlist">
							if (document
									.getElementById("question_md_category2").value == "${smlist.md_category_code}") {
								$('#question_sm_category2')
										.append("<option value=${smlist.sm_category_code}>${smlist.sm_category_name}</option>")
							}
							</c:forEach>
						})
						
})
</script>
<!-- 문제 분류 셀렉트메뉴 선택시 하위분류 뿌려주기, 관리자-전체문제, 강사-전체문제 스크립트 끝 -->

