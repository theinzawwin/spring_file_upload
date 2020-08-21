<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page isELIgnored="false" %>
    <%@ include file="/WEB-INF/views/common/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h3>Student List</h3>
<a href="register_student.htm">New Student</a>
<table>
<thead>
	<tr>
	<th>No</th>
	<th>Photo</th>
	<th>Name</th>

	<th>Roll No</th>
	<th>Phone Number</th>
	</tr>
</thead>
<tbody>
	<c:forEach items="${studentList}" var="std" varStatus="row">
	<tr>
		<td>${row.count }</td>
		<td><img src="./images/${std.photoPath}" width="80" height="80" style="border:1px solid red;" /></td>
		<td>${std.name }</td>
		
		<td>${std.rollNo }</td>
		<td>${std.phoneNo }</td>
	</tr>
	</c:forEach>
</tbody>
</table>
</body>
</html>