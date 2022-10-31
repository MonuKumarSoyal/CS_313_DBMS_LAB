<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add an Issue</title>
</head>
<body>
<h1>Add an Issue </h1>
<form action="IssueServlet" method="post">
			<table style="with: 50%">
				<tr>
					<td>Enter Student Id</td>
					<td><input type="text" name="stu_id" /></td>
				</tr>
				<tr>
					<td>Enter Book Id</td>
					<td><input type="text" name="bk_id" /></td>
				</tr>
				<tr>
					<td>Enter Issue Date</td>
					<td><input type="text" name="issu_d" /></td>
				</tr>

			</table>
			<input type="submit" value="Submit" /></form>
</body>
</html>