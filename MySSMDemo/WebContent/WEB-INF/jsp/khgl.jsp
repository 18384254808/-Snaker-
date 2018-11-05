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
<script type="text/javascript">
$(function(){
	//加载树形菜单
	$("#khgl_tree").tree({
		url:"getKhgl.do",
		loadFilter:function(data){
			var treeJson = [{"id":0,"text":"所有用户","state":"open","children":[]}];
			//List<User>  --> json
			//把data数据格式 转换成 tree要求的格式
			$(data).each(function(i,o){
				treeJson[0].children.push({"id":o.khmc_id,"text":o.khmc_name});
			})
			return treeJson;
		},
		onClick:function(node){
		
	/* id：绑定节点的标识值。
				text：显示的节点文本。
				iconCls：显示的节点图标CSS类ID。
				checked：该节点是否被选中。
				state：节点状态，'open' 或 'closed'。
				attributes：绑定该节点的自定义属性。
				target：目标DOM对象 */
				$("#gc_datagrid").datagrid({
					url:"getGcmcById/"+node.id
				})
			}
		})
		//加载表格  每次发起分页要求，自动传递参数 page: 跳转到第几页  rows: 每页显示条数
		//select * from table limit (page-1))*rows,rows
		/ $("#gc_datagrid").datagrid({
			url : "getGcmcById/0",
			loadFilter : function(data) {
				//必须返回包含'total'和'rows'属性的标准数据对象。
				return data;
			}
		})
	})
	function oprformatter(value, row, index) {
		/* value是field的值  row是当前对象,index的下标 */
		var id = row.gcmc_id;
		return "<a href='javascript:delGcxx("+id+")'>删除</a>&nbsp;&nbsp;<a href='javascript:updGcxx("+id+")'>修改</a>";
	}
	//客户名称
	function oprKhmc(value,row,index){
		return value.khmc_name;
	}
	//删除方法
	function delGcxx(id){
		var ids=[];
		if(id){//有值存单选删除的id
			ids.push(id);
		}else{//无值执行多选删除     获取数据封装数据到数组里
			var ck=$("#gc_datagrid").datagrid("getSelections")
			if(ck.length==0){
				$.messager.alert('警告','请选中一行');
				return;
			}else{
				$(ck).each(function(i,o){
					ids.push(o.gcmc_id);
				})
			}
		}
		//确认框
		$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
		    if (r){    
		    	//ajax请求删除
			//ids=JSON.stringify(ids);把前台得到的数据json转换成后台java能识别的String类型
			//ids.join(",")把json数据以，形式分开  获得一个后台能识别的String类型
		    	$.post("deleteGcxxByids.do",{ids:ids.join(",")},function(data){
		    		if(!data){
		    	 		$.messager.alert('确认','删除失败！'); 
		    	 	}else if(data.flag == true){
		    	 		$.messager.alert('确认',data.msg);
		    	 		$("#gc_datagrid").datagrid("reload");//删除成功后调用easyui的重新加载页面的方法
		    	 	}else{
		    	 		$.messager.alert('确认','删除失败！'+data.msg);
		    	 	}
				},"json")    
		    }    
		});  
	}
	//修改方法
	function updGcxx(id){
		$('#update').dialog({    
		    title: '修改',    
		    width: 400,    
		    height: 200,    
		    closed: false,    
		    cache: false,    
		    href: 'getupdate.do/'+id,    
		    modal: true,
		    buttons:[{
				text:'保存',
				handler:function(){
					$('#updateGcxx').form('submit', {    
					    url:'getGcmcVoByid.do/'+id,
					    success:function(data){
					    	var data = eval('(' + data + ')'); 
					    	alert(typeof data.flag)
					    	alert(data.msg)
					    	$("#gc_datagrid").datagrid('reload')
					    	$('#update').dialog('close');
					    } 
					});  
				}
			},{
				text:'关闭',
				handler:function(){
					$('#update').window('close');
				}
			}]
	});
	}
	function addGcmc(){
		$('#add').dialog({    
		    title: '新增',    
		    width: 400,    
		    height: 200,    
		    closed: false,    
		    cache: false,    
		    href: 'addGcxx.jsp',    
		    modal: true,
		    buttons:[{
				text:'保存',
				handler:function(){
					$('#addGcxx').form('submit', {    
					    url:'addGcxx.do',    
					    onSubmit: function(param){   
					           param.key="张三";
					    },    
					    success:function(data){ 
					    	var data = eval('(' + data + ')');//把字符串Json和String格式互转  
					    	alert(data.msg)
					    	alert(typeof data.flag)
					    	$("#gc_datagrid").datagrid('reload')
					    	$('#add').window('close');
					    }    
					});  
				}
			},{
				text:'关闭',
				handler:function(){
					$('#add').window('close');
				}
			}]
		});   
	}
	//查询搜索框
	function qq(value,name){ 
		//获取树节点选中的节点
		var node = $("#khgl_tree").tree("getSelected")
		//客户id
		var id;
		if(node!=null){
			id=node.id
		}else{
			id=0
		}
		//没有输入查询条件中止此查询方法
		if(!value){
			alert("请输入查询条件");
			return;
		}
		$("#gc_datagrid").datagrid({
			url:"getGcmcSerach/"+id+"/"+name+"/"+value
		})
	} 
</script>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'west',title:'客户管理'" style="width:180px;">
		<ul id="khgl_tree"></ul> 
	</div>
	<div data-options="region:'center',title:'客户信息管理'">
		<table id="gc_datagrid" class="easyui-datagrid" 
		data-options="rownumbers:true,toolbar:gcmc_tools,pageSize:20,fit:true,fitColumns:true,pagination:true">   
		    <thead>   
		        <tr>   
		        	<th data-options="field:'ck',checkbox:true,width:100"></th>
		            <th data-options="field:'gcmc_id',width:100">工程编号</th>   
		            <th data-options="field:'gcmc_name',width:100">工程名字</th>   
		            <th data-options="field:'khgl',width:100,formatter:oprKhmc">客户姓名</th>  
		            <th data-options="field:'opr',width:100,formatter:oprformatter">操作</th>  
		        </tr>   
		    </thead>   
		</table>  		
	</div>
</div>
<div id="gcmc_tools">
<a href="#" class="easyui-linkbutton" onclick="addGcmc()" data-options="iconCls:'icon-add',plain:true">新增</a>
<a href="#" class="easyui-linkbutton" onclick="delGcxx()" data-options="iconCls:'icon-delete',plain:true">删除</a>

<!-- 表格搜索框 -->
<input id="ss" class="easyui-searchbox" style="width:300px" 
data-options="searcher:qq,prompt:'请输入要查询的条件',menu:'#mm'" /> 
</div>
<div id="mm" style="width:120px"> 
<div data-options="name:'all'">模糊查询</div>
<div data-options="name:'khmc'">客户名称</div> 
<div data-options="name:'gcmc'">工程名称</div> 
</div> 
<div id="add"></div>
<div id="update"></div>  
</body>
</html>