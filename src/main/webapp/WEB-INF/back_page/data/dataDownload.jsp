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

<title>数据下载</title>
<link rel="stylesheet" type="text/css"
	href="/res/dataDownload/css/style.css" />
<link rel="stylesheet" href="/res/dataDownload/css/stylechange1.css">
<link rel="stylesheet" type="text/css"
	href="/res/dataDownload/css/bootstrap.min.css" />
<link rel="stylesheet" href="/res/dataDownload/css/hu_style.css">
<!--iconfont图标文件-->
<link rel="stylesheet"
	href="http://at.alicdn.com/t/font_437888_b8af6fhfkexko6r.css">
<!--Kendoui-->
<link href="/res/dataDownload/kendoui/kendo.common.min.css"
	rel="stylesheet">
<link href="/res/dataDownload/kendoui/kendo.rtl.min.css"
	rel="stylesheet">
<link href="/res/dataDownload/kendoui/kendo.bootstrap.min.css"
	rel="stylesheet">
<!--End Kendoui-->
<link rel="stylesheet" type="text/css"
	href="/res/dataDownload/css/common.css" />
<script src="/res/dataDownload/js/jquery-2.1.1.min.js"
	type="text/javascript" charset="utf-8"></script>
<script src="/res/dataDownload/js/bootstrap.min.js"
	type="text/javascript" charset="utf-8"></script>
<script src="/res/dataDownload/js/kendo.all.min.js"></script>
</head>

