<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<form action="#" method="post">
				<input type="text" Name="Userame" placeholder="用户名" required="">
				<input type="password" Name="Password" placeholder="密码" required="">
				<input type="yzm" id="captcha"  Name="captcha" maxLength="7" placeholder="验证码" required="">
				<img src="/captcha.svl" onclick="this.src='/captcha.svl?d='+new Date()" class="code" alt="换一张" /><a href="javascript:void(0);" onclick="$('.code').attr('src','/captcha.svl?d='+new Date())" title="换一张">换一张</a>
				
				
				
				
				<!-- <li><label for="captcha">验证码：</label>
				<span class="bg_text small">
					<input type="text" id="captcha" name="captcha" maxLength="7"/>
				</span>
				<img src="/captcha.svl" onclick="this.src='/captcha.svl?d='+new Date()" class="code" alt="换一张" /><a href="javascript:void(0);" onclick="$('.code').attr('src','/captcha.svl?d='+new Date())" title="换一张">换一张</a></li>
			<li><label for="">&nbsp;</label> -->
			
			</form>
			
			<div class="send-button w3layouts agileits">
				
					<input type="submit" value="注                 册">
				
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