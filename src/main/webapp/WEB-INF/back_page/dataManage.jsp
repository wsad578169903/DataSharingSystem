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

<title>数据查询-BootCRM</title>

<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet">

<!-- DataTables CSS -->
<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet"
	type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.html">后台数据管理（管理员）</a>
		</div>
		<!-- /.navbar-header -->

		<ul class="nav navbar-top-links navbar-right">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-envelope fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-messages">
					<li><a href="#">
							<div>
								<strong>李波</strong> <span class="pull-right text-muted">
									<em>昨天</em>
								</span>
							</div>
							<div>李正方加油！</div>
					</a></li>
					<li class="divider"></li>
					<li><a class="text-center" href="#"> <strong>查看全部消息</strong>
							<i class="fa fa-angle-right"></i>
					</a></li>
				</ul> <!-- /.dropdown-messages --></li>
			<!-- /.dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-tasks fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-tasks">
					<li><a href="#">
							<div>
								<p>
									<strong>任务 1</strong> <span class="pull-right text-muted">完成40%</span>
								</p>
								<div class="progress progress-striped active">
									<div class="progress-bar progress-bar-success"
										role="progressbar" aria-valuenow="40" aria-valuemin="0"
										aria-valuemax="100" style="width: 40%">
										<span class="sr-only">完成40%</span>
									</div>
								</div>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<p>
									<strong>任务 2</strong> <span class="pull-right text-muted">完成20%</span>
								</p>
								<div class="progress progress-striped active">
									<div class="progress-bar progress-bar-info" role="progressbar"
										aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
										style="width: 20%">
										<span class="sr-only">完成20%</span>
									</div>
								</div>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a class="text-center" href="#"> <strong>查看所有任务</strong>
							<i class="fa fa-angle-right"></i>
					</a></li>
				</ul> <!-- /.dropdown-tasks --></li>
			<!-- /.dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-bell fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-alerts">
					<li><a href="#">
							<div>
								<i class="fa fa-comment fa-fw"></i> 新回复 <span
									class="pull-right text-muted small">4分钟之前</span>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<i class="fa fa-envelope fa-fw"></i> 新消息 <span
									class="pull-right text-muted small">4分钟之前</span>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<i class="fa fa-tasks fa-fw"></i> 新任务 <span
									class="pull-right text-muted small">4分钟之前</span>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<i class="fa fa-upload fa-fw"></i> 服务器重启 <span
									class="pull-right text-muted small">4分钟之前</span>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a class="text-center" href="#"> <strong>查看所有提醒</strong>
							<i class="fa fa-angle-right"></i>
					</a></li>
				</ul> <!-- /.dropdown-alerts --></li>
			<!-- /.dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-user">
					<li><a href="#"><i class="fa fa-user fa-fw"></i> 用户设置</a></li>
					<li><a href="#"><i class="fa fa-gear fa-fw"></i> 系统设置</a></li>
					<li class="divider"></li>
					<li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i>
							退出登录</a></li>
				</ul> <!-- /.dropdown-user --></li>
			<!-- /.dropdown -->
		</ul>
		<!-- /.navbar-top-links -->

		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					<li class="sidebar-search">
						<div class="input-group custom-search-form">
							<input type="text" class="form-control" placeholder="查询内容...">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button">
									<i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>
								</button>
							</span>
						</div> <!-- /input-group -->
					</li>
					<li><a href="customer.action" class="active"><i
							class="fa fa-edit fa-fw"></i> 数据查询管理</a></li>
					<li><a href="salevisit.action"><i
							class="fa fa-dashboard fa-fw"></i> 数据下载管理</a></li>
					<li><a href="salevisit.action"><i
							class="fa fa-dashboard fa-fw"></i> 数据统计管理</a></li>
					<li><a href="salevisit.action"><i
							class="fa fa-dashboard fa-fw"></i> 数据注册管理</a></li>
					<li><a href="salevisit.action"><i
							class="fa fa-dashboard fa-fw"></i> 数据接口管理</a></li>
				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		<!-- /.navbar-static-side --> </nav>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">数据查询管理</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="panel panel-default">
				<div class="panel-body">
					<form class="form-inline" action="${pageContext.request.contextPath }/dataManager/list.action" method="get">
						<div class="form-group">
							<label for="dataStation">数据站点</label> 
							<input type="text" class="form-control" id="dataStation" value="${dataStation}" name="dataStation">
						</div>
						<div class="form-group">
							<label for="dataCity">数据城市</label> 
							<select	class="form-control" id="dataCity"  name="dataCity">
								<option value="">--请选择--</option>
								<c:forEach items="${cityType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == dataCity}"> selected</c:if>>${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="dataElement">数据要素</label> 
							<select	class="form-control" id="dataElement"  name="dataElement">
								<option value="">--请选择--</option>
								<c:forEach items="${elementType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == dataElement}"> selected</c:if>>${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="dataYear">数据年份</label> 
							<select	class="form-control" id="dataYear"  name="dataYear">
								<option value="">--请选择--</option>
								<c:forEach items="${yearType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == dataYear}"> selected</c:if>>${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="dataMonth">数据月份</label>
							<select	class="form-control" id="dataMonth" name="dataMonth">
								<option value="">--请选择--</option>
								<c:forEach items="${monthType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == dataMonth}"> selected</c:if>>${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div>
						<button type="submit" class="btn btn-primary">查询</button>
						<button type="submit" class="btn btn-primary" onclick="downloadData(${row.dataStation})">下载</button>
						<script type="text/javascript">
							function downloadData(dataStation){
								if(confirm('确实要下载吗?')) {
									$.get("<%=basePath%>customer/download.action",{"dataStation":dataStation},function(data){
										alert("下载成功！");
										window.location.reload();
							}
						</script>
					</form>
					
					<form class="form-inline" action="${pageContext.request.contextPath }/dataManager/download.action" method="get">
						<div class="form-group">
							<label for="dataStation">数据站点</label> 
							<input type="text" class="form-control" id="dataStation" value="${dataStation}" name="dataStation">
						</div>
						<div class="form-group">
							<label for="dataCity">数据城市</label> 
							<select	class="form-control" id="dataCity"  name="dataCity">
								<option value="">--请选择--</option>
								<c:forEach items="${cityType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == dataCity}"> selected</c:if>>${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="dataElement">数据要素</label> 
							<select	class="form-control" id="dataElement"  name="dataElement">
								<option value="">--请选择--</option>
								<c:forEach items="${elementType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == dataElement}"> selected</c:if>>${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="dataYear">数据年份</label> 
							<select	class="form-control" id="dataYear"  name="dataYear">
								<option value="">--请选择--</option>
								<c:forEach items="${yearType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == dataYear}"> selected</c:if>>${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="dataMonth">数据月份</label>
							<select	class="form-control" id="dataMonth" name="dataMonth">
								<option value="">--请选择--</option>
								<c:forEach items="${monthType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == dataMonth}"> selected</c:if>>${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div>
						
						<button type="submit" class="btn btn-primary")">下载</button>
						
						</script>
					</form>
					
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">数据信息列表</div>
						<!-- /.panel-heading -->
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>ID</th>
									<th>数据站点</th>
									<th>数据城市</th>
									<th>数据年份</th>
									<th>数据月份</th>
									<th>数据日期</th>
									<th>数据要素类型</th>
									<th>数据来源</th>
									<th>数据操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.rows}" var="row">
									<tr>
										<td>${row.t_id}</td>
										<td>${row.station_id}</td>
										<td>${row.data_city}</td>
										<td>${row.year_data}</td>
										<td>${row.mon_data}</td>
										<td>${row.day_data}</td>
										<td>${row.data_element}</td>
										<td>${row.data_source}</td>
										<td>
											<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#dataEditDialog" onclick="editData(${row.t_id})">修改</a>
											<a href="#" class="btn btn-danger btn-xs" onclick="deleteData(${row.t_id})">删除</a>
											
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="col-md-12 text-right">
							<itcast:page url="${pageContext.request.contextPath }/customer/list.action" />
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- 数据编辑对话框 -->
	<div class="modal fade" id="dataEditDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改数据信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_data_form">
						<input type="hidden"  id="edit_t_id" name="cust_id"/>
						<div class="form-group">
							<label for="edit_stationId" class="col-sm-2 control-label">数据站点</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_stationId" placeholder="数据站点" name=" t_id ">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_dataCity" style="float:left;padding:7px 15px 0 27px;">数据城市</label> 
							<div class="col-sm-10">
								<select	class="form-control" id="edit_dataCity" placeholder="数据城市" name="data_city">
									<option value="">--请选择--</option>
									<c:forEach items="${cityType}" var="item">
										<option value="${item.dict_id}"<c:if test="${item.dict_id == dataCity}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_dataElement" style="float:left;padding:7px 15px 0 27px;">数据要素</label>
							<div class="col-sm-10"> 
								<select	class="form-control" id="edit_dataElement"  name="data_element">
									<option value="">--请选择--</option>
									<c:forEach items="${elementType}" var="item">
										<option value="${item.dict_id}"<c:if test="${item.dict_id == dataElement}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_dataYear" style="float:left;padding:7px 15px 0 27px;">数据年份</label>
							<div class="col-sm-10">
								<select	class="form-control" id="edit_dataYear" name="data_year">
									<option value="">--请选择--</option>
									<c:forEach items="${yearType}" var="item">
										<option value="${item.dict_id}"<c:if test="${item.dict_id == dataYear}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_dataMon" style="float:left;padding:7px 15px 0 27px;">数据月份</label>
							<div class="col-sm-10">
								<select	class="form-control" id="edit_dataMon" name="data_mon">
									<option value="">--请选择--</option>
									<c:forEach items="${monthType}" var="item">
										<option value="${item.dict_id}"<c:if test="${item.dict_id == dataMonth}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_dataElement" class="col-sm-2 control-label">数据要素</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_dataElement" placeholder="数据要素类型" name="data_element">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_dataSource" class="col-sm-2 control-label">数据来源</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_dataSource" placeholder="数据来源" name="data_source">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="updateData()">保存修改</button>
					
				</div>
			</div>
		</div>
	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="<%=basePath%>js/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="<%=basePath%>js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="<%=basePath%>js/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
	<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="<%=basePath%>js/sb-admin-2.js"></script>
	
	<script type="text/javascript">
		function editData(id) {
			$.ajax({
				type:"get",
				url:"<%=basePath%>customer/detail.action",
				data:{"id":id},
				success:function(data) {
					$("#edit_t_id").val(data.t_id);
					$("#edit_stationId").val(data.station_id);
					$("#edit_dataCity").val(data.data_city);
					$("#edit_dataElement").val(data.data_element);
					$("#edit_dataYear").val(data.data_year);
					$("#edit_dataMon").val(data.data_mon);
					$("#edit_dataElement").val(data.data_element);
					$("#edit_dataSource").val(data.data_source);
				}
			});
		}
		function updateData(){
			$.post("<%=basePath%>customer/update.action",$("#edit_data_form").serialize(),function(data){
				alert("数据信息更新成功！");
				window.location.reload();
			});
		}
		
		function deleteData(id) {
			if(confirm('确实要删除该客户吗?')) {
				$.get("<%=basePath%>customer/delete.action",{"id":id},function(data){
					alert("客户删除更新成功！");
					window.location.reload();
				});
			}
		}
		
	
		
	</script>

</body>

</html>
