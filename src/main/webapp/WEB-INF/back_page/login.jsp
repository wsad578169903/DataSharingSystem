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

<script src="/res/js/jquery.js"></script>
<script src="/res/js/com.js"></script>
<!-- Style -->
<link rel="stylesheet" href="res/login/css/style.css" type="text/css"
	media="all">

</head>
<body>
	<h1>气象数据共享平台后台管理系统</h1>

	<div class="container w3layouts agileits">

		<div class="login w3layouts agileits">
			<h2>登     录</h2>
			<form id="jvForm"  action="/login.do" method="post">
				<ul  >
				<li  style="color:#f0f8ff; font-size:15px;" id="errorName" class="errorTip" <c:if test="${empty error}">style="display:none"</c:if>>${error}</li>
				</ul>
				<input type="text" id="username" name="username"  placeholder="用户名" >
				<input type="password" id="pwd" name="pwd" placeholder="密码" >
				<input type="yzm" id="captcha"  Name="captcha" maxLength="7" placeholder="验证码" >
				<img src="/captcha.svl" onclick="this.src='/captcha.svl?d='+new Date()" class="code" alt="换一张" /><a href="javascript:void(0);" onclick="$('.code').attr('src','/captcha.svl?d='+new Date())" title="换一张">换一张</a>
				
				<div class="send-button w3layouts agileits">
					<input type="submit" value="登                 录">
				</div>
			</form>
			<div class="send-button w3layouts agileits">
				<a href="register.do"><input type="submit" value="注                  册" ></a>
			</div>
			
			<a href="#">忘记密码?</a>
			<div class="social-icons w3layouts agileits">
				<p>- 其他方式登录 -</p>
				<ul>
					<li class="qq"><a href="#"> <span
							class="icons w3layouts agileits"></span> <span
							class="text w3layouts agileits">QQ</span></a></li>
					<li class="weixin w3ls"><a href="#"> <span
							class="icons w3layouts"></span> <span
							class="text w3layouts agileits">微信</span></a></li>
					<li class="weibo aits"><a href="#"> <span
							class="icons agileits"></span> <span
							class="text w3layouts agileits">微博</span></a></li>
					<div class="clear"></div>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
<!--		<div class="register w3layouts agileits">
			<h2>注 册</h2>
			<form action="#" method="post">
				<input type="text" Name="Name" placeholder="用户名" required="">
				<input type="text" Name="Email" placeholder="邮箱" required="">
				<input type="password" Name="Password" placeholder="密码" required="">
				<input type="text" Name="Phone Number" placeholder="手机号码"
					required="">
			</form>
			<div class="send-button w3layouts agileits">
				<form>
					<input type="submit" value="免费注册">
				</form>
			</div>
			<div class="clear"></div>
		</div>-->

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