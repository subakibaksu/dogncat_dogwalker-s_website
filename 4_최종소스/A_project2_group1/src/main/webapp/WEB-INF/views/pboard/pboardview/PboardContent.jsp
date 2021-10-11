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
<title>PhotoGallery Content</title>

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

<!--reviewboard.css-->
<link rel="stylesheet" href="css/reviewboard.css" />

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>


	<!-- 로그인한 유저 정보 가져오기 -->
	<c:set var="usernic" value="${loginUser.mnic}" />
	<c:set var="usermail" value="${loginUser.email}" />

	<!-- 게시판 글내용 시작 ---------->
	<c:set var="pbnum" value="${requestScope.pbnum}"></c:set>
	<c:set var="pboard" value="${requestScope.pboard}"></c:set>
	<c:set var="cpage" value="${requestScope.cpage}"></c:set>
	<c:set var="pagesize" value="${requestScope.pagesize}"></c:set>

	<c:set var="replylist" value="${requestScope.replylist}"></c:set>

	<div id="reveiwBoardListContainer">
		<h1>글보기</h1>
		<table border="1">
			<tr>
				<td width="10%" align="center">글번호</td>
				<td width="20%">${pbnum}</td>
				<td width="30%" align="center">♥ ${pboard.heart}</td>
			</tr>
			<tr>
				<td width="10%" align="center">글쓴이</td>
				<td width="20%">${pboard.mnic}</td>
				<td width="10%" align="center">이메일</td>
				<td width="20%">${pboard.email}</td>
			</tr>
			<!-- 첨부파일 <file> -->
			<tr>
				<td width="10%" align="center"><b>이미지</b></td>
				<td><c:set var="originalfilename" value="${pboard.pfilename}" />
					<c:set var="lowerfilename"
						value="${fn:toLowerCase(originalfilename)}" /> <c:forTokens
						var="file" items="${lowerfilename}" delims="." varStatus="status">
						<c:if test="${status.last}">
							<a href="upload/${originalfilename}" target="_blank">미리보기</a>
						</c:if>
					</c:forTokens></td>
				<!-- 첨부파일 <file> -->
			</tr>
			<tr>
				<td width="10%" align="center"><b>제목</b></td>
				<td colspan="3">${pboard.pbsubj}</td>
			</tr>
			<tr height="100">
				<td width="10%" align="center"><b>글내용</b></td>
				<td colspan="3">${fn:replace(pboard.pbcont, newLineChar,"<br>")}</td>
			</tr>
			<tr>
				<c:choose>
					<c:when
						test="${usermail=='admin@dogcat@com' || usermail==pboard.email}">
						<td colspan="4" align="center"><a
							href="PboardList.pg?cp=${cpage}&ps=${pagesize}">목록가기</a> | <a
							href="PboardEdit.pg?pbnum=${pbnum}&cp=${cpage}&ps=${pagesize}">편집</a>
							| <a
							href="PboardDelete.pg?pbnum=${pbnum}&cp=${cpage}&ps=${pagesize}">삭제</a>
							|</td>
					</c:when>
					<c:otherwise>
						<td colspan="2" align="center"><a
							href="PboardList.pg?cp=${cpage}&ps=${pagesize}">목록가기</a> |</td>
					</c:otherwise>
				</c:choose>

			</tr>
		</table>

		<!--  꼬리글 달기 테이블 -->
		<form name="reply" action="PboardReply.pg" method="POST">
			<!-- hidden 태그  값을 숨겨서 처리  -->
			<input type="hidden" name="pbnum" value="${pbnum}"> 
			<input type="hidden" name="email" value="${loginUser.email}">
			<!-- hidden data -->
			<table width="80%" border="1">
				<tr>
					<th colspan="2">덧글 쓰기</th>
				</tr>
				<c:choose>
					<c:when	test="${usermail==null}">
						<td align="center">
							<a href="Login_temp.jsp">로그인</a>해야 등록 가능</td>
					</c:when>
					<c:otherwise>
						<tr>
							<td align="left">작성자 : ${usernic} 
							<input type="hidden" name="mnic" value="${usernic}"> 
							<textarea name="mmcont" rows="2" cols="50"></textarea>
							</td>
							<td align="left"><input type="button" value="등록"
								onclick="reply_check()"></td>
						</tr>
					</c:otherwise>
				</c:choose>
				
				

			</table>
		</form>

		<br>
		<!-- 꼬리글 목록 테이블 -->
		<c:if test="${not empty replylist}">
			<c:forEach var="reply" items="${replylist}">
				<table width="80%" border="1">
					<tr>
						<th colspan="2">답변</th>
					</tr>
					<tr align="left">
						<td width="80%">[${reply.mnic}] : ${reply.mmcont} <br>
							작성일:${reply.mmdate}
						</td>
						<td width="20%">
							<form action="PboardReplyDelete.pg" method="POST" name="replyDel">
								<input type="hidden" name="replyemail" value="${reply.email}">
								<input type="hidden" name="useremail" value="${loginUser.email}">
								<input type="hidden" name="memonum" value="${reply.memonum}">
								<input type="hidden" name="pbnum" value="${reply.pbnum_fk}">
								<input type="button" value="삭제" onclick="reply_del(this.form)">
							</form>
						</td>
					</tr>
				</table>
			</c:forEach>
		</c:if>

	</div>

</body>
<!-- 유효성 체크	 -->
<script type="text/javascript">
	function reply_check() {
		var frm = document.reply;
		
		if (frm.mmcont.value == "") {
			alert("리플 내용을 입력해주세요.");
			return false;
		}else{
			frm.submit();
		}
	}
	
	function reply_del(frm) {
		if (!(frm.replyemail.value == frm.useremail.value)) {
			alert("글쓴이만 삭제 가능");
			return false;
		}else{
			frm.submit();
		}
	}

</script>
</html>