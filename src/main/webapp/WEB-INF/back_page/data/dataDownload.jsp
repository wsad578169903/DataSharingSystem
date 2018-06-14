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

				<title>数据下载</title> <!-- Bootstrap Core CSS -->
				<link href="/res/css/bootstrap.min.css" rel="stylesheet">

					<!-- MetisMenu CSS -->
					<link href="/res/css/metisMenu.min.css" rel="stylesheet">

						<!-- DataTables CSS -->
						<link href="/res/css/dataTables.bootstrap.css" rel="stylesheet">

							<!-- Custom CSS -->
							<link href="/res/css/sb-admin-2.css" rel="stylesheet">

								<!-- Custom Fonts -->
								<link href="/res/css/font-awesome.min.css" rel="stylesheet"
									type="text/css">
									<link href="/res/css/boot-crm.css" rel="stylesheet"
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
			<form class="form-inline"
				action="${pageContext.request.contextPath }/download.do"
				method="get">
				<div class="form-group">
					<label for="dataStation">数据站点</label> <input type="text"
						class="form-control" id="dataStation" value="${dataStation}"
						name="dataStation">
				</div>
				<div class="form-group">
					<label for="dataCity">数据城市</label> <select class="form-control"
						id="dataCity" name="dataCity">
						<option value="">--请选择--</option>
						<c:forEach items="${cityType}" var="item">
							<option value="${item.dict_id}"
								<c:if test="${item.dict_id == dataCity}"> selected</c:if>>${item.dict_item_name }</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="dataElement">数据要素</label> <select class="form-control"
						id="dataElement" name="dataElement">
						<option value="">--请选择--</option>
						<c:forEach items="${elementType}" var="item">
							<option value="${item.dict_id}"
								<c:if test="${item.dict_id == dataElement}"> selected</c:if>>${item.dict_item_name }</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="dataYear">数据年份</label> <select class="form-control"
						id="dataYear" name="dataYear">
						<option value="">--请选择--</option>
						<c:forEach items="${yearType}" var="item">
							<option value="${item.dict_id}"
								<c:if test="${item.dict_id == dataYear}"> selected</c:if>>${item.dict_item_name }</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="dataMonth">数据月份</label> <select class="form-control"
						id="dataMonth" name="dataMonth">
						<option value="">--请选择--</option>
						<c:forEach items="${monthType}" var="item">
							<option value="${item.dict_id}"
								<c:if test="${item.dict_id == dataMonth}"> selected</c:if>>${item.dict_item_name }</option>
						</c:forEach>
					</select>
				</div>

				<button type="submit" class="btn btn-primary")">下载</button>

				</script>
			</form>

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
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改数据信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_data_form">
						<input type="hidden" id="edit_t_id" name="cust_id" />
						<div class="form-group">
							<label for="edit_stationId" class="col-sm-2 control-label">数据站点</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_stationId"
									placeholder="数据站点" name=" t_id ">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_dataCity"
								style="float: left; padding: 7px 15px 0 27px;">数据城市</label>
							<div class="col-sm-10">
								<select class="form-control" id="edit_dataCity"
									placeholder="数据城市" name="data_city">
									<option value="">--请选择--</option>
									<c:forEach items="${cityType}" var="item">
										<option value="${item.dict_id}"
											<c:if test="${item.dict_id == dataCity}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_dataElement"
								style="float: left; padding: 7px 15px 0 27px;">数据要素</label>
							<div class="col-sm-10">
								<select class="form-control" id="edit_dataElement"
									name="data_element">
									<option value="">--请选择--</option>
									<c:forEach items="${elementType}" var="item">
										<option value="${item.dict_id}"
											<c:if test="${item.dict_id == dataElement}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_dataYear"
								style="float: left; padding: 7px 15px 0 27px;">数据年份</label>
							<div class="col-sm-10">
								<select class="form-control" id="edit_dataYear" name="data_year">
									<option value="">--请选择--</option>
									<c:forEach items="${yearType}" var="item">
										<option value="${item.dict_id}"
											<c:if test="${item.dict_id == dataYear}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_dataMon"
								style="float: left; padding: 7px 15px 0 27px;">数据月份</label>
							<div class="col-sm-10">
								<select class="form-control" id="edit_dataMon" name="data_mon">
									<option value="">--请选择--</option>
									<c:forEach items="${monthType}" var="item">
										<option value="${item.dict_id}"
											<c:if test="${item.dict_id == dataMonth}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_dataElement" class="col-sm-2 control-label">数据要素</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_dataElement"
									placeholder="数据要素类型" name="data_element">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_dataSource" class="col-sm-2 control-label">数据来源</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_dataSource"
									placeholder="数据来源" name="data_source">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateData()">保存修改</button>

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

		
</body>

</html>
