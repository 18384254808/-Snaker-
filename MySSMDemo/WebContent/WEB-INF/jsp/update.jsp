<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<form id="updateGcxx">
		<p>工程名称：<input type="text" name="gcmc_name" value="${gcmcVo.gcmc_name}" /></p>
		<p>客户名称：<input id="cc" class="easyui-combobox" name="khmc_id" value="${gcmcVo.khgl.khmc_name}"
    data-options="valueField:'khmc_id',textField:'khmc_name',url:'getKhgl.do'" /></p>  
	</form>
	<!-- valueField传到后台的value  textField展示的value-->


	
</body>
</html>