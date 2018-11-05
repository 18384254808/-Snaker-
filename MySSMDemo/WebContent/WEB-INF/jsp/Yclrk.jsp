<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
$(function(){
	//加载树形菜单
	$("#Ycirk_tree").tree({
		url:"getAll.do",
		loadFilter:function(data){
			var treeJsons = [{"id":1,"text":"所有原材料","state":"open","children":[]}];
			//List<User>  --> json
			//把data数据格式 转换成 tree要求的格式
			$(data).each(function(i,o){
				treeJsons[0].children.push({"id":o.yclrk_id,"text":o.yclrk_material_name});
			})
			return treeJsons;
		}
	})
	/* //加载表格  每次发起分页要求，自动传递参数 page: 跳转到第几页  rows: 每页显示条数
	//select * from table limit (page-1))*rows,rows
	$("#gc_datagrid").datagrid({
		url:"datagrid.json",
		loadFilter:function(data){
			//必须返回包含'total'和'rows'属性的标准数据对象。
			return data;
		}
	}) */
})
</script>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'west',title:'材料管理'" style="width:180px;">
		<ul id="Ycirk_tree"></ul> 
	</div>
	<div data-options="region:'center',title:'材料信息管理'">
		<table id="gc_datagrid" class="easyui-datagrid" 
		data-options="singleSelect:true,pageSize:20,fit:true,fitColumns:true,pagination:true">   
		    <thead>   
		        <tr>   
		        	<th data-options="field:'ck',checkbox:true,formatter:function(value,row,index){alert(1);alert(row.ck)}"></th>
		            <th data-options="field:'code'">ID</th>   
		            <th data-options="field:'name'">编号</th>   
		            <th data-options="field:'price'">材料名称</th>   
		        </tr>   
		    </thead>   
		</table>  		
	</div>
</div>
</body>
</html>