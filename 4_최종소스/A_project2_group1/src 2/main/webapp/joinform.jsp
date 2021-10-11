<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>sign up</title>
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

<!--datepicker.css-->
<link rel="stylesheet" href="css/datepicker.css">

<!--owl.carousel.css-->
<link rel="stylesheet" href="css/owl.carousel.min.css">
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

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

<!-- 우편번호 검색 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="//code.jquery.com/jquery-3.1.1.min.js"></script>

<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
		
//우편번호 검색 팝업

function openAddrPop() {

new daum.Postcode({

oncomplete: function(data) {

// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

// 각 주소의 노출 규칙에 따라 주소를 조합한다.

// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.

var fullAddr = ''; // 최종 주소 변수

var extraAddr = ''; // 조합형 주소 변수

// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.

if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우

fullAddr = data.roadAddress;

} else { // 사용자가 지번 주소를 선택했을 경우(J)

fullAddr = data.jibunAddress;

}

// 사용자가 선택한 주소가 도로명 타입일때 조합한다.

if (data.userSelectedType === 'R') {

//법정동명이 있을 경우 추가한다.

if (data.bname !== '') {

extraAddr += data.bname;

}

// 건물명이 있을 경우 추가한다.

if (data.buildingName !== '') {

extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);

}

// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.

fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');

}

// 우편번호와 주소 정보를 해당 필드에 넣는다.

$("#postCd").prop('value', data.zonecode); //5자리 새우편번호 사용

$("#address1").prop('value', fullAddr);

// 상세주소 필드 비우고 해당 필드로 이동한다.

$("#address2").prop('value','').focus();

}

}).open();

} 
		</script>



<style>
body {
	font-size: 11pt;
	min-width: 800px;
}

table {
	border-spacing: 20px;
	border-collapse: separate;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
	border: 2px solid #00d8ff;
	border-radius: 15px;
	padding: 0 60px 0 60px;
}

#joinhere {
	text-align: center;
	padding-top: 100px;
}

td, th {
	display: flex;
	padding-bottom: 5px;
}
</style>

<script language="javascript"
	src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>



