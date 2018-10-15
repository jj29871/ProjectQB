
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/css/adminMessage.css"
	rel="stylesheet">
<!-- 쪽지보기 모달창 -->
<div class="modal fade" id="MessageModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">쪽지 확인</h4>
			</div>
			<div class="modal-body">
				<!-- /col-lg-12 -->
				<div id="messageform">
					<div class="mail-sender">
						<div class="row">
							<div class="col-md-8">
								<img src="img/ui-zac.jpg" alt=""> <strong>Zac Doe</strong>
								<span>[zac@youremail.com]</span> to <strong>me</strong>
							</div>

							<div class="col-md-4">
								<p class="date">10:15AM 02 FEB 2014</p>
							</div>
						</div>
					</div>
					<div class="view-mail">
						<p>As he bent his head in his most courtly manner, there was a
							secrecy in his smiling face, and he conveyed an air of mystery to
							those words, which struck the eyes and ears of his nephew
							forcibly. At the same time, the thin straight lines of the
							setting of the eyes, and the thin straight lips, and the markings
							in the nose, curved with a sarcasm that looked handsomely
							diabolic.</p>
						<p>"Yes," repeated the Marquis. "A Doctor with a daughter.
							Yes. So commences the new philosophy! You are fatigued. Good
							night!"</p>
						<p>It would have been of as much avail to interrogate any
							stone face outside the chateau as to interrogate that face of
							his. The nephew looked at him, in vain, in passing on to the
							door.</p>
						<p>"Good night!" said the uncle. "I look to the pleasure of
							seeing you again in the morning. Good repose! Light Monsieur my
							nephew to his chamber there!--And burn Monsieur my nephew in his
							bed, if you will," he added to himself, before he rang his little
							bell again, and summoned his valet to his own bedroom.</p>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<div class="form-group">
					<div class="col-lg-offset-2 col-lg-10">
						<button class="btn btn-large btn-primary" id="messageBtn">답장하기</button>
						<button class="btn btn-theme04" type="button" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>

		</div>
	</div>
</div><!-- 쪽지보기 모달창 끝 -->

