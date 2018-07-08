<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>气象数据共享平台后台管理系统</title>
<!-- Meta-Tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- //Meta-Tags -->
 
<!-- Style -->
<link rel="stylesheet" href="res/login/css/style.css" type="text/css"
	media="all">


</head>
<body>
	<h1>气象数据共享平台后台管理系统</h1>

	<div class="container w3layouts agileits">

		<div class="login w3layouts agileits">
			<h2>注 册</h2>
			<form id="jvForm"  action="/adminRegister.do" method="post">
			
				<ul  >
				<li  style="color:#f0f8ff; font-size:15px;" id="errorName" class="errorTip" <c:if test="${empty error}">style="display:none"</c:if>>${error}</li>
				</ul>
				
				<input type="text" id="username" name="username"  placeholder="用户名" >
				<input type="password" id="pwd" name="pwd" placeholder="密码" >
				<input type="xingming" id="xm"  Name="xm" placeholder="姓名" >
				
				
				<div class="send-button w3layouts agileits">
					<input type="submit" value="注                 册">
				</div>
			</form>
			
			<div class="clear"></div>
		</div>


		<div class="clear"></div>

	</div>

	<div class="footer w3layouts agileits">
		<p>
			Copyright &copy; More Information <a href="https://www.nuist.edu.cn/"
				target="_blank" title="">南京信息工程大学</a>
		</p>
	</div>
</body>
</html>