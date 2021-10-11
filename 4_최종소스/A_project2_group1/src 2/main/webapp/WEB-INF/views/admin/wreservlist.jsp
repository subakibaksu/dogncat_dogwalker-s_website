<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<!-- TITLE OF SITE -->
<title>Sitting reserve List</title>

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

<!-- favicon img -->
<link rel="shortcut icon" type="image/icon" href="logo/favicon.png" />

<!--font-awesome.min.css-->
<link rel="stylesheet" href="css/font-awesome.min.css" />

<!--animate.css-->
<link rel="stylesheet" href="css/animate.css" />

<!--hover.css-->
<link rel="stylesheet" href="css/hover-min.css">

<!-- range css 필요-->
<link rel="stylesheet" href="css/jquery-ui.min.css" />

<!--bootstrap.min.css-->
<link rel="stylesheet" href="css/bootstrap.min.css" />

<!-- bootsnav -->
<link rel="stylesheet" href="css/bootsnav.css" />

<!--style.css-->
<link rel="stylesheet" href="css/style.css" />

<!--responsive.css-->
<link rel="stylesheet" href="css/responsive.css" />

<meta charset="UTF-8">

<link rel="stylesheet" href="css/login.css" />
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap')
	;
</style>
<style type="text/css">
#vrListContainer {
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

th, tr, td {
	padding: 5px;
	min-width: 100px;
}

#vr_select {
	text-align: center;
	align-items: center;
}

#vr_table:not(#vr_table_title) {
	font-size: 15px;
}
</style>

</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<c:set var="pagesize" value="${requestScope.pagesize}"></c:set>
	<c:set var="cpage" value="${requestScope.cpage}"></c:set>
	<c:set var="pagecount" value="${requestScope.pagecount}"></c:set>
	<c:set var="list" value="${requestScope.list}"></c:set>
	<c:set var="totalboardcount" value="${requestScope.totalboardcount}"></c:set>
	<c:set var="pager" value="${requestScope.pager}"></c:set>



	<form id="changecheck" action="ReserveWalkingCommit.mb" method="get"></form>
	<form id="searchcheck" action="ReserveWalkingSearch.mb" method="get"></form>

	<div id="vrListContainer">
		<h1>예약관리</h1>
		<h3>예약상태 확인 - 산책</h3>
		<br>
		<div id="vrtable_div" style="width: 1300px;">
			<table id="vr_select" style="width: 1300px; margin: 0px">
				<tr id="vr_select">
					<td colspan="2" width="20%"><input form="searchcheck"
						type="radio" class="bigRadio" name="option" value="all" checked>
						<label>전체선택</label></td>
					<td colspan="2"><input form="searchcheck" type="radio"
						class="bigRadio" name="option" value="예약대기"> <label>예약대기</label></td>
					<td colspan="2"><input form="searchcheck" type="radio"
						class="bigRadio" name="option" value="예약승인"> <label>예약승인</label></td>
					<td colspan="2"><input form="searchcheck" type="radio"
						class="bigRadio" name="option" value="예약취소"> <label>예약취소</label></td>
					<td colspan="2"><input form="searchcheck" type="radio"
						class="bigRadio" name="option" value="이용완료"> <label>이용완료</label></td>
				</tr>
				<tr>
					<td colspan="10" style="text-align: center;"><input
						form="searchcheck" type="submit" class="btn btn-primary"
						style="background-color: #00d8d5" value="검색"></td>
				</tr>
			</table>


			<!-- 산책예약상태 테이블 -->
			<table id="vr_table" style="text-align-last: center;">
				<tr bgcolor="00d8d5" style="color: white; text-align-last: center;"
					id="tr_table_title">
					<th scope="col">예약번호</th>
					<th scope="col">이메일</th>
					<th scope="col">연락처</th>
					<th scope="col">주소</th>
					<th scope="col">산책날짜</th>
					<th scope="col">산책시간</th>
					<th scope="col">결제금액</th>
					<th scope="col">요청일</th>
					<th scope="col">예약상태</th>
					<th scope="col">변경</th>
				</tr>

				<c:forEach var="board" items="${list}">
					<tr>
						<th>${board.rnum}</th>
						<td>${board.email}</td>
						<td>${board.mphone}</td>
						<td>${board.madd}</td>
						<td>${board.udate}</td>
						<td>${board.time}</td>
						<td>${board.price}</td>
						<td>${board.rdate}</td>
						<td><input form="changecheck" type="hidden" name="rnum"
							value="${board.rnum}"> <input form="changecheck"
							type="hidden" name="cp" value="${cpage}"> <select
							form="changecheck" name="rstatuscode" id="reserv-s">
								<c:choose>
									<c:when test="${board.rstatus=='예약대기'}">
										<option value="1" selected>예약대기</option>
										<option value="2">예약승인</option>
										<option value="3">이용완료</option>
										<option value="4">예약취소</option>
									</c:when>
									<c:when test="${board.rstatus=='예약승인'}">
										<option value="1">예약대기</option>
										<option value="2" selected>예약승인</option>
										<option value="3">이용완료</option>
										<option value="4">예약취소</option>
									</c:when>
									<c:when test="${board.rstatus=='이용완료'}">
										<option value="1">예약대기</option>
										<option value="2">예약승인</option>
										<option value="3" selected>이용완료</option>
										<option value="4">예약취소</option>
									</c:when>
									<c:when test="${board.rstatus=='예약취소'}">
										<option value="1">예약대기</option>
										<option value="2">예약승인</option>
										<option value="3">이용완료</option>
										<option value="4" selected>예약취소</option>
									</c:when>
									<c:otherwise>
										<option value="1">예약대기</option>
										<option value="2">예약승인</option>
										<option value="3">이용완료</option>
										<option value="4">예약취소</option>
									</c:otherwise>
								</c:choose>

						</select></td>
						<td>
							<div class="changeButton">
								<div class="d-flex justify-content-end">
									<input form="changecheck" type="submit" class="btn btn-primary"
										style="background-color: #00d8d5" value="변경">
								</div>
							</div>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="10">${pager}</td>
				</tr>
			</table>
		</div>
	</div>

</body>
<script src="Admin.js"></script>
</html>