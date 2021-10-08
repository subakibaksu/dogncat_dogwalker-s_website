<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
<!--Load the AJAX API-->

<!--Load the AJAX API-->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		packages : [ 'corechart', 'bar' ]
	});
	google.charts.setOnLoadCallback(drawStacked);

	function drawStacked() {
		var data = new google.visualization.DataTable();
		data.addColumn('timeofday', 'Time of Day');
		data.addColumn('number', '산책');
		data.addColumn('number', '방문돌봄');

		data.addRows([ [ {
			v : [ 8, 0, 0 ],
			f : '8 am'
		}, 1, .25 ], [ {
			v : [ 9, 0, 0 ],
			f : '9 am'
		}, 2, .5 ], [ {
			v : [ 10, 0, 0 ],
			f : '10 am'
		}, 3, 1 ], [ {
			v : [ 11, 0, 0 ],
			f : '11 am'
		}, 4, 2.25 ], [ {
			v : [ 12, 0, 0 ],
			f : '12 pm'
		}, 5, 2.25 ], [ {
			v : [ 13, 0, 0 ],
			f : '1 pm'
		}, 6, 3 ], [ {
			v : [ 14, 0, 0 ],
			f : '2 pm'
		}, 7, 4 ], [ {
			v : [ 15, 0, 0 ],
			f : '3 pm'
		}, 8, 5.25 ], [ {
			v : [ 16, 0, 0 ],
			f : '4 pm'
		}, 9, 7.5 ], [ {
			v : [ 17, 0, 0 ],
			f : '5 pm'
		}, 10, 10 ], ]);

		var options = {
			width : 1200,
			height : 500,
			isStacked : true,
			hAxis : {
				title : '임시차트... 데이터연결안된상태임',
				format : 'h:mm a',
				viewWindow : {
					min : [ 7, 30, 0 ],
					max : [ 17, 30, 0 ]
				}		
			},
			colors:['#00d8d5','#00d8ff'],	//컬러... 순서대로... 
            fontName: 'Noto Sans KR',
            fontSize: 17
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

	<div id="chart_data">
		<h1>이용 통계</h1>
		<h3>월별 서비스 이용 현황</h3>
			<a href="ReviewBoardList.bd">되냐?</a>
	</div>
	<div id="chart_div"></div>
	






</body>

</html>