<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itcast" uri="http://itcast.cn/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>数据查询</title>

<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>res/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="<%=basePath%>res/css/metisMenu.min.css" rel="stylesheet">

<!-- DataTables CSS -->
<link href="<%=basePath%>res/css/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="<%=basePath%>res/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="<%=basePath%>res/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="<%=basePath%>res/css/boot-crm.css" rel="stylesheet"
	type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
	
	<!-- /.row -->
	<div class="panel panel-default">
		<div class="panel-body">
			<a href="#" class="btn btn-primary btn-xs" data-toggle="modal"
				data-target="#dataEditDialog"
				>我要留言</a>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">留言统计列表</div>
				<!-- /.panel-heading -->
				<form id="deleteAll">
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th width="20"><input type="checkbox"
									onclick="checkBox('ids',this.checked)" /></th>
								
								<th>楼层</th>
								<th>用户名</th>
								<th>姓名</th>
								<th>留言时间</th>
								<th>留言内容</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${page.rows}" var="row">
								<tr>
									<td><input type="checkbox" value="${row.id}" name="ids" /></td>
									<td>${row.id}楼</td>
									<td>${row.username}</td>
									<td>${row.xm}</td>
									<td>${row.createDateTime}</td>
									<td>${row.content}</td>
									<td> <a href="#"
										class="btn btn-danger btn-xs"
										onclick="deleteData(${row.id})">删除</a></td>
								</tr>
							</c:forEach>
						</tbody> 
					</table>
				</form>

				<div style="margin-top: 15px;">
					<input class="btn btn-danger btn-xs " type="button" value="批量删除"
						onclick="optDelete();" />
				</div>

				<div class="col-md-12 text-right">
					<div>
						<itcast:page
							url="${pageContext.request.contextPath }/listMessage.do" />
					</div>
				</div>

				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>


	</div>
	<!-- 数据编辑对话框 -->
	<div class="modal fade" id="dataEditDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">请输入留言内容</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="add_message_form">
						<input type="hidden" id="xm1" name="xm" value="${sessionScope.admin.xm}" />
						<input type="hidden" id="username1" name="username" value="${sessionScope.admin.username}" />
						<div class="form-group">
							<label for="add_message" class="col-sm-2 control-label">留言内容</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="content"
									placeholder="留言内容" name="content">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateMessage()">留言</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="<%=basePath%>res/js/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="<%=basePath%>res/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="<%=basePath%>res/js/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script src="<%=basePath%>res/js/jquery.dataTables.min.js"></script>
	<script src="<%=basePath%>res/js/dataTables.bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="<%=basePath%>res/js/sb-admin-2.js"></script>

	<script type="text/javascript">
		
		function updateMessage(){
			/*  alert($("#edit_data_form").serialize())  */
			$.post("<%=basePath%>addMessage.do",$("#add_message_form").serialize(),function(msg){
				alert("留言成功！");
				window.location.reload();
			});
		}
		
		function deleteData(id){
			if(confirm('确实要删除该留言吗?')) {
				$.get("<%=basePath%>deleteMessage.do",{"id":id},function(data){
					alert("留言删除成功！");
					window.location.reload();
				});
			}
		}
		
		//全选
		function checkBox(name,checked){
			$("input[name='"+name+"']").prop("checked",checked);
		}
		
		//批量删除
		
		function optDelete(){
			//请至少选择一个
			var s=$("input[name='ids']:checked").size();
			if (s<=0) {
				alert("请至少选择一个！");
				return;
			} 
			if(!confirm("你确定删除吗？")){
				return;
			}
			$.post("<%=basePath%>deleteMessages.do",$("#deleteAll").serialize(),function(data){
				alert("留言删除成功！");
				window.location.reload();
			});
		}
		
	</script>

</body>

</html>
