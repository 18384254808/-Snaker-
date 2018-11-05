<%@page import="com.sys.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:set var="name" value="胖子" ></c:set>
	<c:set var="i" value="555" scope="request"></c:set>
	<c:out value="${requestScope.i}" default="无值" ></c:out><br>
	<c:remove var="i" scope="request"></c:remove><br>
	<c:out value="${i }" default="没有找到"></c:out><br>
	
	${name}<br>
	<c:set var="i" value="你好"></c:set>
	<c:if test="${!empty i }"><!-- empty检测变量值是否为null -->
	<c:out value="${i }"></c:out>
	<c:set var="num" value="20"></c:set>
	</c:if><br>
	<c:if test="${num>0 }">
		<c:out value="${num+1 }">>0</c:out>
	</c:if><br>
	<c:choose>
	<c:when test="${ num==10 }">
	<p>i无值</p>
	</c:when>
	<c:when test="${ num==30 }">
	<p>i无值</p>
	</c:when>
	<c:otherwise >
	<p>没有找到进入</p>
	</c:otherwise>
	</c:choose>
</body>
</html>