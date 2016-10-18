<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- load MUI -->
    <link href="//cdn.muicss.com/mui-0.7.5/css/mui.min.css" rel="stylesheet" type="text/css" />
    <script src="//cdn.muicss.com/mui-0.7.5/js/mui.min.js"></script>
  </head>
  <body style="background-color:grey;">
  
  <div class="mui-appbar">
  	<center><h2>Railway Status page 1</h2></center>
	</div>
    <!-- example content -->
    <div class="mui-container">
      <div class="mui-panel">
       <form method="get" action="Details.jsp">
		  <legend>PNR Status Checker</legend>
		  <div class="mui-textfield">
		    <input type="text" placeholder="PNR Number" name="pnrno">
		  </div>
		  <div class="mui-textfield">
		    <input type="text" placeholder="Mobile Number" name="phone">
		  </div>
		  <button type="submit" class="mui-btn mui-btn--primary mui-btn--raised">Submit</button>
		</form>
      </div>
    </div>
  </body>
</html>
