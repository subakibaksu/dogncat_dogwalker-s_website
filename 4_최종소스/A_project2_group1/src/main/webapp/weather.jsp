<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>weather</title>
	<script src="http://code.jquery.com/jquery-1.7.min.js"></script>	

	<!--font-family-->
		<link href="https://fonts.googleapis.com/css?family=Rufina:400,700" rel="stylesheet" />

		<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet" />

		<!-- favicon img -->
		<link rel="shortcut icon" type="image/icon" href="logo/favicon.png"/>

		<!--font-awesome.min.css-->
		<link rel="stylesheet" href="css/font-awesome.min.css" />

		<!--animate.css-->
		<link rel="stylesheet" href="css/animate.css" />

		<!--hover.css-->
		<link rel="stylesheet" href="css/hover-min.css">

		<!-- range css 필요-->
        <link rel="stylesheet" href="css/jquery-ui.min.css" />

		<!--bootstrap.min.css-->
		<link rel="stylesheet" href="css/bootstrap.min.css" />

		<!-- bootsnav -->
		<link rel="stylesheet" href="css/bootsnav.css"/>

		<!--style.css-->
		<link rel="stylesheet" href="css/style.css" />

		<!--responsive.css-->
		<link rel="stylesheet" href="css/responsive.css" />

		<meta charset="UTF-8">
		
		<link rel="stylesheet" href="css/login.css" />
		<style>
@import url('https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
</style>

<style type="text/css">
#vrListContainer {
	padding-top: 100px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	font-family: 'Noto Sans KR', sans-serif;
	width: 1300px;
	align-content: center;
	align-self: center;
}

h1 {
	font-family: 'jua';
}

th, tr, td {
	padding: 5px;
	min-width: 100px;
}

table{
	border: 1px solid;
	width: 500px;
}

</style>



<!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

    
	function timeConverter(UNIX_timestamp){
		  var a = new Date(UNIX_timestamp * 1000);
		  var months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
		  var month = months[a.getMonth()];
		  var date = a.getDate();
		  var time = date + ' ' + month;
		  return time;
		}

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
          	  let dateform =[];
      function drawChart() {
    	  

    	  
  	  $.getJSON('https://api.openweathermap.org/data/2.5/onecall?lat=37.532600&lon=127.024612&exclude=hourly&appid=07a44d9ab27e682569150705f7962da3&units=metric', 
    				function(data){
  		  
	      //alert(data.current.temp);
			var $Temp = data.current.temp;
			var $maxTemp = data.daily[0].temp.max;
			var $minTemp = data.daily[0].temp.min; 
			var $icon = data.current.weather[0].icon;
			var $now = new Date($.now());
			var $cdate = 	$now.getFullYear() + " / " + 
							($now.getMonth() + 1) + " / " + 
							$now.getDate() + " , " + 
							$now.getHours()+ " : " + 
							$now.getMinutes();
			
			$('h3').prepend($cdate);
			$('.ctemp').append($Temp);
			$('.clowtemp').append($minTemp);
			$('.chightemp').append($maxTemp);
			$('.cicon').append('<img src="http://openweathermap.org/img/wn/' + $icon + '@2x.png" />');
  		  
  		  
    				$.each(data, function(index , obj){
    					dateform.push(obj);
    				});
    				
    		        // Create the data table.
    		        var data = new google.visualization.DataTable();
    		        data.addColumn('string', '날짜');
    		        data.addColumn('number', '최저기온');
    		        data.addColumn('number', '최고기온');
    		        
    		        console.log(dateform[6].length);
    		        
    		        for(var i = 0; i < dateform[6].length ; i++){
    		            data.addRows([
    		                [timeConverter(dateform[6][i].dt), parseInt(dateform[6][i].temp.min), parseInt(dateform[6][i].temp.max)]
    		              ]);
    		        }
    		        
    		        // Set chart options
    		        var options = {
    		    			width : 1200,
    		    			height : 400,
    		        		colors:['#00d8d5','#ffd966']
    		        		};

    		        // Instantiate and draw our chart, passing in some options.
    		        var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
    		        chart.draw(data, options);
    			});
      }
    console.log(dateform);
    </script>
	
</head>


    

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<div id="vrListContainer">
		<h1>오늘의 날씨</h1>
		<h2>Today 날씨 정보</h2>
		<h3 style="color: #00d8d5"></h3>
		<table>
			<tr>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td rowspan="3"><div class="cicon"></div></td>
				<td><div class="ctemp">현재 온도: &nbsp;</div></td>
			</tr>
			<tr>
				<td><div class="clowtemp">최저 온도: &nbsp;</div></td>
			</tr>
			<tr>
				<td><div class="chightemp">최고 온도: &nbsp;</div></td>
			</tr>
		</table>
		<div id="chart_div" style="width: 1300px;"></div>
	</div>
	<!-- vrListContainer -->


</body>
</html>