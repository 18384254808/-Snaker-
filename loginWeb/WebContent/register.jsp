<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="./login.do" method="post">
	账号：<input type="text" name="user">
	密码：<input type="password" name="pwd">
	验证码：<input type="text" name="yzm">
<!-- 	<img src="./image.do" id=yzm onclick="getYzm()"><input type="button" value="刷新" onclick="getYzm()">
 -->	<input type="submit" value="登录">
	<input type="hidden">
</form>
</body>
</html>