<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!Doctype html>
<html class="no-js"  lang="en">

	<head>
		<!-- META DATA -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<!--font-family-->
		<link href="https://fonts.googleapis.com/css?family=Rufina:400,700" rel="stylesheet" />

		<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet" />

		<!-- TITLE OF SITE -->
		
		<title>돌봐줄개냥</title>
		

		<!-- favicon img -->
		<link rel="shortcut icon" type="image/icon" href="logo/favicon.png"/>

		<!--font-awesome.min.css-->
		<link rel="stylesheet" href="css/font-awesome.min.css" />

		<!--animate.css-->
		<link rel="stylesheet" href="css/animate.css" />

		<!--hover.css-->
		<link rel="stylesheet" href="css/hover-min.css">

		<!--datepicker.css-->
		<link rel="stylesheet"  href="css/datepicker.css" >

		<!--owl.carousel.css-->
        <link rel="stylesheet" href="css/owl.carousel.min.css">
		<link rel="stylesheet" href="css/owl.theme.default.min.css"/>

		<!-- range css-->
        <link rel="stylesheet" href="css/jquery-ui.min.css" />

		<!--bootstrap.min.css-->
		<link rel="stylesheet" href="css/bootstrap.min.css" />

		<!-- bootsnav -->
		<link rel="stylesheet" href="css/bootsnav.css"/>

		<!--style.css-->
		<link rel="stylesheet" href="css/style.css" />

		<!--responsive.css-->
		<link rel="stylesheet" href="css/responsive.css" />

	
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

		<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
		
		<link
		    rel="stylesheet"
		    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
		  />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

		<script type="text/javascript">

			$(document).ready(function() {
				
				
				/* 비동기식 글 내용 보기 */
				$('.clickmnic').on("click", function() {
					let clickemail = $(this).attr("id");
					let formname = $(this).next().attr("id");
					let form_data ={email:$(this).attr("id")};
					
					console.log(clickemail);
					console.log(formname);
					
					$.ajax(
								{
									url:"AddressCheck.rc",
									type:"POST",
									dataType:"html",
									data:form_data,
									success:function(responsedata){
										let result = responsedata.trim();
										console.log(responsedata);
										
										if($('.addressinit'+formname).html()==""){
										
										  $('.addressinit'+formname).html(
													"<input form='"+formname+"' type='text' value='"+responsedata+"' readonly>"		
													);
											
										}

									},
									error:function(xhr){
										console.log(xhr.status);
									}
									}		 
							 );					 
					
				});

			});

		</script>





	</head>

	<body>
	<c:set var="usernic" value="${sessionScope.loginUser.mnic}" />


		<!--[if lte IE 9]>
		<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade
			your browser</a> to improve your experience and security.</p>
		<![endif]-->

		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		
		<!--about-us start -->
		<section id="home" class="about-us">
			<div class="container">
				<img src="images\sexyjingun\dog.jpg" style="height: 150vh;  margin: auto; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -60%);" />
				<div class="about-us-content">
					<div class="row">
						<div class="col-sm-12">
							<div class="single-about-us">
								<div class="about-us-txt" style="margin: auto; position: absolute; left: 10%; transform: translate(-30%, 100%);">									<h2>
										방문 펫시터 서비스
									</h2>
									<h2>
										돌봐줄개냥
									</h2>
								</div><!--/.about-us-txt-->
							</div><!--/.single-about-us-->
						</div><!--/.col-->

					</div><!--/.row-->
				</div><!--/.about-us-content-->
			</div><!--/.container-->

		</section><!--/.about-us-->
		<!-- 메인 페이지 대문사진 end -->


		<!-- 고양이 방문돌봄 예약메뉴 -->
			
		<section  class="travel-box">
        	<div class="container">
        		<div class="row">
        			<div class="col-md-12">
        				<div class="single-travel-boxes">
        					<div id="desc-tabs" class="desc-tabs">

								<ul class="nav nav-tabs" role="tablist">

									<li role="presentation" class="active">
									 	<a href="#tours" aria-controls="tours" role="tab" data-toggle="tab">
									 		<i class="fas fa-cat"></i>
									 		cat(sitting)
									 	</a>
									</li>

									<li role="presentation">
									 	<a href="#flights" aria-controls="flights" role="tab" data-toggle="tab">
									 		<i class="fas fa-dog"></i>
									 		Dog(sitting)
									 	</a>
									</li>
									
									<li role="presentation">
										<a href="#hotels" aria-controls="hotels" role="tab" data-toggle="tab">
											<i class="fas fa-dog"></i>
											Dog(walk)
										</a>
									</li>
								</ul>
								
								
							<!-- 고양이  panes -->
							<form id="catsitting" action="CatSittingReservation.rc" method="post"></form>
								<div class="tab-content">

									<div role="tabpanel" class="tab-pane active fade in" id="tours">
										<div class="tab-para">

											<div class="row">
												<div class="col-lg-4 col-md-4 col-sm-12">
													<div class="single-tab-select-box">
														<h2 class="servicebox" style="margin-top: -22px;"><br>주소 입력</h2>
														
								
																<c:choose>									
																	<c:when test="${loginUser.email=='admin@dogcat.com'}">
																		<button>예약 관리만 가능합니다.</button>
																	</c:when>
																	<c:when test="${!empty loginUser.mnic}">
																		<input form="catsitting" type="hidden" name="email" value="${loginUser.email}"> 
																		<button type="button" class="clickmnic" id="${loginUser.email}">주소 가져오기</button>
																		<div class="addressinitcatsitting" id="catsitting"></div>
																	</c:when>
																	<c:otherwise>
																		<button>로그인 해 주세요.</button>
																	</c:otherwise>
																</c:choose>
															
														
													</div><!--/.single-tab-select-box-->
												</div><!--/.col-->
												

												<div class="col-lg-4 col-md-4 col-sm-12">
													
												
													<div class="single-tab-select-box">
														<h2>Start Date</h2>
														<div class="travel-check-icon">
															
																<input form="catsitting" type="date" name="sdate" placeholder="06 -10 - 2021 ">
															
														</div><!-- /.travel-check-icon -->
													</div><!--/.single-tab-select-box-->
												</div><!--/.col-->

												<div class="col-lg-4 col-md-4 col-sm-12">
													<div class="single-tab-select-box">
														<h2>End Date</h2>
														<div class="travel-check-icon">
															
																<input form="catsitting" type="date" name="edate" placeholder="06 -10 - 2021 ">
															
														</div><!-- /.travel-check-icon -->
													</div><!--/.single-tab-select-box-->
												</div><!--/.col-->

												<!-- <div>
													<div class="single-tab-select-box">
														<h2>총 견적 : </h2>
														
													</div>/.single-tab-select-box
												</div>/.col
 -->
											</div><!--/.row-->

											<div class="row">
												<div class="clo-sm-7">
													<div class="about-btn travel-mrt-0 pull-right">
														<input form="catsitting" type="submit"  class="about-view travel-btn" value="예    약">
													</div><!--/.about-btn-->
												</div><!--/.col-->

											</div><!--/.row-->

										</div><!--/.tab-para-->

									</div><!--/.tabpannel-->

				
				
				
				<!-- 강아지 방문돌봄 예약메뉴 -->
									<form id="dogsitting" action="DogSittingReservation.rc" method="post"></form>
									<div role="tabpanel" class="tab-pane fade in" id="flights">
										<div class="tab-para">
											<div class="trip-circle">
												<div class="single-trip-circle">
													<!-- <input type="radio" id="radio01" name="radio" />
  													<label for="radio01">
  													<form>
  														<span class="round-boarder">
  															<span class="round-boarder1"></span>
  														</span>산책 
  													</label> -->
												</div><!--/.single-trip-circle-->
												<div class="single-trip-circle">
													<!-- <input type="radio" id="radio02" name="radio" />
  													<label for="radio02">
  														<span class="round-boarder">
  															<span class="round-boarder1"></span>
  														</span>방문돌봄
  													</label> -->
												</div><!--/.single-trip-circle-->
											</div><!--/.trip-circle-->
											<div class="row">
												<div class="col-lg-4 col-md-4 col-sm-12">
													<div class="single-tab-select-box">

														<h2>주소 입력</h2>

																<c:choose>									
																	<c:when test="${loginUser.email=='admin@dogcat.com'}">
																		<button>예약 관리만 가능합니다.</button>
																	</c:when>
																	<c:when test="${!empty loginUser.mnic}">
																	    <input form="dogsitting" type="hidden" name="email" value="${loginUser.email}">
																		<button type="button" class="clickmnic" id="${loginUser.email}">주소 가져오기</button>
																		<div class="addressinitdogsitting" id="dogsitting"></div>
																	</c:when>
																	<c:otherwise>
																		<button>로그인 해 주세요.</button>
																	</c:otherwise>
																</c:choose>
																
													</div><!--/.single-tab-select-box-->
												</div><!--/.col-->

												<div class="col-lg-4 col-md-4 col-sm-12">
													<div class="single-tab-select-box">
														<h2>Start Date</h2>
														<div class="travel-check-icon">
															
																<input form="dogsitting" type="date" name="sdate" placeholder="10 -06 - 2021 ">
															
														</div><!-- /.travel-check-icon -->
													</div><!--/.single-tab-select-box-->
												</div><!--/.col-->
												
												<div class="col-lg-4 col-md-4 col-sm-12">
													<div class="single-tab-select-box">
														<h2>End Date</h2>
														<div class="travel-check-icon">
															
																<input form="dogsitting" type="date" name="edate" placeholder="10 -06 - 2017 ">
															
														</div><!-- /.travel-check-icon -->
													</div><!--/.single-tab-select-box-->
												</div><!--/.col-->


												

											</div><!--/.row-->

											<div class="row">
												<div class="col-lg-4 col-md-4 col-sm-12">
													<div class="single-tab-select-box">

														

													</div><!--/.single-tab-select-box-->
												</div><!--/.col-->
												<div class="col-lg-3 col-md-3 col-sm-4">
													<div class="single-tab-select-box">

														
													</div><!--/.single-tab-select-box-->
												</div><!--/.col-->
												
												<div>
													
												</div><!--/.col-->
												
												<div class="clo-sm-5">
													<div class="about-btn travel-mrt-0 pull-right">
														<input form="dogsitting" type="submit"  class="about-view travel-btn" value="예    약">
													</div><!--/.about-btn-->
												</div><!--/.col-->
												
											</div><!--/.row-->

										</div>

									</div><!--/.tabpannel-->
									
				<!-- 강아지 산책 예약메뉴 -->
								<form id="dogwalking" action="DogWalkingReservation.rc" method="post"></form>	
									<div role="tabpanel" class="tab-pane fade in" id="hotels">
										<div class="tab-para">
											<div class="trip-circle">
												<div class="single-trip-circle">
													<!-- <input type="radio" id="radio01" name="radio" />
  													<label for="radio01">
  													<form>
  														<span class="round-boarder">
  															<span class="round-boarder1"></span>
  														</span>산책 
  													</label> -->
												</div><!--/.single-trip-circle-->
												<div class="single-trip-circle">
													<!-- <input type="radio" id="radio02" name="radio" />
  													<label for="radio02">
  														<span class="round-boarder">
  															<span class="round-boarder1"></span>
  														</span>방문돌봄
  													</label> -->
												</div><!--/.single-trip-circle-->
											</div><!--/.trip-circle-->
											<div class="row">
												<div class="col-lg-4 col-md-4 col-sm-12">
													<div class="single-tab-select-box">

														<h2>주소 입력</h2>

																<c:choose>									
																	<c:when test="${loginUser.email=='admin@dogcat.com'}">
																		<button>예약 관리만 가능합니다.</button>
																	</c:when>
																	<c:when test="${!empty loginUser.mnic}">
																		<input form="dogwalking" type="hidden" name="email" value="${loginUser.email}">
																		<button type="button" class="clickmnic" id="${loginUser.email}">주소 가져오기</button>
																		<div class="addressinitdogwalking" id="dogwalking"></div>
																	</c:when>
																	<c:otherwise>
																		<button>로그인 해 주세요.</button>
																	</c:otherwise>
																</c:choose>
													</div><!--/.single-tab-select-box-->
												</div><!--/.col-->

												<div class="col-lg-4 col-md-4 col-sm-12">
													<div class="single-tab-select-box">
														<h2>Reservation Date</h2>
														<div class="travel-check-icon">
															
																<input form="dogwalking" type="date" name="udate" placeholder="10 -06 - 2021 ">
															
														</div><!-- /.travel-check-icon -->
													</div><!--/.single-tab-select-box-->
												</div><!--/.col-->
												
												<div class="col-lg-4 col-md-4 col-sm-12">
													<div class="single-tab-select-box">

														<h2>원하는 타임</h2>
														<div class="travel-select-icon">
															<select form="dogwalking" name="wtcode" class="form-control ">
															
															  	<option value="301">09:00-11:00</option><!-- /.option-->
															  	<option value="302">14:00-16:00</option><!-- /.option-->
															  	<option value="303">16:00-18:00</option><!-- /.option-->
															  	<option value="304">18:00-20:00</option>
															  	<option value="305">20:00-22:00</option>

															</select><!-- /.select-->
														</div><!-- /.travel-select-icon -->
													</div><!--/.single-tab-select-box-->
												</div><!--/.col-->


												

											</div><!--/.row-->

											<div class="row">
												<div class="col-lg-4 col-md-4 col-sm-12">
													<div class="single-tab-select-box">

														

													</div><!--/.single-tab-select-box-->
												</div><!--/.col-->
												
												
												<div>
													
												</div><!--/.col-->
												
												<div class="clo-sm-5">
													<div class="about-btn travel-mrt-0 pull-right">
														<input form="dogwalking" type="submit"  class="about-view travel-btn" value="예    약">
													</div><!--/.about-btn-->
												</div><!--/.col-->
												
											</div><!--/.row-->

										</div>

									</div><!--/.tabpannel-->
									
									
									

								</div><!--/.tab content-->
							</div><!--/.desc-tabs-->
        				</div><!--/.single-travel-box-->
        			</div><!--/.col-->
        		</div><!--/.row-->
        	</div><!--/.container-->
 	</section><!--/.travel-box-->
 	
 	
 	
        <!-- 돌봐줄개냥이 제공하는 서비스 설명 -->
	<section id="service" class="service">
		<div class="container">

			<div class="service-counter text-center">

				<div class="col-md-4 col-sm-4">
					<div class="single-service-box">
						<div class="service-img">
							<img
								src="https://cdn-icons-png.flaticon.com/512/2809/2809814.png"
								alt="pet-icon" style="width: 140px" />
						</div>
						<!--/.service-img-->
						<div class="service-content">
							<h2>
								<a href="#" style="font-size: 25px"> 엄선된 펫시터 고용 </a>
							</h2>
							<p style="font-size: 15px;">강형욱 훈련사님의 전문 교육을 수료한 엄선된 펫시터가
								방문합니다!</p>
						</div>
						<!--/.service-content-->
					</div>
					<!--/.single-service-box-->
				</div>
				<!--/.col-->

				<div class="col-md-4 col-sm-4">
					<div class="single-service-box">
						<div class="service-img">
							<img
								src="https://cdn-icons-png.flaticon.com/512/3004/3004666.png"
								alt="camera-icon" style="width: 90px" />
						</div>
						<!--/.service-img-->
						<div class="service-content" style="margin-left: 20px;">
							<h2>
								<a href="#" style="font-size: 25px"> 실시간 돌봄 영상 </a>
							</h2>
							<p style="font-size: 15px;">
								모든 펫시터는 바디캠을 착용하여<br> 모든 돌봄과정을 실시간 영상으로 <br> 확인하실 수
								있습니다!
							</p>
						</div>
						<!--/.service-content-->
					</div>
					<!--/.single-service-box-->
				</div>
				<!--/.col-->

				<div class="col-md-4 col-sm-4">
					<div class="single-service-box">
						<div class="service-img">
							<img
								src="https://cdn-icons-png.flaticon.com/512/1705/1705419.png"
								alt="safe-icon" style="width: 140px" />
						</div>
						<!--/.service-img-->
						<div class="service-content">

							<h2>
								<a href="#" style="font-size: 25px"> 체계적이고 안전한<br>프로그램
								</a>
							</h2>
							<p style="font-size: 15px;">
								예상치 못한 사건 또는 사고 발생시<br> 책임보상제도 등 체계적이고 안전한 프로그램이 적용됩니다!
							</p>
						</div>
						<!--/.service-content-->
					</div>
					<!--/.single-service-box-->
				</div>
				<!--/.col-->

			</div>
			<!--/.statistics-counter-->
		</div>
		<!--/.container-->

	</section>
	<!--/.service-->
	<!--돌봐줄개냥 서비스 설명 end-->





		<!-- best 포토 start -->
			
			<section id="pack" class="packages">
			<div class="container">
				<div class="gallary-header text-center">
					<h2>
						Best Photo of Year
					</h2>
					<p>
						포토갤러리에 사진을 업로드하고 Best Photo에 주인공이 되어보세요!  
					</p>
				</div><!--/.gallery-header-->
				<div class="packages-content">
					<div class="row">

						<div class="col-md-4 col-sm-6">
							<div class="single-package-item">
								<img src="images/packages/dangdang.jpg" alt="package-place">
								<div class="single-package-item-txt">
									<h3> <span class="pull-right"><i class="fas fa-heart"></i> 257</span></h3>
									<div class="packages-para">
										<p>
											<span style="width: 300px;">
												<i class="fa fa-angle-right"></i>
												타사보다 홈페이지 답변이 빠르구 정말 친절하셨어요 다음에도 믿고 맡길 듯합니다~!
											</span>
											
										</p>
										
									</div><!--/.packages-para-->
									
									
									<!--  추후 서비스단 연결 필요 -->
									<div class="about-btn">
										<button type="submit"  class="about-view packages-btn" onclick="location.href = 'PboardList.pg';">
											더보기 
										</button>
									</div><!--/.about-btn-->
								</div><!--/.single-package-item-txt-->
							</div><!--/.single-package-item-->

						</div><!--/.col-->

						<div class="col-md-4 col-sm-6">
							<div class="single-package-item">
								<img src="images/packages/charlie.jpg" alt="package-place">
								<div class="single-package-item-txt">
									<h3> <span class="pull-right"><i class="fas fa-heart"></i> 453</span></h3>
									<div class="packages-para">
										<p>
											<span style="width: 300px;">
												<i class="fa fa-angle-right"></i>
												전문적인 분이 오셔서케어해주셔서 아직 아기인데도 믿고 맡길 수 있었고 매우 만족합니다!
											</span>
											
										</p>
										
									</div><!--/.packages-para-->
									
									<div class="about-btn" href="/WEB-INF/view/board/photogallery.jsp">
										<button type="submit"  class="about-view packages-btn" onclick="location.href = 'PboardList.pg';">
											더보기 
										</button>
									</div><!--/.about-btn-->
								</div><!--/.single-package-item-txt-->
							</div><!--/.single-package-item-->

						</div><!--/.col-->
						
						<div class="col-md-4 col-sm-6">
							<div class="single-package-item">
								<img src="images/packages/cardog.jpg" alt="package-place">
								<div class="single-package-item-txt">
									<h3> <span class="pull-right"><i class="fas fa-heart"></i> 221</span></h3>
									<div class="packages-para">
										<p>
											<span style="width: 300px;">
												<i class="fa fa-angle-right"></i>
												홈페이지에서 답변도 빠르구 정말 친절하셨어요!
												저희강쥐도 만족하는듯한 얼굴이에요 ㅎㅎ
											</span>
											
										</p>
										
									</div><!--/.packages-para-->
									
									<div class="about-btn">
										<button type="submit"  class="about-view packages-btn" onclick="location.href = 'PboardList.pg';">
											더보기 
										</button>
									</div><!--/.about-btn-->
								</div><!--/.single-package-item-txt-->
							</div><!--/.single-package-item-->

						</div><!--/.col-->
						
						</div>
					</div>
				</div>
			</section>



		<!-- 회원가입 권유 (하단) -->
	<section id="spo" class="special-offer">
