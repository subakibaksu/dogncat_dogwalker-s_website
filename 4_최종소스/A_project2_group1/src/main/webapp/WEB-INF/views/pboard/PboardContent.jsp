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
<!-- <link rel="stylesheet" href="css/reviewboard.css" />
 -->
<link rel="stylesheet" href="css/photostyle.css?ver=1" />

<style>
body {
	display: flex;
	flex-direction: row;
	justify-content: center;

}

h1{
	display: flex;
	flex-direction: row;
	justify-content: center;
	padding-top: 150px;
}

#tablesize {
	width: 800px;
    margin-left: auto;
    margin-right: auto;
}

th {
	text-align: center;
}

#text-container {
	margin: 5px;
	width: 800px;
	height: 100px;
	border-radius: 15px;
	
}

#btn {
	margin-right: 5px;
	margin-bottom: 5px;
}

table{
	border-collapse: separate;
  	border-spacing: 10px 10px;
  	border: 1px solid lightgray;
  	
}

#tableh {
	border-bottom: 1px dotted #00d8d5;
	border-right: none;
	border-left: none;
	border-top: none;
	border-radius: 0px;
	color: black;
	
}

#tableh1 {
	border-right: none;
	border-left: none;
	border-top: none;
	border-bottom: none;
}

.textar {
	width: 100%;
	height: 100px;
	padding: 5px;
	margin: 5px;
}



#tablehreply {
	border: 1px solid #00d8d5;
	border-radius: 5px;
}
</style>


</head>
<body>
	
	
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>


	<!-- ???????????? ?????? ?????? ???????????? -->
	<c:set var="usernic" value="${loginUser.mnic}" />
	<c:set var="usermail" value="${loginUser.email}" />

	<!-- ????????? ????????? ?????? ---------->
	<c:set var="pbnum" value="${requestScope.pbnum}"></c:set>
	<c:set var="pboard" value="${requestScope.pboard}"></c:set>
	<c:set var="cpage" value="${requestScope.cpage}"></c:set>
	<c:set var="pagesize" value="${requestScope.pagesize}"></c:set>

	<c:set var="replylist" value="${requestScope.replylist}"></c:set>

	<div id="reveiwBoardListContainer">
		<h1>???????????????</h1>
		<table id="tablesize" border="1">
			<tr>
				<td id="tableh1" width="10%" align="center"><b>?????????</b></td><br><br>
				<td id="tableh" width="35%">${pbnum}</td>
				<td id="tableh1" width="10%" align="center">??? ${pboard.heart}</td>
				<td id="tableh" width="40%" align="center"></td>
			</tr>
			<tr>
				<td id="tableh1" width="10%" align="center"><b>?????????</b></td>
				<td id="tableh" width="20%">${pboard.mnic}</td>
				<td id="tableh1" width="10%" align="center"><b>?????????</b></td>
				<td id="tableh" width="20%">${pboard.email}</td>
			</tr>
			<!-- ???????????? <file> -->
			<tr>
				<td id="tableh1" width="10%" align="center"><b>?????????</b></td>
				<td id="tableh">
				<img alt="" src="upload/${pboard.pfilename}" style="width: 200px; height: 150px">
				</td>
				
					<c:set var="originalfilename" value="${pboard.pfilename}" /></td>
					<c:set var="lowerfilename"  value="${fn:toLowerCase(originalfilename)}" /> 
					
					<c:forTokens var="file" items="${lowerfilename}" delims="." varStatus="status">
						<c:if test="${status.last}">
							<a href="upload/${originalfilename}" target="_blank">????????????</a>
						</c:if>
					</c:forTokens>
				<!-- ???????????? <file> -->
			</tr>
			<tr>
				<td id="tableh1" width="10%" align="center"><b>??????</b></td>
				<td id="tableh" colspan="3">${pboard.pbsubj}</td>
			</tr>
			<tr>
					<td id="tableh1" colspan="4" align="left"><b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp?????????</b></td>
			</tr>
			
			<tr height="100">
