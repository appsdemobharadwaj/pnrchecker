<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,com.jaunt.*"%>
<%
	String pnrno = request.getParameter("pnrno");
	String Url = "http://api.railwayapi.com/pnr_status/pnr/" + pnrno + "/apikey/swpyn3074/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- load MUI -->
<link href="//cdn.muicss.com/mui-0.7.5/css/mui.min.css" rel="stylesheet"
	type="text/css" />
<script src="//cdn.muicss.com/mui-0.7.5/js/mui.min.js"></script>
</head>
<body>

	<%
		HashMap<String, String> detailsHM = new HashMap<String, String>();

		JNode booking_status_a = null, current_status_a = null, no_a = null;

		try {

			UserAgent userAgent = new UserAgent();
			userAgent.sendGET(Url);
			//  System.out.println(userAgent.json);

			/* 	  <th>PNR Number</th>
			      <th>Train Name</th>
			      <th>Train Number</th>
			      <th>From Station</th>
			      <th>To Station</th>
			      <th>Date of Jounery</th>
			       <th>Class</th>
			      <th>Chart Prepared</th>
			      <th>Total Passengers</th> */

			JNode pnr = userAgent.json.findFirst("pnr");
			detailsHM.put("pnr", pnr.toString());

			JNode train_name = userAgent.json.findFirst("train_name");
			detailsHM.put("train_name", train_name.toString());

			JNode train_num = userAgent.json.findFirst("train_num");
			detailsHM.put("train_num", train_num.toString());

			JNode from_station = userAgent.json.findFirst("from_station").findFirst("name");
			detailsHM.put("from_station", from_station.toString());

			JNode to_station = userAgent.json.findFirst("to_station").findFirst("name");
			detailsHM.put("to_station", to_station.toString());

			JNode doj = userAgent.json.findFirst("doj");
			detailsHM.put("doj", doj.toString());

			JNode travel_lass = userAgent.json.findFirst("class");
			detailsHM.put("class", travel_lass.toString());

			JNode chart_prepared = userAgent.json.findFirst("chart_prepared");
			detailsHM.put("chart_prepared", chart_prepared.toString());

			JNode total_passengers = userAgent.json.findFirst("total_passengers");
			detailsHM.put("total_passengers", total_passengers.toString());

			no_a = userAgent.json.findFirst("passengers").findEvery("no");

			current_status_a = userAgent.json.findFirst("passengers").findEvery("current_status");

			booking_status_a = userAgent.json.findFirst("passengers").findEvery("booking_status");

		} catch (JauntException e) {
			System.err.println(e);
		}
	%>


	<div class="mui-appbar">
		<center>
			<h2>Railway Status</h2>
		</center>
	</div>
	<!-- example content -->
	<div class="mui-container">
		<div class="mui-panel">
			<table class="mui-table mui-table--bordered">
				<thead>
					<tr>
						<th>PNR Number</th>
						<th>Train Name</th>
						<th>Train Number</th>
						<th>From Station</th>
						<th>To Station</th>
						<th>Date of Jounery</th>
						<th>Class</th>
						<th>Chart Prepared</th>
						<th>Total Passengers</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<%
								out.print(detailsHM.get("pnr"));
							%>
						</td>
						<td>
							<%
								out.print(detailsHM.get("train_name"));
							%>
						</td>
						<td>
							<%
								out.print(detailsHM.get("train_num"));
							%>
						</td>
						<td>
							<%
								out.print(detailsHM.get("from_station"));
							%>
						</td>
						<td>
							<%
								out.print(detailsHM.get("to_station"));
							%>
						</td>
						<td>
							<%
								out.print(detailsHM.get("doj"));
							%>
						</td>
						<td>
							<%
								out.print(detailsHM.get("class"));
							%>
						</td>
						<td>
							<%
								out.print(detailsHM.get("chart_prepared"));
							%>
						</td>
						<td>
							<%
								out.print(detailsHM.get("total_passengers"));
							%>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="mui-panel">
			<table class="mui-table mui-table--bordered">
				<thead>
					<tr>
						<th>Passenger No</th>
						<th>Current Status</th>
						<th>Booking Status</th>
					</tr>
				</thead>
				<tbody>
					
					<%
						for (int x = 0; x < no_a.size(); x++) {
					%>
					<tr>

						<td><%=no_a.get(x)%></td>
						<td><%=current_status_a.get(x)%></td>
						<td><%=booking_status_a.get(x)%></td>

					</tr>
					<%}%>
					
				</tbody>
			</table>
			
			<%
				out.print(detailsHM.get("<a href='http://bharadwaj-sms-api.au-syd.mybluemix.net/sendsms.php?uid=8179804330&pwd=demo123&phone="+request.getParameter("phone")+"&msg=PNR Number is: "+detailsHM.get("pnr")+" From: ")+detailsHM.get("from_station")+" To: "+detailsHM.get("to_station") +" Chart Prepared: "+detailsHM.get("chart_prepared")+"'>Get SMS</a>" );
			%>
		</div>
	</div>
</body>
</html>