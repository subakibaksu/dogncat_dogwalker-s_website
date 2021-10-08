<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<!-- META DATA -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<!--font-family-->
<link href="https://fonts.googleapis.com/css?family=Rufina:400,700"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
	rel="stylesheet" />
<!-- TITLE OF SITE -->
<title>Travel</title>
<!-- favicon img -->
<link rel="shortcut icon" type="image/icon" href="logo/favicon.png" />
<!--font-awesome.min.css-->
<link rel="stylesheet" href="css/font-awesome.min.css" />
<!--animate.css-->
<link rel="stylesheet" href="css/animate.css" />
<!--hover.css-->
<link rel="stylesheet" href="css/hover-min.css">
<!-- range css-->
<link rel="stylesheet" href="css/jquery-ui.min.css" />
<!--bootstrap.min.css-->
<link rel="stylesheet" href="css/bootstrap.min.css" />
<!-- bootsnav -->
<link rel="stylesheet" href="css/bootsnav.css" />
<!--style.css-->
<link rel="stylesheet" href="css/style.css" />
<!--responsive.css-->
<link rel="stylesheet" href="css/responsive.css" />

<!--reviewboard.css-->
<link rel="stylesheet" href="css/reviewboard.css" />

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

<link
	href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100,300,400,500,700,900"
	rel="stylesheet" />

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap')
	;
</style>

<style type="text/css">

#riveiwBoardListContainer {
	padding-top: 100px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	font-family: 'Noto Sans KR', sans-serif;
}

h1 {
	font-family: 'jua';
}

#riviewBoardWrite {
	align-content: center;
	align-items: center;
}

#reviewboard {
	width: 800px;
}

input {
	width: 100%;
	height: 30px;
	border: solid 2px #00d8d5;
	border-radius: 8px;
	display : flex;
}

#rbcont {
	width: 100%;
	height: 200px;
	border: solid 2px #00d8d5;
	border-radius: 8px;
	resize: none;
	display: flex;
	flex-direction: column;
    align-items: center;
    justify-content: center;
}


</style>

</head>
<body>
	<c:set var="pagesize" value="${requestScope.pagesize}"></c:set>
	<c:set var="cpage" value="${requestScope.cpage}"></c:set>
	<c:set var="pagecount" value="${requestScope.pagecount}"></c:set>
	<c:set var="list" value="${requestScope.list}"></c:set>
	<c:set var="totalboardcount" value="${requestScope.totalboardcount}"></c:set>
	<c:set var="pager" value="${requestScope.pager}"></c:set>
	
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<div id="riveiwBoardListContainer">
		<h1>리뷰 작성하기</h1>
		<br>
		<div id="rboarddiv">
			<form action="ReviewBoardWriteOK.bd" method="post" name="rbForm" id="rbForm">
				<table id="reviewboard">	<!-- 리뷰작성테이블 -->
					<tr id="reviewboard_write">	<!-- 닉네임 -->
						<td id="rboard_td">닉네임</td>
						<td id="rboard_input_text" colspan="5">${sessionScope.loginUser.mnic}<input type="hidden" name="email" id="mic" value="${sessionScope.loginUser.email}"></input></td>
					</tr>
					<tr id="reviewboard_write"> <!-- 제목 -->
						<td id="rboard_td">제　목</td>
						<td id="rboard_input_text" colspan="5"><input type="text" name="rbsubj" id="rbsubj"></input></td>
					</tr>
					<tr id="reviewboard_write_radio"> <!-- 만족도 평가 -->
						<td id="rboard_td">만족도</td>
						<td id="rboard_input_radio"><input type="radio" name="point" id="point1" value="1"></input>
							<label for="point1">💙🤍🤍🤍🤍</label></td>
						<td id="rboard_input_radio"><input type="radio" name="point" id="point2" value="2"></input>
							<label for="point2">💙💙🤍🤍🤍</label></td>
						<td id="rboard_input_radio"><input type="radio" name="point" id="point3" value="3"></input>
							<label for="point3">💙💙💙🤍🤍</label></td>
						<td id="rboard_input_radio"><input type="radio" name="point" id="point4" value="4"></input>
							<label for="point4">💙💙💙💙🤍</label></td>
						<td id="rboard_input_radio"><input type="radio" name="point" id="point5" value="5"></input>
							<label for="point5">💙💙💙💙💙</label></td>
					</tr>
					<tr id="reviewboard_write"> <!-- 내용 -->
						<td id="rboard_td">내　용</td>
						<td id="rboard_input_text" colspan="5"><textarea name="rbcont" id="rbcont"></textarea></td>
					</tr>
					<tr id="review_write_btn">
						<td colspan="6" align="center" id="review_write_btn">
						<input type="submit" class="about-view packages-btn" value="작성완료">
						</td>
					</tr>
				</table>
			</form>
			<div id="riviewBoardWrite" style="text-align: center"></div>
		</div>
	</div>



</body>
</html>