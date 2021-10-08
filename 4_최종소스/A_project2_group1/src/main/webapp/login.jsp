<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<title>loginpage</title>
		<!-- META DATA -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<!--font-family-->
		<link href="https://fonts.googleapis.com/css?family=Rufina:400,700" rel="stylesheet" />

		<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet" />

		<!-- favicon img -->
		<link rel="shortcut icon" type="image/icon" href="logo/favicon.png"/>

		<!--font-awesome.min.css-->
		<link rel="stylesheet" href="css/font-awesome.min.css" />

		<!--animate.css-->
		<link rel="stylesheet" href="css/animate.css" />

		<!--hover.css-->
		<link rel="stylesheet" href="css/hover-min.css">

		<!--datepicker.css-->
<!-- 		<link rel="stylesheet"  href="css/datepicker.css" >
 -->
		<!--owl.carousel.css-->
<!--         <link rel="stylesheet" href="css/owl.carousel.min.css">
		<link rel="stylesheet" href="css/owl.theme.default.min.css"/> -->

		<!-- range css 필요-->
        <link rel="stylesheet" href="css/jquery-ui.min.css" />

		<!--bootstrap.min.css-->
		<link rel="stylesheet" href="css/bootstrap.min.css" />

		<!-- bootsnav -->
		<link rel="stylesheet" href="css/bootsnav.css"/>

		<!--style.css-->
		<link rel="stylesheet" href="css/style.css" />

		<!--responsive.css-->
		<link rel="stylesheet" href="css/responsive.css" />

		<meta charset="UTF-8">
		
		<link rel="stylesheet" href="css/login.css" />
		
		
		

	
</head>
<body>

		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
		<form name="loginForm" id="loginForm" method="post" action="LoginOK.me">
		<table>
			
			<h1 id="loginhere">로그인</h1>
			<form action="LoginOK.me" method="post" name="loginForm" id="loginForm">
				<tr>
					<th>아이디(Email)</th>
					<td><input type="text" style="width: 150%;" maxlength="20"
						id="email" name="email" ></td>
					<td class="tdid"></td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td><input type="password" style="width: 150%;" maxlength="20"
						id="mpwd" name="mpwd"></td>
					<td class="tdpw"></td>
				</tr>
				<tr>
					<td></td>
					<td id="login-btn">
						<input type="submit" class="book-btn" value="Login">
					</td>
				</tr>
			</form>
		<!-- 회원정보 메인으로 넘겨야함 -->
		
		</table>
		</form>
			




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