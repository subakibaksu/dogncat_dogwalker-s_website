<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- main-menu Start -->
<header class="top-area">
	<div class="header-area">
		<div class="container">
			<div class="row">
				<div class="col-sm-2">
					<div class="logo">
					
						<a href="index.jsp"> <img src="logo/favicon.png" style="width: 30px" /> 돌봐줄<span>개</span>냥
						</a>
					</div>
					<!-- /.logo-->
				</div>
				<!-- /.col-->
				<div class="col-sm-10">
					<div class="main-menu">

						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".navbar-collapse">
								<i class="fa fa-bars"></i>
							</button>
							<!-- / button-->
						</div>
						<!-- /.navbar-header-->
						<div class="collapse navbar-collapse">
							<ul class="nav navbar-nav navbar-right">
								<%-- ${sessionScope.loginUser} --%>

								<c:set var="usernic" value="${sessionScope.loginUser.mnic}" />
								<li class="smooth-menu"><a class="nav-link" href='weather.jsp'>오늘의 날씨</a></li>
								<li class="smooth-menu"><a class="nav-link" href='PboardList.pg'>포토갤러리</a></li>
								<li class="smooth-menu"><a class="nav-link" href='ReviewBoardList.bd'>리뷰</a></li>
								
								<c:choose>
									
									<c:when test="${loginUser.email=='admin@dogcat.com'}">
										<li style="padding-right: 0px;"><a href="ReserveWalkingList.mb">[산책 |</a></li>
										<li style="padding-right: 0px;"><a href="ReserveVisitingList.mb">방문 |</a></li>
										<li style="padding-right: 0px;"><a href="AllCountingList.mb">통계 |</a></li>
										<li style="padding-right: 0px;"><a class="nav-link" href="MemberManageList.mb">회원 ]</a></li>
										
										<li class="nametag"><a  style="color: #00d8ff;">[ 관리자 ]</a></li>
										<li>
											<form action="LogoutOK.me" method="post">
												<button class="book-btn">LogOut</button>
											</form>
										</li>
									</c:when>
								
									<c:when test="${!empty loginUser.mnic}">
										<li class="smooth-menu"><a style="color: #00d8ff;">[${sessionScope.loginUser.mnic} ] 님 환영합니다.</a></li>
										<li>
											<form action="LogoutOK.me" method="post">
												<button class="book-btn">LogOut</button>
											</form>
										</li>									
									</c:when>
									
									<c:otherwise>
										<li>
											<form action="login.jsp" method="post">
												<button class="book-btn">LogIn</button>
											</form>
										</li>
										<li>
											<form action="joinform.jsp" method="post">
												<button class="book-btn">SignUp</button>
											</form>
										</li>
									</c:otherwise>
								</c:choose>


							</ul>

						</div>
						<!-- /.navbar-collapse -->
					</div>
					<!-- /.main-menu-->
				</div>
				<!-- /.col-->
			</div>
			<!-- /.row -->
			<div class="home-border"></div>
			<!-- /.home-border-->
		</div>
		<!-- /.container-->
	</div>
	<!-- /.header-area -->

</header>
<!-- /.top-area-->
<!-- main-menu End -->
