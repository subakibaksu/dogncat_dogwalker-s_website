<%@page import="kr.dogcat.dao.MemberDao"%>
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
<title>PhotoGallery List</title>

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

<link rel="stylesheet" href="css/photolist.css" />

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
		
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>

<body>
	<table>
		<tr>
			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		</tr>
		<tr>
			<!-- 로그인 객체 -->
			<c:set var="useremail" value="${sessionScope.loginUser.email}"></c:set>
			
			<!-- 포토갤러리 게시판 리스트 -->
			<c:set var="pagesize" value="${requestScope.pagesize}"></c:set>
			<c:set var="cpage" value="${requestScope.cpage}"></c:set>
			<c:set var="pagecount" value="${requestScope.pagecount}"></c:set>
			<c:set var="list" value="${requestScope.list}"></c:set>
			<c:set var="totalboardcount" value="${requestScope.totalboardcount}"></c:set>
			<c:set var="pager" value="${requestScope.pager}"></c:set>
			
			<div id="reveiwBoardListContainer">
				<h1 id="head">Photo Gallery</h1>
				
				<!-- 검색 -->
				<div class="container">
				<form name="search" action = "PboardList.pg" method="get">
					<fieldset>
						<input type = "text" id="keyword" class="searchbar" name="keyword" placeholder="키워드를 입력하세요"/>
						&nbsp&nbsp&nbsp&nbsp<input type = "submit" class="btn" value = "검색">
					</fieldset>
				</form>
				</div>
				
				<!-- 포토갤러리 리스트 -->
				<table>
				<form name="heart" action="giveHeart.pg" method="get">
				<c:forEach var="row" begin="0" end="${(fn:length(list) + 2) / 3 - 1}">
					<tr>
						<c:forEach begin="0" end="2" var="col">
							<c:set var="item" value="${list[row*3+col]}" />
							<td ><a href="PboardContent.pg?pbnum=${item.pbnum}&cp=${cpage}&ps=${pagesize}">
								<img alt="" src="upload/${item.pfilename}" style="width: 200px; height: 150px"><br>
							${item.pbsubj}<br>
							${item.mnic}</a></td>
							<td style="cursor: pointer;" onclick="heartchk(${item.pbnum})" id="heart_val_${item.pbnum}">
							<c:if test="${item.gubun == 'Y'}">♥</c:if>
							<c:if test="${item.gubun == 'N'}">♡</c:if>
							${item.heart} 
							</td>
						</c:forEach>
					</tr>
					</c:forEach>
					<tr>
						<td colspan="3" align="center">
						<!--  
						원칙적인 방법 아래 처럼 구현
						[1][2][3][다음]
						[이전][4][5][6][다음]
						[이전][7][8][9][다음]
						[이전][10][11]
						
						현재 아래 코드 [][][][][][][]...
						-->
						
							<!--이전 링크 --> 
							<c:if test="${cpage > 1}">
								<a href="PboardList.pg?cp=${cpage-1}&ps=${pagesize}">이전</a>
							</c:if>
							<!-- page 목록 나열하기 -->
							<c:forEach var="i" begin="1" end="${pagecount}" step="1">
								<c:choose>
									<c:when test="${cpage==i}">
											<font color="red" >[${i}]</font>
									</c:when>
									<c:otherwise>
										<a href="PboardList.pg?cp=${i}&ps=${pagesize}">[${i}]</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<!--다음 링크 --> 
							<c:if test="${cpage < pagecount}">
								<a href="PboardList.pg?cp=${cpage+1}&ps=${pagesize}">다음</a>
							</c:if>
						</td>
						<td colspan="2" align="center"><b>총 게시물 수 : </b>${totalboardcount} <br>
						</td>
					</tr>
							
					<tr>
						<td colspan="5" align="right">
						<button><a id="writingbtn" href="PboardWrite.pg">글쓰기</a></button>
						</td>
					</tr>
				</form>
				</table>
			</div>
		</tr>
	</table>
	
	<script type="text/javascript">
	<!-- 좋아요 기능 -->
	function heartchk(pbnum) {
		if("${useremail}" == ""||"${useremail}" == null){
			alert("로그인해야 하트줄수 있어요~")
			return false;
		}
		var frm = document.reply;

// 		alert(frm.useremail.value);
		
        $.ajax({
			url : "giveHeart.do",
			type : 'GET',
			datatype : "json",
			data : {
				"rec_email" : "${useremail}",
				"board_num" : pbnum
			},

            success:function(data) {
            	console.log(data);
            	
            	var arr = data.split(",");
            	console.log(arr);
            	var hshape = "";
            	if(arr[1] == 'Y'){
            		alert("싫어요?ㅜ");
            		hshape = "♡";
            	}else{
            		alert("좋아요~!");
            		hshape = "♥";
            	}
            	$("#heart_val_"+pbnum).text(hshape + arr[0]);
                
            },
            error : function() {
				alert('좋아요 실패');
			}
        });
    }
	</script>
	

</body>
</html>