<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="col-lg-12 mt">
			<div class="row content-panel">
					<div class="panel-heading">
						<ul class="nav nav-tabs nav-justified">
							<li class="active"><a data-toggle="tab" href="#overview">받은
								쪽지</a></li>
							<li><a data-toggle="tab" href="#sendMessagetab"
								class="contact-map">보낸 쪽지</a></li>
							<li><a data-toggle="tab" href="#contact">새 쪽지</a></li>

						</ul>
					</div><!-- /panel-heading -->
					
					<div class="panel-body">
							<div class="tab-content">
							<!-- 받은 쪽지함 -->
								<div id="overview" class="tab-pane active">
									<section>
										<div class="col-sm-12">
											<div class="panel-body minimal" id="messageTable">
												<div class="table-inbox-wrap ">
													<div class="accordion" id="accordion2">
														<div class="accordion-group">
															<table class="table table-inbox table-hover" id="example">
																<thead>
																	<tr>
																		<th>선택</th>
																		<th>Position</th>
																		<th>Office</th>
																		<th>Age</th>
																		<th>Start date</th>
																		<th>Salary</th>
																	</tr>
																</thead>
																<tbody>
																	<tr class="unread">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="inbox-small-cells"><i
																			class="fa fa-star"></i></td>
																		<td class="view-message "><a
																			href="mail_view.html">Google Inc.</a></td>
																		<td class="view-message "><a id="updatebtn"
																			data-toggle="modal" data-target="#MessageModal">Your
																				new account is ready.</a></td>
																		<td class="view-message  inbox-small-cells"><i
																			class="fa fa-paperclip"></i></td>
																		<td class="view-message  text-right">08:10 AM</td>
																	</tr>
																	<tr class="unread">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="inbox-small-cells"><i
																			class="fa fa-star"></i></td>
																		<td class="view-message dont-show"><a
																			href="mail_view.html">Mark Thompson</a></td>
																		<td class="view-message"><a id="updatebtn"
																			data-toggle="modal" data-target="#MessageModal">Last
																				project updates</a></td>
																		<td class="view-message inbox-small-cells"></td>
																		<td class="view-message text-right">March 15</td>
																	</tr>
																	<tr class="unread">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="inbox-small-cells"><i
																			class="fa fa-star"></i></td>
																		<td class="view-message dont-show"><a
																			href="mail_view.html">Wonder Corp.</a></td>
																		<td class="view-message"><a id="updatebtn"
																			data-toggle="modal" data-target="#MessageModal">Thanks
																				for your registration</a></td>
																		<td class="view-message inbox-small-cells"></td>
																		<td class="view-message text-right">March 15</td>
																	</tr>
																	<tr class="">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="inbox-small-cells"><i
																			class="fa fa-star"></i></td>
																		<td class="view-message dont-show"><a
																			href="mail_view.html">Facebook</a></td>
																		<td class="view-message"><a id="updatebtn"
																			data-toggle="modal" data-target="#MessageModal">New
																				Friendship Request</a></td>
																		<td class="view-message inbox-small-cells"></td>
																		<td class="view-message text-right">March 13</td>
																	</tr>
																	<tr class="">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="inbox-small-cells"><i
																			class="fa fa-star inbox-started"></i></td>
																		<td class="view-message dont-show"><a
																			id="updatebtn" data-toggle="modal"
																			data-target="#MessageModal">Mark Webber</a></td>
																		<td class="view-message"><a
																			class="accordion-toggle" data-toggle="collapse"
																			data-parent="#accordion2"
																			href="adminMessage.jsp#collapseOne">The server is
																				down</a></td>
																		<td class="view-message inbox-small-cells"></td>
																		<td class="view-message text-right">March 09</td>
																	</tr>
																	<tr class="">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="inbox-small-cells"><i
																			class="fa fa-star inbox-started"></i></td>
																		<td class="view-message dont-show"><a
																			class="accordion-toggle" data-toggle="collapse"
																			data-parent="#accordion2"
																			href="adminMessage.jsp#collapseOne">Facebook</a></td>
																		<td class="view-message"><a id="updatebtn"
																			data-toggle="modal" data-target="#MessageModal">New
																				message from Patrick S.</a></td>
																		<td class="view-message inbox-small-cells"><i
																			class="fa fa-paperclip"></i></td>
																		<td class="view-message text-right">March 08</td>
																	</tr>
																	<tr class="">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="inbox-small-cells"><i
																			class="fa fa-star inbox-started"></i></td>
																		<td class="view-message dont-show">Paypal inc.</td>
																		<td class="view-message" id="updatebtn"
																			data-toggle="modal" data-target="#MessageModal">New
																			payment received</td>
																		<td class="view-message inbox-small-cells"><i
																			class="fa fa-paperclip"></i></td>
																		<td class="view-message text-right">March 04</td>
																	</tr>
																	<tr class="">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="inbox-small-cells"><i
																			class="fa fa-star"></i></td>
																		<td class="view-message dont-show">Andrea</td>
																		<td class="view-message view-message" id="updatebtn"
																			data-toggle="modal" data-target="#MessageModal">Weekend
																			plans</td>
																		<td class="view-message inbox-small-cells"></td>
																		<td class="view-message text-right">March 04</td>
																	</tr>
																	<tr class="">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="inbox-small-cells"><i
																			class="fa fa-star"></i></td>
																		<td class="view-message dont-show">David Green</td>
																		<td class="view-message view-message" id="updatebtn"
																			data-toggle="modal" data-target="#MessageModal">Soccer
																			tickets</td>
																		<td class="view-message inbox-small-cells"></td>
																		<td class="view-message text-right">February 22</td>
																	</tr>
																	<tr class="">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="inbox-small-cells"><i
																			class="fa fa-star"></i></td>
																		<td class="view-message dont-show">Evelyn</td>
																		<td class="view-message view-message" id="updatebtn"
																			data-toggle="modal" data-target="#MessageModal">Surprise
																			party</td>
																		<td class="view-message inbox-small-cells"></td>
																		<td class="view-message text-right">February 19</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>


											</div>
										</div>

									</section>

								</div>
								
								<!-- 보낸 쪽지 탭- -->
								<div id="sendMessagetab" class="tab-pane">
									<section>
										<div class="col-sm-12">
											<div class="panel-body minimal" id="messageTable">
												<div class="table-inbox-wrap ">
													<div class="accordion" id="accordion2">
														<div class="accordion-group">
															<table class="table table-inbox table-hover" id="example2">
																<thead>
																	<tr>
																		<th>선택</th>
																		<th>Position</th>
																		<th>Office</th>
																		<th>Age</th>
																		<th>Start date</th>
																		<th>Salary</th>
																	</tr>
																</thead>
																<tbody>
																	<tr class="unread">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="inbox-small-cells"><i
																			class="fa fa-star"></i></td>
																		<td class="view-message "><a
																			href="mail_view.html">Google Inc.</a></td>
																		<td class="view-message "><a id="updatebtn"
																			data-toggle="modal" data-target="#MessageModal">Your
																				new account is ready.</a></td>
																		<td class="view-message  inbox-small-cells"><i
																			class="fa fa-paperclip"></i></td>
																		<td class="view-message  text-right">08:10 AM</td>
																	</tr>
																	<tr class="unread">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="inbox-small-cells"><i
																			class="fa fa-star"></i></td>
																		<td class="view-message dont-show"><a
																			href="mail_view.html">Mark Thompson</a></td>
																		<td class="view-message"><a id="updatebtn"
																			data-toggle="modal" data-target="#MessageModal">Last
																				project updates</a></td>
																		<td class="view-message inbox-small-cells"></td>
																		<td class="view-message text-right">March 15</td>
																	</tr>
																	<tr class="unread">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="inbox-small-cells"><i
																			class="fa fa-star"></i></td>
																		<td class="view-message dont-show"><a
																			href="mail_view.html">Wonder Corp.</a></td>
																		<td class="view-message"><a id="updatebtn"
																			data-toggle="modal" data-target="#MessageModal">Thanks
																				for your registration</a></td>
																		<td class="view-message inbox-small-cells"></td>
																		<td class="view-message text-right">March 15</td>
																	</tr>
																	<tr class="">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="inbox-small-cells"><i
																			class="fa fa-star"></i></td>
																		<td class="view-message dont-show"><a
																			href="mail_view.html">Facebook</a></td>
																		<td class="view-message"><a id="updatebtn"
																			data-toggle="modal" data-target="#MessageModal">New
																				Friendship Request</a></td>
																		<td class="view-message inbox-small-cells"></td>
																		<td class="view-message text-right">March 13</td>
																	</tr>
																	<tr class="">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="inbox-small-cells"><i
																			class="fa fa-star inbox-started"></i></td>
																		<td class="view-message dont-show"><a
																			id="updatebtn" data-toggle="modal"
																			data-target="#MessageModal">Mark Webber</a></td>
																		<td class="view-message"><a
																			class="accordion-toggle" data-toggle="collapse"
																			data-parent="#accordion2"
																			href="adminMessage.jsp#collapseOne">The server is
																				down</a></td>
																		<td class="view-message inbox-small-cells"></td>
																		<td class="view-message text-right">March 09</td>
																	</tr>
																	<tr class="">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="inbox-small-cells"><i
																			class="fa fa-star inbox-started"></i></td>
																		<td class="view-message dont-show"><a
																			class="accordion-toggle" data-toggle="collapse"
																			data-parent="#accordion2"
																			href="adminMessage.jsp#collapseOne">Facebook</a></td>
																		<td class="view-message"><a id="updatebtn"
																			data-toggle="modal" data-target="#MessageModal">New
																				message from Patrick S.</a></td>
																		<td class="view-message inbox-small-cells"><i
																			class="fa fa-paperclip"></i></td>
																		<td class="view-message text-right">March 08</td>
																	</tr>
																	<tr class="">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="inbox-small-cells"><i
																			class="fa fa-star inbox-started"></i></td>
																		<td class="view-message dont-show">Paypal inc.</td>
																		<td class="view-message" id="updatebtn"
																			data-toggle="modal" data-target="#MessageModal">New
																			payment received</td>
																		<td class="view-message inbox-small-cells"><i
																			class="fa fa-paperclip"></i></td>
																		<td class="view-message text-right">March 04</td>
																	</tr>
																	<tr class="">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="inbox-small-cells"><i
																			class="fa fa-star"></i></td>
																		<td class="view-message dont-show">Andrea</td>
																		<td class="view-message view-message" id="updatebtn"
																			data-toggle="modal" data-target="#MessageModal">Weekend
																			plans</td>
																		<td class="view-message inbox-small-cells"></td>
																		<td class="view-message text-right">March 04</td>
																	</tr>
																	<tr class="">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="inbox-small-cells"><i
																			class="fa fa-star"></i></td>
																		<td class="view-message dont-show">David Green</td>
																		<td class="view-message view-message" id="updatebtn"
																			data-toggle="modal" data-target="#MessageModal">Soccer
																			tickets</td>
																		<td class="view-message inbox-small-cells"></td>
																		<td class="view-message text-right">February 22</td>
																	</tr>
																	<tr class="">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="inbox-small-cells"><i
																			class="fa fa-star"></i></td>
																		<td class="view-message dont-show">Evelyn</td>
																		<td class="view-message view-message" id="updatebtn"
																			data-toggle="modal" data-target="#MessageModal">Surprise
																			party</td>
																		<td class="view-message inbox-small-cells"></td>
																		<td class="view-message text-right">February 19</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
										</div>
									</section>
								</div>
								<!-- /tab-pane -->
								<div id="contact" class="tab-pane examstudent">
									<div class="row">
										<div class="row mt">
											<div id="updateExam" class="tab-pane">
												<div class="row">
													<div class="col-md-12">
														<div class="col-md-2">
															<section class="panel">
																<div class="panel-body grey-panel">
																	<div>
																		<label class="btn btn-compose"> <i
																			class="fa fa-pencil"></i>전체선택 <input type="checkbox"
																			class="checkbox form-control" id="agree" name="agree" />
																		</label>
																	</div>
																	<ul class="nav nav-pills nav-stacked mail-nav">
																		<li id="messageSelect"><div>
																				<img
																					src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
																					class="img-circle" width="25"> 김현이<input
																					type="checkbox" class="checkbox form-control"
																					id="agree" name="agree" />
																			</div></li>
																		<li id="messageSelect"><div>
																				<img
																					src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
																					class="img-circle" width="25"> 서정원<input
																					type="checkbox" class="checkbox form-control"
																					id="agree" name="agree" />
																			</div></li>
																		<li id="messageSelect"><div>
																				<img
																					src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
																					class="img-circle" width="25"> 유영준<input
																					type="checkbox" class="checkbox form-control"
																					id="agree" name="agree" />
																			</div></li>
																		<li id="messageSelect"><div>
																				<img
																					src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
																					class="img-circle" width="25"> 방민지<input
																					type="checkbox" class="checkbox form-control"
																					id="agree" name="agree" />
																			</div></li>
																		<li id="messageSelect"><div>
																				<img
																					src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
																					class="img-circle" width="25"> 성태용<input
																					type="checkbox" class="checkbox form-control"
																					id="agree" name="agree" />
																			</div></li>
																		<li id="messageSelect"><div>
																				<img
																					src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
																					class="img-circle" width="25"> 조재훈<input
																					type="checkbox" class="checkbox form-control"
																					id="agree" name="agree" />
																			</div></li>
																		<li id="messageSelect"><div>
																				<img
																					src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
																					class="img-circle" width="25"> 양회준<input
																					type="checkbox" class="checkbox form-control"
																					id="agree" name="agree" />
																			</div></li>
																		<li id="messageSelect"><div>
																				<img
																					src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
																					class="img-circle" width="25"> 우한결<input
																					type="checkbox" class="checkbox form-control"
																					id="agree" name="agree" />
																			</div></li>
																	</ul>
																</div>
															</section>

														</div>
														<div class="col-md-8">

															<form class="contact-form php-mail-form" role="form"
																action="contactform/contactform.php" method="POST">



																<div class="form-group">
																	<textarea class="form-control" name="message"
																		id="contact-message" placeholder="Your Message"
																		rows="5" data-rule="required"
																		data-msg="Please write something for us"></textarea>
																	
																</div>


																<div class="sent-message">Your message has been
																	sent. Thank you!</div>



																<button type="submit" class="btn btn-large btn-primary">전송</button>
																<button class="btn btn-theme04" type="button">취소</button>


															</form>
														</div>


													</div>
												</div>
											</div>
											<!-- /row -->
										</div>

										<!-- /tab-content -->
									</div>
									<!-- /panel-body -->
								</div>

							</div>
							<!-- /tab-content -->
						</div>
						<!-- /panel-body -->
					
			</div><!-- row content-panel -->
		</div><!-- col-lg-12 mt -->
	</section><!-- wrapper site-min-height -->
</section><!-- main-content -->