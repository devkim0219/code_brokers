<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(function() {
	var message = "${msg}";
	var redirectUrl = "${redirectUrl}";
	alert(message);
	document.location.href = redirectUrl;
})	
	
</script>	
</body>
</html>