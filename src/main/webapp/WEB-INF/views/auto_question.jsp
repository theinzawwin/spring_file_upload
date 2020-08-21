<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
var i=0;
$(document).ready(function(){

});
function addAns(){
	i++;
	$("#ansList").append('<input type="text" name="answers['+i+'].name" />Is Correct Answer <input type="checkbox" name="answers['+i+'].status" id="ansStatus'+i+'" /><br>');
}
</script>
</head>
<body>
<h3>Question</h3>
Name: <input type="text"/>
<div id="ansList">
Answer List
<input type="text" name="answers[0].name" />Is Correct Answer <input type='checkbox' name="answers[0].status" id="ansStatus0" /><input type="button"  value="+" onclick="addAns()" /><br>
</div>
</body>
</html>