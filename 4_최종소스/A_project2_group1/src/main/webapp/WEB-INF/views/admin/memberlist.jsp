<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous"> -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<!-- 시작 -->
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap')
	;
</style>

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

<!--datepicker.css-->
<link rel="stylesheet" href="css/datepicker.css">

<!--owl.carousel.css-->
<link rel="stylesheet" href="css/owl.carousel.min.css" />
<link rel="stylesheet" href="css/owl.theme.default.min.css" />

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
<!-- 끝 -->

<link rel="stylesheet" href="css/Admin.css" />
<style>
#head {
	padding-top: 100px;
	display: flex;
	flex-direction: row;
	justify-content: center;
}

.mtable {
	text-align: center;
}

.search-bar {
	display: flex;
	margin-top: 20px;
	margin-bottom: 10px;
}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<c:set var="pagesize" value="${requestScope.pagesize}"></c:set>
	<c:set var="cpage" value="${requestScope.cpage}"></c:set>
	<c:set var="pagecount" value="${requestScope.pagecount}"></c:set>
	<c:set var="list" value="${requestScope.list}"></c:set>
	<c:set var="totalboardcount" value="${requestScope.totalboardcount}"></c:set>
	<c:set var="pager" value="${requestScope.pager}"></c:set>

	<!-- <h2>회원관리</h2> -->
	<h1 id="head">회원관리</h1>
	<form id="searchm" action="MemberManageSearch.mb" method="get"></form>
	<div class="search-bar">
		<select form="searchm" name="option" class="header__searchSelect">
			<option value="m.email">id</option>
			<option value="m.mname">이름</option>
		</select>

			<input form="searchm" type="text" name="searchword" class="header__searchInput" />
			<input form="searchm" type="submit" value="검색" />
	</div>

	<!-- 회원관리 테이블 -->

	<!-- <input type="checkbox" id="check-all2" class="bigCheck">
  <label for="check-all2">전체선택</label>

  <input type="checkbox" class="bigCheck" name="rcc">
  <label for="check">예약대기</label> -->
	<form id="delm" action="MemberManageDelete.mb" method="post"></form>
	<table class="table" id="memberTable" style="text-align-last: middle">
		<thead bgcolor="#00d8d5" style="color: white;">
			<tr class="tr">
				<th scope="col">
					<div id="checkbox-group">
						<div class="checkbox-group3">
							<div class="memberCheck">
								<input type="checkbox" class="bigCheck" id="check-allMember">
							</div>
						</div>
					</div>
				</th>
				<th scope="col" class="mtable">id</th>
				<th scope="col" class="mtable">이름</th>
				<th scope="col" class="mtable">연락처</th>
				<th scope="col" class="mtable">주소</th>
				<th scope="col" class="mtable">이용건수</th>
				<th scope="col" class="mtable">총 결제금액</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach var="board" items="${list}">
				<tr>
					<th scope="row">
						<div id="checkbox-group">
							<div class="checkbox-group3">
								<div class="memberCheck">
									<input form="delm" type="checkbox" class="bigCheck" name="mc"
										value="${board.email}">
								</div>
							</div>
						</div>
					</th>
					<td>${board.email}</td>
					<td>${board.mname}</td>
					<td>${board.mphone}</td>
					<td>${board.madd}</td>
					<td>${board.count}</td>
					<td>${board.totalp}</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
	<div style="margin-left: 10px;">
	<input form="delm" type="submit" class="delButton" value="삭제">
	</div>
	<div style="text-align: center; font-size: 15px;">${pager}</div>
</body>

<script src="js/Admin.js"></script>
</html>