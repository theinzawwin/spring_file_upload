<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page isELIgnored="false" %>
    <%@ include file="/WEB-INF/views/common/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
	.error{
		color: red;
		font-size: 18px;
	}
</style>
</head>
<body>
<form:form action="register_student.htm" method="POST" enctype="multipart/form-data" modelAttribute="studentDTO">
Student Name: <form:input path="name" /><form:errors path="name" cssClass="error"></form:errors> <br>
Roll No:<form:input path="rollNo" /><br>
Phone Number: <form:input path="phoneNo" /><br>
Age: <form:input path="age" /><form:errors path="age" cssClass="error"></form:errors><br>
Email: <form:input path="email" /><form:errors path="email" cssClass="error"></form:errors><br>
Profile <form:input type="file" path="file" /><br>
<input type="submit" value="Register" />
</form:form>
</body>
</html>