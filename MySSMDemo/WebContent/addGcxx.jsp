<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="addGcxx">
		<p>工程名称：<input type="text" name="gcmc_name"/></p>
		<p>客户名称：<input id="cc" class="easyui-combobox" name="khmc_id"   
    data-options="valueField:'khmc_id',textField:'khmc_name',url:'getKhgl.do'" /></p>  
	</form>
	<!-- valueField隐藏的信息  下拉菜单正在传的value  textField显示的名称    -->
</body>
</html>