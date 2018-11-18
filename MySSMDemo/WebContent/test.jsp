<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/* var a=(9-3)||0||(5-3)
alert(a)
 */
var a=3;
Number.prototype.add = function(num){
    return this.valueOf()+num;
}
alert(a.add(5));

function sum(){
	var sums=0;
	for (var i = 0; i < arguments.length; i++) {
		sums+=arguments[i];
	}
	return sums;
}
 alert(sum(1,53,75))
</script>
</head>
<body>
<div>dfsdf</div>

</script>
</body>
</html>