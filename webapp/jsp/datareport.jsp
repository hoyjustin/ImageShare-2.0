<!DOCTYPE html>
<html lang="en">
<%@include file="header.jsp" %>
<%@ page import="imageshare.oraclehandler.OracleHandler"%>
<%
	// check user is admin
	String username = (String) session.getAttribute("user");
	String testtitle = (String) session.getAttribute("testtitle");
	String customjson = (String) session.getAttribute("customjson");
	String error = (String) session.getAttribute("error");

	session.setAttribute("error", null);
	session.setAttribute("customjson", null);
	session.setAttribute("testtitle", null);
%>
<body>
	<%@include file="navbar.jsp" %>

	<div class="jumbotron">
		<div class="container">
			<h1>Data Analysis</h1>
			<p id="titleLeft">ImageShare Data Analytics</p>
		</div>
	</div>

	<% if (error != null) out.println("<tr>" + error + "</tr>"); %>

	<div class="row">
		<div class="col-lg-6 col-lg-offset-3">
			<h4 id="testtitle"><% out.print(testtitle);%></h4>
			<div id="customjsondata">
			</div>
		</div>
	</div>

	<div class="container">
		<hr>
			<%@include file="footer.jsp"%>
	</div>

	<script>
		$('#button-imagespersubject').click(function() {
			document.location.href = './dataanalysis/imagespersubject';
		});


		$(document).ready(function() {
			var customdatajson = jQuery.parseJSON(<% out.print("\'"+customjson+"\'"); %>);
			//var customdatajson =jQuery.parseJSON('{"result":[{"COUNT":"1","MONTH_LIST":[{"WEEK_LIST":[{"WEEK":50,"COUNT":1}],"COUNT":"1","MONTH":"11"}],"YEAR":"1991"},{"COUNT":"1","MONTH_LIST":[{"WEEK_LIST":[{"WEEK":25,"COUNT":1}],"COUNT":"1","MONTH":"05"}],"YEAR":"2007"},{"COUNT":"9","MONTH_LIST":[{"WEEK_LIST":[{"WEEK":41,"COUNT":1}],"COUNT":"1","MONTH":"09"},{"WEEK_LIST":[{"WEEK":46,"COUNT":1}],"COUNT":"1","MONTH":"10"},{"WEEK_LIST":[{"WEEK":51,"COUNT":1},{"WEEK":52,"COUNT":2}],"COUNT":"7","MONTH":"11"}],"YEAR":"2014"}]}');

			var unorderedlist = parseJson(customdatajson.result);

			$('#customjsondata').append(unorderedlist);
			$('#testtitle').val('text');
		});

		function parseJson(jsonList) {
			var data = '';
			
			data += '<ul class="list-group">\n';
			for (var i=0; i<jsonList.length; i++) {
				data += '<li class="list-group-item"> YEAR: '+jsonList[i].YEAR+' - COUNT: '+jsonList[i].COUNT+'</li>\n';
				
				data += '<li data-role="collapsible" class="list-group-item"><ul class="list-group">\n'
				for (var j=0; j<jsonList[i].MONTH_LIST.length; j++) {
					data += '<li class="list-group-item"> MONTH: '+jsonList[i].MONTH_LIST[j].MONTH+' - COUNT: '+jsonList[i].MONTH_LIST[j].COUNT+'</li>\n';
					
					data += '<li data-role="collapsible" class="list-group-item"><ul class="list-group">\n'
					for (var k=0; k<jsonList[i].MONTH_LIST[j].WEEK_LIST.length; k++) {
						data += '<li class="list-group-item"> WEEK: '+jsonList[i].MONTH_LIST[j].WEEK_LIST[k].WEEK+' - COUNT: '+jsonList[i].MONTH_LIST[j].WEEK_LIST[k].COUNT+'</li>\n';
					}
					data += '</ul></li>\n';
				}
				data += '</ul></li>\n';
			}
			data += '</ul>\n';
			/*
			for (var i=0; i<jsonList.length; i++) {
				data += '<tr>';
				
				for (var j=0; j< jsonList[i].length; j++) {
					if (jsonList[i][j].heading == 0) {
						data += '<td>'+jsonList[i][j].data+'</td>';
					}
					else {
						data += '<th>'+jsonList[i][j].data+'</th>';
					}
				}
				
				data += '</tr>\n';
			}
			*/
			return data;
		}
	</script>
</body>