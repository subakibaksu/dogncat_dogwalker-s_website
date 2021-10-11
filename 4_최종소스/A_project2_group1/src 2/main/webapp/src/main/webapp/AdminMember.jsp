<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

            <input type="checkbox" id="check-allWalking" name="check-allWalking" class="bigCheck">
            <label for="check-allWalking">전체선택</label>

            <input type="checkbox" class="bigCheck" name="rwc">
            <label for="check">예약대기</label>

            <input type="checkbox" class="bigCheck" name="rwc">
            <label for="check">예약승인</label>

            <input type="checkbox" class="bigCheck" name="rwc">
            <label for="check">예약취소</label>

            <input type="checkbox" class="bigCheck" name="rwc">
            <label for="check">이용완료</label>
          </div>
        </div>
      </div>

      <div class="serachButton">
        <div class="d-flex justify-content-center">
          <button type="button" class="btn btn-primary" style="background-color: #008080">검색</button>
        </div>
      </div>

      <div class="changeButton">
        <div class="d-flex justify-content-end">
          <button type="button" class="btn btn-primary" style="background-color: #008080">변경</button>
        </div>
      </div>

      <!-- 산책예약상태 테이블 -->
      <table class="table">
        <thead bgcolor="#008080" style="color: white;">
          <tr class="tr">
            <th scope="col">no</th>
            <th scope="col">예약번호</th>
            <th scope="col">이메일</th>
            <th scope="col">연락처</th>
            <th scope="col">주소</th>
            <th scope="col">시작일</th>
            <th scope="col">종료일</th>
            <th scope="col">결제금액</th>
            <th scope="col">요청일</th>
            <th scope="col">예약상태</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row">1</th>
            <td>섹시</td>
            <td>진건</td>
            <td>섹시</td>
            <td>진건</td>
            <td>섹시</td>
            <td>진건</td>
            <td>섹시</td>
            <td>진건</td>
            <td>
              <select name="reservStatus" id="reserv-s">
                <option value="예약대기">예약대기</option>
                <option value="예약승인">예약승인</option>
                <option value="예약취소">예약취소</option>
                <option value="이용완료">이용완료</option>
              </select>
            </td>
          </tr>
          <tr>
            <th scope="row">2</th>
            <td>섹시</td>
            <td>진건</td>
            <td>섹시</td>
            <td>진건</td>
            <td>섹시</td>
            <td>진건</td>
            <td>섹시</td>
            <td>진건</td>
            <td></td>
          </tr>
          <tr>
            <th scope="row">3</th>
            <td>섹시</td>
            <td>진건</td>
            <td>섹시</td>
            <td>진건</td>
            <td>섹시</td>
            <td>진건</td>
            <td>섹시</td>
            <td>진건</td>
            <td></td>
          </tr>
          <tr>
            <th scope="row">4</th>
            <td>섹시</td>
            <td>진건</td>
            <td>섹시</td>
            <td>진건</td>
            <td>섹시</td>
            <td>진건</td>
            <td>섹시</td>
            <td>진건</td>
            <td></td>
          </tr>
          <tr>
            <th scope="row">5</th>
            <td>섹시</td>
            <td>진건</td>
            <td>섹시</td>
            <td>진건</td>
            <td>섹시</td>
            <td>진건</td>
            <td>섹시</td>
            <td>진건</td>
            <td></td>
          </tr>
          <tr>
            <th scope="row">6</th>
            <td>섹시</td>
            <td>진건</td>
            <td>섹시</td>
            <td>진건</td>
            <td>섹시</td>
            <td>진건</td>
            <td>섹시</td>
            <td>진건</td>
            <td></td>
          </tr>
          <tr>
            <th scope="row">7</th>
            <td>섹시</td>
            <td>진건</td>
            <td>섹시</td>
            <td>진건</td>
            <td>섹시</td>
            <td>진건</td>
            <td>섹시</td>
            <td>진건</td>
            <td></td>
          </tr>
          <tr>
            <th scope="row">8</th>
            <td>섹시</td>
            <td>진건</td>
            <td>섹시</td>
            <td>진건</td>
            <td>섹시</td>
            <td>진건</td>
            <td>섹시</td>
            <td>진건</td>
            <td></td>
          </tr>
          <tr>
            <th scope="row">9</th>
            <td>섹시</td>
            <td>진건</td>
            <td>섹시</td>
            <td>진건</td>
            <td>섹시</td>
            <td>진건</td>
            <td>섹시</td>
            <td>진건</td>
            <td></td>
          </tr>
          <tr>
            <th scope="row">10</th>
            <td>섹시</td>
            <td>진건</td>
            <td>섹시</td>
            <td>진건</td>
            <td>섹시</td>
            <td>진건</td>
            <td>섹시</td>
            <td>진건</td>
            <td></td>
          </tr>
        </tbody>
      </table>
    </div>

    <div class="tab-pane fade" id="reserv-c">
      <!-- 돌봄예약상태조회 체크박스 -->
      <div class="reserv">
        <h3>예약상태</h3>

        <div id="checkbox-group">
          <div class="checkbox-group2">

            <input type="checkbox" id="check-allCare" class="bigCheck">
            <label for="check-allCare">전체선택</label>

            <input type="checkbox" class="bigCheck" name="rcc">
            <label for="check">예약대기</label>

            <input type="checkbox" class="bigCheck" name="rcc">
            <label for="check">예약승인</label>

            <input type="checkbox" class="bigCheck" name="rcc">
            <label for="check">예약취소</label>

            <input type="checkbox" class="bigCheck" name="rcc">
            <label for="check">이용완료</label>
          </div>
        </div>

        <h3>종류</h3>
        <div id="radio-group">

          <input type="radio" id="radio-all" class="bigRadio" name="rcr" value="전체">
          <label>전체</label>

          <input type="radio" class="bigRadio" name="rcr" value="Dog">
          <label>Dog</label>

          <input type="radio" class="bigRadio" name="rcr" value="Cat">
          <label>Cat</label>

        </div>
      </div>

      <div class="serachButton">
        <div class="d-flex justify-content-center">
          <button type="button" class="btn btn-primary" style="background-color: #008080">검색</button>
        </div>
      </div>

      <div class="changeButton">
        <div class="d-flex justify-content-end">
          <button type="button" class="btn btn-primary" style="background-color: #008080">변경</button>
        </div>
      </div>

      <!-- 돌봄예약상태 테이블 -->
      <table class="table">
        <thead bgcolor="#008080" style="color: white;">
          <tr class="tr">
            <th scope="col">no</th>
            <th scope="col">예약번호</th>
            <th scope="col">종류</th>
            <th scope="col">이메일</th>
            <th scope="col">연락처</th>
            <th scope="col">주소</th>
            <th scope="col">시작일</th>
            <th scope="col">종료일</th>
            <th scope="col">결제금액</th>
            <th scope="col">요청일</th>
            <th scope="col">예약상태</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row">1</th>
            <td>섹시</td>
            <td>진건</td>
          </tr>
          <tr>
            <th scope="row">2</th>
            <td>스윗</td>
            <td>진건</td>
          </tr>
          <tr>
            <th scope="row">3</th>
            <td>큐티</td>
            <td>진건</td>
          </tr>
        </tbody>
      </table>
    </div>

  </div>

</body>
<script src="Admin.js"></script>
</html>