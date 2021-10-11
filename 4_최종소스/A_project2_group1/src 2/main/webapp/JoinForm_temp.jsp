<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border: solid 2px black;
	border-collapse: collapse;
}

tr {
	border: solid 1px blue;
	background-color: white;
	color: black;
}

td {
	border: solid 1px red;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		//id="message" 클릭하면 $.ajax 사용해서 
		//url:"LoginIdCheck.me",
		//"true" 사용가능
		//"false" 사용불가 다시입력 ...
		let emailCheck = false;
		console.log("jQuery emailCheck Ready");

		$('#message').click(function() {
			if ($('#email').val() == "") {
				$('#idchecker').text("아이디를 입력해주세요.");
				$('#idchecker').css('color', '#f82a2aa3');
				$('#email').focus();
				emailCheck = false;
				buttonlive();
			} else {
				$.ajax({
					url : "LoginIdCheck.me",
					data : {
						email : $('#email').val()
					},
					dataType : "html",
					success : function(responsedata) {
						$('#idchecker').html(responsedata);
						let data = responsedata.trim();
						if (data == "true") {
							$('#idchecker').text("사용 가능합니다");
							$('#idchecker').css('color', '#199894b3');
							$('#mpwd').focus();
							emailCheck = true;
						} else {
							$('#idchecker').text("이미 사용중인 이메일입니다.");
							$('#idchecker').css('color', '#f82a2aa3');
							$('#email').val("");
							$('#email').focus();
							emailCheck = false;
						}
						buttonlive();
					}
				});
			}
		});

		// 제출버튼 활성화 함수
		function buttonlive() {

			if (emailCheck) {
				$("#checkit").prop("disabled", false);
			} else {
				$("#checkit").prop("disabled", true);
			}
		}

		//jquery 로 간단하게 유효성 check 하기

		$(function() {
			$('#joinForm').submit(function() {
				//alert("가입");
				if ($('#email').val() == "") { // 아이디 검사
					alert('ID를 입력해 주세요.');
					$('#email').focus();
					return false;
				} else if ($('#mpwd').val() == "") { // 비밀번호 검사
					alert('PWD를 입력해 주세요.');
					$('#mpwd').focus();
					return false;
				} else if ($('#mname').val() == "") { // 이름 검사
					alert('name를 입력해 주세요.');
					$('#mname').focus();
					return false;
				} else if ($('#mnic').val() == "") { // 닉네임 검사
					alert('mnic를 입력해 주세요.');
					$('#mnic').focus();
					return false;
				} else if ($('#mphone').val() == "") { // 연락처 검사
					alert('mphone를 입력해 주세요.');
					$('#mphone').focus();
					return false;
				} else if ($('#madd').val() == "") { // 주소 검사
					alert('madd를 입력해 주세요.');
					$('#madd').focus();
					return false;
				}
			});

		});
	});
</script>

</head>
<body>

	<form action="JoinOK.me" method="post" name="joinForm" id="joinForm">
		<h3 style="text-align: center;">회원가입</h3>
		<table
			style="width: 400px; height: 200px; margin-left: auto; margin-right: auto;">
			<tr>
				<th>ID(email):</th>
				<td><input type="text" name="email" id="email"> 
					<input type="button" value="중복체크" id="message"></td>
			</tr>
			<tr>
				<th>중복체크:</th>
				<td colspan="2" id="idchecker">
			</tr>
			<tr>
				<th>PWD:</th>
				<td><input type="password" name="mpwd" id="mpwd"></td>
			</tr>
			<tr>
				<th>Name:</th>
				<td><input type="text" name="mname" id="mname"></td>
			</tr>
			<tr>
				<th>닉네임:</th>
				<td><input type="text" name="mnic" id="mnic"></td>
			</tr>
			<tr>
				<th>휴대전화번호:</th>
				<td><input type="text" name="mphone" id="mphone"></td>
			</tr>

			<!-- 주소 api 사용하기 -->
			<tr>
				<th>주소:</th>
				<td><input type="text" name="madd" id="madd"></td>
			</tr>

			<tr>
				<td colspan="2"><input type="submit" value="회원가입"> <input
					type="reset" value="취소"></td>
			</tr>
		</table>
	</form>

</body>
</html>