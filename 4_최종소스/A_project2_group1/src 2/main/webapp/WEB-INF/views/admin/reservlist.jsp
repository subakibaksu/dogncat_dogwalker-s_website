<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
    integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js"
    integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/"
    crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  <!--
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
    integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
    integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
    crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
    integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
  <link rel="stylesheet" href="Admin.css">

</head>

<body>

	<c:set var="pagesize" value="${requestScope.pagesize}"></c:set>
	<c:set var="cpage" value="${requestScope.cpage}"></c:set>
	<c:set var="pagecount" value="${requestScope.pagecount}"></c:set>
	<c:set var="list" value="${requestScope.list}"></c:set>
	<c:set var="totalboardcount" value="${requestScope.totalboardcount}"></c:set>
	<c:set var="pager" value="${requestScope.pager}"></c:set>

				
				
				
				
				
				
				
				
				

		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

  <h2>예약관리</h2>
  <ul class="nav nav-tabs">
    <li class="nav-item">
      <a class="nav-link active" data-bs-toggle="tab" href="#reserv-w">산책예약</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#reserv-c">돌봄예약</a>
    </li>
  </ul>
  <div id="myTabContent" class="tab-content">
    <div class="tab-pane fade active show" id="reserv-w">
      <!-- 산책예약상태조회 체크박스 -->
      <div class="reserv">
        <h3>예약상태</h3>
        <div id="checkbox-group">
          <div class="checkbox-group1">
            
           <input type="radio" id="radio-all" class="bigRadio" name="rcc" value="all">
           <label>전체선택</label>
.
           <input type="radio" class="bigRadio" name="rwc" value="예약대기">
           <label>예약대기</label>

           <input type="radio" class="bigRadio" name="rwc" value="예약승인">
           <label>예약승인</label>
           
           <input type="radio" class="bigRadio" name="rwc" value="예약취소">
           <label>예약취소</label>

           <input type="radio" class="bigRadio" name="rwc" value="이용완료">
           <label>이용완료</label>
           
          </div>
        </div>
      </div>

      <div class="serachButton">
        <div class="d-flex justify-content-center">
          <input type="button" class="btn btn-primary" style="background-color: #008080">검색</button>
        </div>
      </div>

      <div class="changeButton">
        <div class="d-flex justify-content-end">
          <type="button" class="btn btn-primary" style="background-color: #008080">변경</button>
        </div>
      </div>

      <!-- 산책예약상태 테이블 -->
      <table class="table">
        <thead bgcolor="#008080" style="color: white;">
          <tr class="tr">
            <th scope="col">예약번호</th>
            <th scope="col">이메일</th>
            <th scope="col">연락처</th>
            <th scope="col">주소</th>
            <th scope="col">산책날짜</th>
            <th scope="col">산책시간</th>
            <th scope="col">결제금액</th>
            <th scope="col">요청일</th>
            <th scope="col">예약상태</th>
          </tr>
        </thead>
        <tbody>
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
            <td>
             <select form="" name="rstatus" id="reserv-s">
            	<c:choose>
					<c:when test="${board.rstatus=='예약대기'}">
						<option value="예약대기" selected>예약대기</option>
                		<option value="예약승인">예약승인</option>
                		<option value="예약취소">예약취소</option>
                		<option value="이용완료">이용완료</option>
					</c:when>
					<c:when test="${board.rstatus=='예약승인'}">
					    <option value="예약대기">예약대기</option>
                		<option value="예약승인" selected>예약승인</option>
                		<option value="예약취소">예약취소</option>
                		<option value="이용완료">이용완료</option>
					</c:when>
					<c:when test="${board.rstatus=='예약취소'}">
					    <option value="예약대기">예약대기</option>
                		<option value="예약승인">예약승인</option>
                		<option value="예약취소" selected>예약취소</option>
                		<option value="이용완료">이용완료</option>
					</c:when>
					<c:when test="${board.rstatus=='이용완료'}">
					    <option value="예약대기">예약대기</option>
                		<option value="예약승인">예약승인</option>
                		<option value="예약취소">예약취소</option>
                		<option value="이용완료" selected>이용완료</option>
					</c:when>
					<c:otherwise>
						<option value="예약대기">예약대기</option>
                		<option value="예약승인">예약승인</option>
                		<option value="예약취소">예약취소</option>
                		<option value="이용완료">이용완료</option>
					</c:otherwise>
				</c:choose>

              </select>
            </td>
          </tr>
         </c:forEach>
        </tbody>
      </table>
    </div>



  </div>

</body>
<script src="Admin.js"></script>
</html>