<script>
	$(document)
			.ready(
					function() {
						let idcheck = false;
						let namecheck = false;
						let phonecheck = false;
						let niccheck = false;
						let pwcheck = false;
						let pwchcheck = false;
						let add1check = false;

						// 제출버튼 활성화 함수
						function buttonlive() {

							if (idcheck && namecheck && pwcheck && pwchcheck
									&& phonecheck && niccheck 
									&& add1check ) {
								$("#checkit").prop("disabled", false);
							} else {
								$("#checkit").prop("disabled", true);
							}
						}
	
						
						
						//이메일 ID 췍
						$('#message').click(function(){
							const regxEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; //문자 + @ + 문자.문자
							if($('#email').val() == ""){
								$('#idchecker').text("아이디를 입력해주세요.");
								$('#idchecker').css('color', '#f82a2aa3');
								$('#email').focus();
								idcheck = false;
								buttonlive();
							} else if (regxEmail.test($('#email').val()) != true) {
								$('#idchecker').text("올바른 양식으로 입력해주세요.");
								$('#idchecker').css('color', '#f82a2aa3');
								idcheck = false;
							}else{
							   $.ajax(
								 {
									url:"LoginIdCheck.me",
									data:{email:$('#email').val()},
									dataType:"html",
									success:function(responsedata){
										$('#idchecker').html(responsedata);
										let data =responsedata.trim();
										 if(data == "true"){
											   $('#idchecker').text("사용가능한 아이디입니다.");
											   $('#idchecker').css('color', '#199894b3');
											   $('#email').focus();
											   idcheck = true;
										 }else{
											   $('#idchecker').text("사용중인 아이디입니다.");
											   $('#idchecker').css('color', '#f82a2aa3');
											   $('#email').val("");
											   $('#email').focus();
											   idcheck = false;
										  }
										   buttonlive();
									}
								 }	  
							  );
							}
						});
						
						

						// 이름
						$('#userName').keyup(function() {
							var getCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);
							if ($('#userName').val() == "") {
								$('.tdname').text("이름을 입력해주세요.");
								$('.tdname').css('color', '#f82a2aa3');
								namecheck = false;
							} else {
								$('.tdname').text("√ checked");
								$('.tdname').css('color', '#199894b3');
								namecheck = true;
							}
							buttonlive();
						});
						
						

						// 핸드폰
						$("#userPhone")
								.on(
										"keyup",
										function() {
											const regxPhone = /^(010[1-9][0-9]{7})$/
											// 010으로 시작, 중간번호의 첫 숫자는 0 제외, 총 11자리 숫자
											if ($('#userPhone').val() == "") {
												$(".tdphone").text(
														"휴대폰 번호를 입력해주세요.");
												$(".tdphone").css('color',
														'#f82a2aa3');
												phonecheck = false;
											} else if (regxPhone.test($(
													'#userPhone').val()) != true) {
												$(".tdphone").text(
														"올바른 양식으로 입력해주세요.");
												$(".tdphone").css('color',
														'#f82a2aa3');
												phonecheck = false;
											} else {
												$(".tdphone").text("√ checked");
												$(".tdphone").css('color',
														'#199894b3');
												phonecheck = true;
											}
											buttonlive();
										});

						
						//닉네임 체크
						$('#messagenic').click(function(){
							if($('#mnic').val() == ""){
								$('.nnamecheck').text("닉네임을 입력해주세요.");
								$('.nnamecheck').css('color', '#f82a2aa3');
								$('#email').focus();
								niccheck = false;
								buttonlive();
							} else{
							   $.ajax(
								 {
									url:"LoginNickCheck.me",
									data:{email:$('#mnic').val()},
									dataType:"html",
									success:function(responsedata){
										$('.nnamecheck').html(responsedata);
										let data =responsedata.trim();
										 if(data == "true"){
											   $('.nnamecheck').text("√ checked");
											   $('.nnamecheck').css('color', '#199894b3');
											   niccheck = true;
										 }else{
											   $('.nnamecheck').text("사용중인 아이디입니다.");
											   $('.nnamecheck').css('color', '#f82a2aa3');
											   $('#mnic').val("");
											   $('#mnic').focus();
											   niccheck = false;
										  }
										   buttonlive();
									}
								 }	  
							  );
							}
						});
						

						// 비밀번호
						$("#userPass")
								.keyup(
										function() {
											const userPass = $("#userPass")
													.val();
											const regxpwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{8,16}$/;
											const pwdTest = regxpwd
													.test(userPass); //true / false 반환

											//빈칸일 경우 

											if ($("#userPass").val() == "") {
												$('.tdpw')
														.text("패스워드를 입력해주세요.");
												$('.tdpw').css('color',
														'#f82a2aa3');
												pwcheck = false;
											} else if (!pwdTest) { //false면
												$('.tdpw')
														.text(
																"8~16자리의 영문+숫자+특수문자로 입력하세요.");
												$('.tdpw').css('color',
														'#f82a2aa3');
												pwcheck = false;
											} else {
												$('.tdpw').text('√ checked');
												$('.tdpw').css('color',
														'#199894b3');
												pwcheck = true;
											}
											buttonlive();

										});

						// 비밀번호체크
						$('#userPassCheck').keyup(
								function() {
									if ($('#userPass').val() != $(
											'#userPassCheck').val()) {
										$('.tdpwch').text('비밀번호가 일치하지 않습니다.');
										$('.tdpwch').css('color', '#f82a2aa3');
										pwchcheck = false;
									} else {
										$('.tdpwch').text('√ checked');
										$('.tdpwch').css('color', '#199894b3');
										pwchcheck = true;
									}
									buttonlive();
								});

						

						

						// 주소1
						$('#madd').keyup(function() {
							if ($('#address1').val() == "") {
								$('.tdaddr1').text("도로명 주소를 입력해주세요.");
								$('.tdaddr1').css('color', '#f82a2aa3');
								add1check = false;
							} else {
								$('.tdaddr1').text("√ checked");
								$('.tdaddr1').css('color', '#199894b3');
								add1check = true;
							}
							buttonlive();
						});


					});

	function checkz() {
		if (idcheck && namecheck && pwcheck && pwchcheck
				&& phonecheck && niccheck
				&& add1check) {
			return true;
		} else {
			return false;
		}
	}
