<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sys.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
String str="胖子";
pageContext.setAttribute("str", str);
User user=new User(1,"胖子");
request.setAttribute("user", user);
List<User> list=new ArrayList<User>();
list.add(new User(2,"胖子2"));
list.add(new User(3,"胖子3"));
list.add(new User(4,"胖子4"));
list.add(new User(5,"胖子5"));
list.add(new User(6,"胖子6"));
session.setAttribute("userList", list);
Map<String,User> map=new HashMap<String,User>();
map.put("1", new User(1,"胖胖的1"));
map.put("2", new User(2,"胖胖的2"));
map.put("3", new User(3,"胖胖的3"));
session.setAttribute("userMap", map);
%>
</head>
<body>
<P><%=str %></P>
<P>${str}</P>
<p>${user}</p>
<p>${user.id}</p>
<p>${user.name}</p>
<p>${userList[2].name }</p>
<p> df ${userMap.3exception}</p>
<c:forEach items="${userList }" var="lists">
<p>${lists.id }&nbsp;&nbsp;${lists.name}</p>
</c:forEach>
<c:forEach items="${userMap }" var="maps">
<p>${maps.key}&nbsp;&nbsp;${maps.value.id}&nbsp;&nbsp;${maps.value.name}</p>
</c:forEach>
</body>
</html>