<!-- 				<td id="tableh" width="10%" align="center"><b>?????????</b></td>
 -->				<td id="tableh1" colspan="4">${fn:replace(pboard.pbcont, newLineChar,"<br>")}</td>

			</tr>
			
			
			<tr>
				<c:choose>
					<c:when test="${usermail=='admin@dogcat@com' || usermail==pboard.email}">
						<td id="tableh1" colspan="4" align="right"><a
							href="PboardList.pg?cp=${cpage}&ps=${pagesize}">????????????</a> | 
							<a href="PboardEdit.pg?pbnum=${pbnum}&cp=${cpage}&ps=${pagesize}">??????</a>
							| <a
							href="PboardDelete.pg?pbnum=${pbnum}&cp=${cpage}&ps=${pagesize}">??????</a>
							|</td>
					</c:when>
					<c:otherwise>
						<td id="tableh1" colspan="4" align="center"><a
							href="PboardList.pg?cp=${cpage}&ps=${pagesize}">????????????</a></td>
					</c:otherwise>
				</c:choose>

			</tr>
		</table>
		

		<!--  ????????? ?????? ????????? -->
		<form name="reply" action="PboardReply.pg" method="POST">
			<!-- hidden ??????  ?????? ????????? ??????  -->
			<input type="hidden" name="pbnum" value="${pbnum}"> 
			<input type="hidden" name="email" value="${loginUser.email}">
			<!-- hidden data -->
			<br>
			<table width="100%" border="1">
				<tr></tr>
				<tr>
					<td id="tableh1" colspan="2" align="left">?????? ??????</td>
				</tr>
				<c:choose>
					<c:when	test="${usermail==null}">
						<td align="center">
							<a href="/LoginOK.me">?????????</a>?????? ?????? ??????</td>
					</c:when>
					<c:otherwise>
						<tr >
							<td  align="right" id="tableh1">
							<input type="hidden" name="mnic" value="${usernic}"> 
							<textarea  class="textar" id="tablehreply" id="text-container" name="mmcont" rows="2" cols="50" placeholder="&nbsp&nbsp&nbsp&nbsp&nbsp????????? ??????????????????."></textarea>
							????????? : ${usernic} &nbsp&nbsp&nbsp <input id="btn" type="button" value="??????"
								onclick="reply_check()">
							</td>
							
						</tr>
					</c:otherwise>
				</c:choose>
				
				

			</table>
		</form>

		<br>
		<!-- ????????? ?????? ????????? -->
		<c:if test="${not empty replylist}">
			<c:forEach var="reply" items="${replylist}">
				<table width="80%" border="1">
					<tr>
						<th colspan="2">??????</th>
					</tr>
					<tr align="left">
						<td width="80%">[${reply.mnic}] : ${reply.mmcont} <br>
							?????????:${reply.mmdate}
						</td>
						<td width="20%">
							<form action="PboardReplyDelete.pg" method="POST" name="replyDel">
								<input type="hidden" name="replyemail" value="${reply.email}">
								<input type="hidden" name="memonum" value="${reply.memonum}">
								<input type="hidden" name="pbnum" value="${reply.pbnum_fk}">
								
								<!-- ?????? ???????????? ?????? ????????? ???????????? ???????????? ?????? ?????? ????????? -->
								<c:if test = "${loginUser.email == reply.email}">
								<input type="button" value="??????" onclick="reply_del(this.form)">
								</c:if>
							</form>
						</td>
					</tr>
				</table>
			</c:forEach>
		</c:if>

	</div>

</body>
<!-- ????????? ??????	 -->
<script type="text/javascript">
	function reply_check() {
		var frm = document.reply;
		
		if (frm.mmcont.value == "") {
			alert("?????? ????????? ??????????????????.");
			return false;
		}else{
			frm.submit();
		}
	}
	
	function reply_del(frm) {
		if (!(frm.replyemail.value == frm.useremail.value)) {
			alert("???????????? ?????? ??????");
			return false;
		}else{
			frm.submit();
		}
	}

</script>
</html>