</script>


</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>



	<form onsubmit="return checkz()" name="signForm" id="signForm"
		method="post" action="JoinOK.me">
		<table>
			<!-- <tr>
				<th colspan="2" class="title">회원가입</th>
			</tr> -->
			<h1></h1>
			<h1 id="joinhere">회원가입</h1>

			<tr>
				<th>ID(이메일):</th>
				<td><input type="text" style="width: 90%;" maxlength="20"
					placeholder="  이메일을 입력하세요." name="email" id="email">&nbsp&nbsp
					<input type="button" value="ID확인" id="message"></td>
				<td id="idchecker"></td>
			</tr>

			<tr>
				<th>이름 *</th>
				<td><input type="text" style="width: 100%;" maxlength="20"
					id="userName" name="mname" placeholder="  이름을 입력하세요."></td>
				<td class="tdname"></td>
			</tr>
			<tr>
				<th>핸드폰번호 *</th>
				<td><input type="text" style="width: 100%;" size="30"
					maxlength="11" id="userPhone" name="mphone"
					placeholder="  휴대폰번호를 '-'없이 입력하세요"></td>
				<td class="tdphone"></td>
			</tr>
			<tr>
				<th>닉네임 *</th>
				<td><input type="text" style="width: 100%;" maxlength="20"
					id="mnic" name="mnic" placeholder="  닉네임을 입력하세요.">&nbsp&nbsp
					<input type="button" value="닉네임 확인" id="messagenic"></td>
				<td class="nnamecheck"></td>
			</tr>
			<tr>
				<th>비밀번호 *</th>
				<td><input type="password" style="width: 100%;" maxlength="20"
					id="userPass" placeholder="  8~16자리의 영문+숫자+특수문자로 입력하세요"></td>
				<td class="tdpw"></td>
			</tr>
			<tr>
				<th>비밀번호 확인 *</th>
				<td><input type="password" style="width: 100%;" maxlength="20"
					id="userPassCheck" name="mpwd" placeholder="  패스워드를 재입력하세요">
					<font id="chkNotice" size="2"></font></td>
				<td class="tdpwch"></td>
			</tr>
			<tr>
				<th>우편번호 *</th>

				<td><input type="text" name="madd1" id="postCd" size="9"
					maxlength="10" readonly="readonly" /> <a class="btn1"
					id="addrPopBtn" style="line-height: 25px;"
					href="javascript:openAddrPop();">&nbsp&nbsp검색</a></td>
				<td class="tdzip"></td>

			</tr>
			<tr>
				<th>주소 *</th>
				<td><input type="text" name="madd2" id="address1" style="width: 90%;" readonly="readonly" /> 
					<input type="text" name="madd3" id="madd" style="width: 90%;" placeholder="상세주소를 입력해주세요." />
				</td>
				<td class="tdaddr1"></td>
			</tr>

			<tr>
				<td colspan="2">
				<input type="submit" id="checkit" value="가입완료" disabled="disabled"> &nbsp&nbsp 
				<input type="reset" value="입력취소">
				</td>
			</tr>
		</table>
	</form>








	<script src="js/jquery.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->

	<!--modernizr.min.js-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>


	<!--bootstrap.min.js-->
	<script src="js/bootstrap.min.js"></script>

	<!-- bootsnav js -->
	<script src="js/bootsnav.js"></script>

	<!-- jquery.filterizr.min.js -->
	<script src="js/jquery.filterizr.min.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>

	<!--jquery-ui.min.js-->
	<script src="js/jquery-ui.min.js"></script>

	<!-- counter js -->
	<script src="js/jquery.counterup.min.js"></script>
	<script src="js/waypoints.min.js"></script>

	<!--owl.carousel.js-->
	<script src="js/owl.carousel.min.js"></script>

	<!-- jquery.sticky.js -->
	<script src="js/jquery.sticky.js"></script>

	<!--datepicker.js-->
	<script src="js/datepicker.js"></script>

	<!--Custom JS-->
	<script src="js/custom.js"></script>

</body>
</html>