<img src="images\sexyjingun\dogwalking.jpg"
				style="margin: auto; position: absolute; top: 50%; left: 50%; width: 60%; height: 100%; transform: translate(-50%, -50%);">
		<div class="container">

			<div class="special-offer-content">

				<div class="row">

					<div class="col-sm-8">
						<div class="single-special-offer">

							<div class="single-special-offer-txt"
								style="margin-top: 50px; margin-bottom: 50px;">
								<h2>Join Now!</h2>
								<div class="packages-review special-offer-review">
									<p>
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <p style="font-size: 20px; color: white">직접 사용해본 고객님들의 123건의
											만족스러운 후기</p>
									</p>
								</div>
								<!--/.packages-review-->
								<div class="packages-para special-offer-para">
									<p style="font-size: 20px; color: white">
										<i class="fa fa-angle-right"></i> 교육을 받은
											훈련사님들이라서 그런지 믿고 맡길 수 있었어요!<br>
										<i class="fa fa-angle-right"></i> 저희애가 사람을 물어서
											걱정했는데 여기는 정말 맘편히 사용합니다<br>
										<i class="fa fa-angle-right"></i> 저희 냥이가 노묘라서
											실수를 많이하는데 다 치워주시고 여긴 최고네요:)<br>
										<i class="fa fa-angle-right"></i> 처음 반려동물을 맡기시는
											분들께 추천합니다. <br>
										<i class="fa fa-angle-right"></i> 이만한 퀄리티에 이
											가격이면 계속 이용할듯 해요^^
									</p>
									<p class="offer-para" style="font-size: 20px">지금 바로 가입하세요!</p>
								</div>
								<!--/.packages-para-->
								<div class="offer-btn-group" style="width:100px; margin:auto; display:block;">
									<div class="about-btn">
										<button class="about-view packages-btn offfer-btn"
											onclick="location.href = 'joinform.jsp';">
											<div style="font-size: 20px; ">
											join now
											</div>
											</button>
									</div>
								</div>
								<!--/.offer-btn-group-->
							</div>
							<!--/.single-special-offer-txt-->
						</div>
						<!--/.single-special-offer-->
					</div>
					<!--/.col-->
					<div class="col-sm-4">
						<div class="single-special-offer">
							<!-- <div class="single-special-offer-bg">
									<img src="images/offer/offer-shape.png" alt="offer-shape">
								</div>-->
							<!--/.single-special-offer-bg-->
							<!-- <div class="single-special-shape-txt">
									<h3>special offer</h3>
									<h4><span>40%</span><br>off</h4>
									<p><span>$999</span><br>reguler $ 1450</p>

								</div>/.single-special-shape-txt -->
						</div>
						<!--/.single-special-offer-->
					</div>
					<!--/.col-->
				</div>
				<!--/.row-->
			</div>
			<!--/.special-offer-content-->
		</div>
		<!--/.container-->

	</section>
	<!--/.special-offer end-->
	<!--special-offer end-->




		<!-- footer-copyright start -->
		<footer  class="footer-copyright">
			<div class="container">
				<hr>
				<div class="foot-icons ">
					<ul class="footer-social-links list-inline list-unstyled">
		                <li><a href="#" target="_blank" class="foot-icon-bg-1"><i class="fa fa-facebook"></i></a></li>
		                <li><a href="#" target="_blank" class="foot-icon-bg-2"><i class="fa fa-twitter"></i></a></li>
		                <li><a href="#" target="_blank" class="foot-icon-bg-3"><i class="fa fa-instagram"></i></a></li>
		        	</ul>
		        	<p>&copy; 2021 <a href="https://www.themesine.com">Not Null One Hae</a>. All Right Reserved</p>

		        </div><!--/.foot-icons-->
				<div id="scroll-Top">
					<i class="fa fa-angle-double-up return-to-top" id="scroll-top" data-toggle="tooltip" data-placement="top" title="" data-original-title="Back to Top" aria-hidden="true"></i>
				</div><!--/.scroll-Top-->
			</div><!-- /.container-->

		</footer><!-- /.footer-copyright-->
		<!-- footer-copyright end -->




		<script src="js/jquery.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->

		<!--modernizr.min.js-->
		<script  src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>


		<!--bootstrap.min.js-->
		<script  src="js/bootstrap.min.js"></script>

		<!-- bootsnav js -->
		<script src="js/bootsnav.js"></script>

		<!-- jquery.filterizr.min.js -->
		<script src="js/jquery.filterizr.min.js"></script>

		<script  src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>

		<!--jquery-ui.min.js-->
        <script src="js/jquery-ui.min.js"></script>

        <!-- counter js -->
		<script src="js/jquery.counterup.min.js"></script>
		<script src="js/waypoints.min.js"></script>

		<!--owl.carousel.js-->
        <script  src="js/owl.carousel.min.js"></script>

        <!-- jquery.sticky.js -->
		<script src="js/jquery.sticky.js"></script>

        <!--datepicker.js-->
        <script  src="js/datepicker.js"></script>

		<!--Custom JS-->
		<script src="js/custom.js"></script>


	</body>

</html>