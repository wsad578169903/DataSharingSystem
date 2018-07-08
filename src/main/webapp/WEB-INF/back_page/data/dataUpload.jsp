<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itcast" uri="http://itcast.cn/common/"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<title>数据上传</title>
<link rel="stylesheet" type="text/css"
	href="/res/dataDownload/css/style.css" />
<link rel="stylesheet" href="/res/dataDownload/css/stylechange1.css">
	<link rel="stylesheet" type="text/css"
		href="/res/dataDownload/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/res/dataDownload/css/hu_style.css">
<link rel="stylesheet" href="/res/dataUpload/css/fileinput.min.css" />
<script src="/res/dataUpload/js/fileinput.min.js"></script>
<script src="/res/dataUpload/js/locales/zh.js"></script>

</head>

<body>

	<div class="ceshi1">
		<form action="/upload.do" method="post" enctype="multipart/form-data"
			name="batchAdd" onsubmit="">
			<div class="col-lg-4">
				<input id="excel_file" type="file" name="filename" accept="xls/xlsx" size="50" />
			</div>
			<input id="excel_button"  type="submit" value="导入Excel" />
		</form>
	</div>

</body>
</html>