<body>
	<!-- 按站点下载开始 -->
	<div class="juzhong">
		<div id="listA" class="regionSelect1">
			<form class="form-inline"
				action="${pageContext.request.contextPath }/downloadByDataStation.do"
				method="get" onsubmit="return sumbit_form()">
				<label for="dataStation">输入数据站点名称下载</label> <input type="text"
					id="dataStation" value="${dataStation}" name="dataStation">
				<button type="submit" class="btn btn-primary")">下载</button>
			</form>
		</div>
		<!-- 按站点下载结束 -->



		<form class="form-inline"
			action="${pageContext.request.contextPath }/downloadBySelect.do"
			method="get" onsubmit="return sumbit_form()">
			<!--年份选择-->
			<div class="contentCreateOrder">
				<h4 class="cityName" align="center">选择年份</h4>

				<!-- 
				全选
				<div class=" cityNameSelectCheckbox">
					<label> <input id="reverseA" type="checkbox"> 全选
					</label>
				</div> -->
				<div id="listA" class="regionSelect1">
					<table class="allSearchData" border="0" cellspacing=""
						cellpadding="" align="center">
						<tr>
							<td>
								<div class="checkbox">
									<input type="radio" name="dataYear" id="dataYear" value="2012">
									2012
								</div>
							</td>
							<td>
								<div class="checkbox">
									<label> <input type="radio" name="dataYear"
										id="dataYear" value="2013"> 2013
									</label>
								</div>
							</td>
							<td>
								<div class="checkbox">
									<label> <input type="radio" name="dataYear"
										id="dataYear" value="2014"> 2014
									</label>
								</div>
							</td>
							<td>
								<div class="checkbox">
									<label> <input type="radio" name="dataYear"
										id="dataYear" value="2015"> 2015
									</label>
								</div>
							</td>

							<td>
								<div class="checkbox">
									<label> <input type="radio" name="dataYear"
										id="dataYear" value="2016"> 2016
									</label>
								</div>
							</td>
							<td>
								<div class="checkbox">
									<label> <input type="radio" name="dataYear"
										id="dataYear" value="2017"> 2017
									</label>
								</div>
							</td>
							<td>
								<div class="checkbox">
									<label> <input type="radio" name="dataYear"
										id="dataYear" value="2018"> 2018
									</label>
								</div>
							</td>
							<td>
								<div class="checkbox">
									<label> <input type="radio" name="dataYear"
										id="dataYear" value="2019"> 2019
									</label>
								</div>
							</td>

						</tr>
					</table>
				</div>
				<!--月份选择-->
				<div class="contentCreateOrder">
					<h4 class="cityName" align="center">选择月份</h4>
					<div id="listA" class="regionSelect1">
						<table class="allSearchData" border="0" cellspacing=""
							cellpadding="" align="center">
							<tr>
								<td>
									<div class="checkbox">
										<input type="radio" name="dataMonth" id="dataMonth" value="1">
										1
									</div>
								</td>
								<td>
									<div class="checkbox">
										<label> <input type="radio" name="dataMonth"
											id="dataMonth" value="2"> 2
										</label>
									</div>
								</td>
								<td>
									<div class="checkbox">
										<input type="radio" name="dataMonth" id="dataMonth" value="3">
										3
									</div>
								</td>
								<td>
									<div class="checkbox">
										<input type="radio" name="dataMonth" id="dataMonth" value="4">
										4
									</div>
								</td>
								<td>
									<div class="checkbox">
										<input type="radio" name="dataMonth" id="dataMonth" value="5">
										5
									</div>
								</td>
								<td>
									<div class="checkbox">
										<input type="radio" name="dataMonth" id="dataMonth" value="6">
										6
									</div>
								</td>
							</tr>

							<tr>
								<td>
									<div class="checkbox">
										<input type="radio" name="dataMonth" id="dataMonth" value="7">
										7
									</div>
								</td>
								<td>
									<div class="checkbox">
										<label> <input type="radio" name="dataMonth"
											id="dataMonth" value="8"> 8
										</label>
									</div>
								</td>
								<td>
									<div class="checkbox">
										<input type="radio" name="dataMonth" id="dataMonth" value="9">
										9
									</div>
								</td>
								<td>
									<div class="checkbox">
										<input type="radio" name="dataMonth" id="dataMonth" value="10">
										10
									</div>
								</td>
								<td>
									<div class="checkbox">
										<input type="radio" name="dataMonth" id="dataMonth" value="11">
										11
									</div>
								</td>
								<td>
									<div class="checkbox">
										<input type="radio" name="dataMonth" id="dataMonth" value="12">
										12
									</div>
								</td>
							</tr>




						</table>
					</div>


					<h4 class=" cityName">选择省份</h4>
					<div class="cityNameSelect">
						<div class="cityNameSelectOneList">
							<a href="javascript:void(0)">北京</a> <a href="javascript:void(0)">天津</a>
							<a href="javascript:void(0)">河北</a> <a href="javascript:void(0)">山西</a>
							<a href="javascript:void(0)">内蒙古</a> <a href="javascript:void(0)">辽宁</a>
							<a href="javascript:void(0)">吉林</a> <a href="javascript:void(0)">黑龙江</a>
							<a href="javascript:void(0)">上海</a> <a href="javascript:void(0)">江苏</a>
							<a href="javascript:void(0)">浙江</a> <a href="javascript:void(0)">安徽</a>
							<a href="javascript:void(0)">福建</a>
						</div>
						<div class="cityNameSelectTwoList">
							<a href="javascript:void(0)">江西</a> <a href="javascript:void(0)">山东</a>
							<a href="javascript:void(0)">河南</a> <a href="javascript:void(0)">湖北</a>
							<a href="javascript:void(0)">湖南</a> <a href="javascript:void(0)">广东</a>
							<a href="javascript:void(0)">广西</a> <a href="javascript:void(0)">海南</a>
							<a href="javascript:void(0)">重庆</a> <a href="javascript:void(0)">四川</a>
							<a href="javascript:void(0)">贵州</a> <a href="javascript:void(0)">云南</a>
							<a href="javascript:void(0)">西藏</a>

						</div>
						<div class="cityNameSelectThreeList">
							<a href="javascript:void(0)">陕西</a> <a href="javascript:void(0)">甘肃</a>
							<a href="javascript:void(0)">青海</a> <a href="javascript:void(0)">宁夏</a>
							<a href="javascript:void(0)">新疆</a> <a href="javascript:void(0)">台湾</a>
							<a href="javascript:void(0)">香港</a> <a href="javascript:void(0)">澳门</a>
							<a href="javascript:void(0)">极地</a>
						</div>
					</div>
					<div class=" cityNameSelectCheckbox">
						<h4 class=" cityName">选择城市</h4>
					</div>

					<div id="listA" class="regionSelect1">

						<table class="allSearchData" border="0" cellspacing=""
							cellpadding="">
							<tr>
								<td>
									<div class="checkbox">
										<label><input type="radio" name="dataCity"
											id="dataCity" value="2">北京 </label>
									</div>
								</td>
								<td>
									<div class="checkbox">
										<label><input type="radio" name="dataCity"
											id="dataCity" value="3">上海 </label>
									</div>
								</td>
								<td>
									<div class="checkbox">
										<label><input type="radio" name="dataCity"
											id="dataCity" value="7">广东</label>
									</div>
								</td>
								<td>
									<div class="checkbox">
										<label><input type="radio" name="dataCity"
											id="dataCity" value="6">深圳</label>
									</div>
								</td>
								<td>
									<div class="checkbox">
										<label><input type="radio" name="dataCity"
											id="dataCity" value="5">张家口</label>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="checkbox">
										<label><input type="radio" name="dataCity"
											id="dataCity" value="1">佛山</label>
									</div>
								</td>
								<td>
									<div class="checkbox">
										<label><input type="radio" name="dataCity"
											id="dataCity" value="8">南京</label>
									</div>
								</td>
								<td>
									<div class="checkbox">
										<label><input type="radio" name="dataCity"
											id="dataCity" value="9">杭州</label>
									</div>
								</td>
								<td>
									<div class="checkbox">
										<label><input type="radio" name="dataCity"
											id="dataCity" value="4">承德</label>
									</div>
								</td>
								<td>
									<div class="checkbox">
										<label><input type="radio" name="dataCity"
											id="dataCity" value="10">成都</label>
									</div>
								</td>
							</tr>
							<tr class="stretch">
								<td>
									<div class="checkbox">
										<label><input type="radio" name="dataCity"
											id="dataCity" value="11">成都 </label>
									</div>
								</td>


								<td>
									<div class="addSymbol">-</div>
								</td>
							</tr>
						</table>
						<div class="addSymbol1">+</div>


					</div>
					<!--要素选择-->
					<div class="contentCreateOrder">
						<h4 class="cityName" align="center">选择要素</h4>

						<div id="listA" class="regionSelect1">
							<table class="allSearchData" border="0" cellspacing=""
								cellpadding="" align="center">
								<tr>
									<td>
										<div class="checkbox">
											<input type="radio" name="dataElement" id="dataElement"
												value="8"> 温度
										</div>
									</td>
									<td>
										<div class="checkbox">
											<label> <input type="radio" name="dataElement"
												id="dataElement" value="">湿度
											</label>
										</div>
									</td>
									<td>
										<div class="checkbox">
											<label> <input type="radio" name="dataElement"
												id="dataElement" value="10"> 风速
											</label>
										</div>
									</td>
									<td>
										<div class="checkbox">
											<label> <input type="radio" name="dataElement"
												id="dataElement" value=""> 气压
											</label>
										</div>
									</td>

									<td>
										<div class="checkbox">
											<label> <input type="radio" name="dataElement"
												id="dataElement" value=""> 降水
											</label>
										</div>
									</td>

								</tr>
								<tr>
									<td>
										<div class="checkbox">
											<input type="radio" name="dataElement" id="dataElement"
												value=""> 云量
										</div>
									</td>
									<td>
										<div class="checkbox">
											<label> <input type="radio" name="dataElement"
												id="dataElement" value="">水汽压
											</label>
										</div>
									</td>
									<td>
										<div class="checkbox">
											<label> <input type="radio" name="dataElement"
												id="dataElement" value=""> 水平能见度
											</label>
										</div>
									</td>
									<td>
										<div class="checkbox">
											<label> <input type="radio" name="dataElement"
												id="dataElement" value=""> 体感温度
											</label>
										</div>
									</td>

									<td>
										<div class="checkbox">
											<label> <input type="radio" name="dataElement"
												id="dataElement" value=""> 风力
											</label>
										</div>
									</td>

								</tr>
							</table>
						</div>

						<div class="buttonjuzhong">
							<button type="submit" class="btnMyData" align="center"
								style="cursor: pointer">
								<img src="/res/dataDownload/images/contentSearch.png" /><span>数据下载</span>
							</button>

						</div>

						
		</form>
	</div>

	<script type="text/javascript">
		$("#reverseA").click(function() {
			if (this.checked) {
				$("#listA :checkbox").prop("checked", true);
			} else {
				$("#listA :checkbox").prop("checked", false);
			}
		});
		$("#reverseB").click(function() {
			if (this.checked) {
				$("#listB :checkbox").prop("checked", true);
			} else {
				$("#listB :checkbox").prop("checked", false);
			}
		});
	</script>
	<script type="text/javascript">
		$(".addSymbol1").click(function() {
			$(".regionSelect").css("height", "168px");
			$(".stretch").addClass("showStretch");
			$(".addSymbol1").css("display", "none");
		})
		$(".addSymbol").click(function() {
			$(".regionSelect").css("height", "95px");
			$(".stretch").removeClass("showStretch");
			$(".addSymbol1").css("display", "block");
		})
	</script>


	<script language="javascript">
		function sumbit_form() {
			var gnl = confirm("是否下载此数据?");
			if (gnl == true) {
				return true;
			} else {
				return false;
			}
		}
	</script>



	<script type="text/javascript">
		function checkForm() {
			var flag = true;
			var message = form1.message.value;
			if (message != 'null') {
				alert(message);
				flag = false;
			}
			return flag;
		}
	</script>




</body>
</html>
