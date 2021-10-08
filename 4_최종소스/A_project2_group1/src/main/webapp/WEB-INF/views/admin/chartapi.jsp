<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-1.7.min.js"></script>

<head>

<!-- META DATA -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->


<link
	href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100,300,400,500,700,900"
	rel="stylesheet" />
	
<style>
@import url('https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
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

<!--차트 css...-->
<link rel="stylesheet" href="css/chartapi.css" />

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">



	google.charts.load('current', {
		packages : [ 'corechart', 'bar' ]
	});
	google.charts.setOnLoadCallback(drawStacked);

	function drawStacked() {
		var data = new google.visualization.DataTable();
		var listed0 = parseInt($('#datalist0').val());
		var listed1 = parseInt($('#datalist1').val());
		var listed2 = parseInt($('#datalist2').val());
		var listed3 = parseInt($('#datalist3').val());
		var listed4 = parseInt($('#datalist4').val());
		var listed5 = parseInt($('#datalist5').val());
		var listed6 = parseInt($('#datalist6').val());
		var listed7 = parseInt($('#datalist7').val());
		var listed8 = parseInt($('#datalist8').val());

		
		
		
		data.addColumn('string', 'Time of Day');
		data.addColumn('number', '산책');
		data.addColumn('number', '방문돌봄(개)');
		data.addColumn('number', '방문돌봄(고양이)');

		data.addRows([
			
			[ '7월' , listed0 , listed3 , listed6 ], 
			[ '8월' , listed1 , listed4 , listed7 ], 
			[ '9월' , listed2 , listed5 , listed8 ]
			
			]);

		var options = {
			width : 1200,
			height : 500,
			isStacked : true,
			colors:['#00d8d5','#ffd966', '#00d8ff'],	//컬러... 순서대로... 
            fontName: 'Noto Sans KR',
            fontSize: 17,
            legend: {position: 'bottom', textStyle: {fontSize: 18}, alignment: 'center' }
		};

		var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
		chart.draw(data, options);
	}
</script>


</head>



<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<br>
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
	
	<c:set var="list" value="${requestScope.list}"></c:set>

	<div id="chart_data">
		<h1>이용 통계</h1>
		<h3>월별 서비스 이용 현황</h3>
			<a href="ReviewBoardList.bd">리뷰게시판</a>
	</div>

	<div id="chart_div"></div>
	
	<c:forEach var="i" begin="0" end="8">
    <input type="hidden" id="datalist${i}" value="${list[i]}">
	</c:forEach>





</body>

</html>