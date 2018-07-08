<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<script>
    //定义函数myClose关闭当前窗口
    function myClose(){
        //将id为time的元素的内容转为整数，保存在变量n中
        var n=parseInt(time.innerHTML);
        n--;//将n-1
        //如果n==0,关闭页面
        //否则, 将n+秒钟后自动关闭，再保存回time的内容中
        if(n>0){
            time.innerHTML=n+"秒钟后自动跳转";
            timer=setTimeout(myClose,1000);
        }else{
        	<%-- location.href='<%= request.getContextPath()%>/dataUploadSuccesss.do'; --%>
        	location.href='<%= request.getContextPath()%>/test.do';
        }
    }
    var timer=null;
    //当页面加载后，启动周期性定时器，每个1秒执行myClose
    window.onload=function(){
        timer=setTimeout(myClose,1000);
    }
</script>
<body>
<!-- <form action="/springmvc.do" method="post">
	<input type="text" value="123456" name="birthday">
	<input type="submit" value="提交">
</form>

<form action="dataupload2.do">
<input type="submit" value="提交">
</form> -->



<span id="time">3秒钟后自动跳转</span><br>
    <!-- <a href="javascript:clearTimeout(timer)">留在本页</a> -->
    <a href="${pageContext.request.contextPath }/test.do">跳转到登录页面</a>
</body>
</html>
