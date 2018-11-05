<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
out.print("sessionId:"+session.getId());
%>
<br>
<%
Cookie[] cookie=request.getCookies();

out.print("cookie:<br>");
String user="";
String pwd="";
if(cookie!=null){
	for(Cookie c:cookie){
		out.print(c.getName()+"|"+c.getValue());
		if(c.getName().equals("user")){
			 user=c.getValue();
		}
		if(c.getName().equals("pwd")){
			pwd=c.getValue();
		}
	}
}else{
	out.print("第一次请求jsp获取不了 cookie");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="./login.do" method="post">
	账号：<input type="text" name="user" value=<%=user %>><br>
	密码：<input type="password" name="pwd" value=<%=pwd %>><br>
	<input type="submit" value="登录">	
	<a href="register.jsp">立即注册</a>
</form>
</body>
</html>