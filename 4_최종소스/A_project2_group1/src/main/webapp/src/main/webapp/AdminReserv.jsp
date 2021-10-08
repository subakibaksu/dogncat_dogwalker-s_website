<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
    integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
  <link rel="stylesheet" href="Admin.css">
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
</head>
<body>
  <h2>회원관리</h2>

  <div class="search-bar">
    <select className="header__searchSelect">
      <option value="id">id</option>
      <option value="이름">이름</option>
    </select>
    <input type="text" className="header__searchInput" />
    <button>검색</button>
  </div>

  <!-- 회원관리 테이블 -->

  <!-- <input type="checkbox" id="check-all2" class="bigCheck">
  <label for="check-all2">전체선택</label>

  <input type="checkbox" class="bigCheck" name="rcc">
  <label for="check">예약대기</label> -->

  <table class="table" id="memberTable">
    <thead bgcolor="#008080" style="color: white;">
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
        <th scope="col">id</th>
        <th scope="col">이름</th>
        <th scope="col">연락처</th>
        <th scope="col">주소</th>
        <th scope="col">이용건수</th>
        <th scope="col">총 결제금액</th>
      </tr>
    </thead>
    <tbody>

      <tr>

        <th scope="row">

          <div id="checkbox-group">
            <div class="checkbox-group3">
              <div class="memberCheck">
                <input type="checkbox" class="bigCheck" name="mc">
              </div>
            </div>
          </div>
        </th>
        <td>슈퍼울트라하이퍼캡숑섹시</td>
        <td>진건</td>
        <td>010-1234-1234</td>
        <td>서울시 강남구 도곡동</td>
        <td>섹시건</td>
        <td>600억</td>
      </tr>
      <tr>

        <th scope="row">

          <div id="checkbox-group">
            <div class="checkbox-group3">
              <div class="memberCheck">
                <input type="checkbox" class="bigCheck" name="mc">
              </div>
            </div>
          </div>
        </th>
        <td>슈퍼울트라하이퍼캡숑섹시</td>
    </tbody>
  </table>
  <button class="delButton">삭제</button>

</body>

<script src="Admin.js"></script>
</html>