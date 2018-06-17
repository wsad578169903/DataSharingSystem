var _hmt = _hmt || [];
(function() {
	var hm = document.createElement("script");
	hm.src = "https://hm.baidu.com/hm.js?77b86b9176f1dfc42d21d4514b0aae7a";
	var s = document.getElementsByTagName("script")[0];
	s.parentNode.insertBefore(hm, s);
})();

$(function() {
	$('.navcont12 .li').each(function() {
		$(this).hover(function() {
			$(this).prev('.navDi').css('background', '#2580e2');
			$(this).next('.navDi').css('background', '#2580e2');
		}, function() {
			$(this).prev('.navDi').css('background', '#0374ae');
			$(this).next('.navDi').css('background', '#0374ae');
		});
	});
});

function zsej(_inp) {
	var erji = $(_inp).parent('.sanji_li').parent('.sf_thr_ul').siblings('.erji').attr("class").toString();
	var er_arr = erji.split(" ");
	if(er_arr[1] != 'hover') {
		$(_inp).parent('.sanji_li').parent('.sf_thr_ul').siblings('.erji').addClass("hover");
		$(_inp).parent('.sanji_li').parent('.sf_thr_ul').siblings('.erji').children('img').attr('src', 'images/xsj.png');
	}
}

function reset_zsej(_inp) {
	var erji = $(_inp).parent('.sanji_li').parent('.sf_thr_ul').siblings('.erji').attr("class").toString();
	var er_arr = erji.split(" ");
	if(er_arr[1] == 'hover') {
		$(_inp).parent('.sanji_li').parent('.sf_thr_ul').siblings('.erji').removeClass("hover");
		$(_inp).parent('.sanji_li').parent('.sf_thr_ul').siblings('.erji').children('img').attr('src', 'images/xsj2.png');
	}
}

function zsej_par(_inp) {
	$(_inp).parent('li').children('.erji').removeClass('hover');
	$(_inp).children('img').attr('src', 'images/xsj.png');
}

function reset_par(_inp) {

	$(_inp).children('img').attr('src', 'images/xsj2.png');
}

$(function() {
	$(document).on('click', '.validfeedback', function() {
		if($(this).hasClass("feedbacklogin")) {
			$(".mark,.logIn").show();
			setInvoid();
			return false;
		}
		location.href = $(this).attr("url");
	});

	var loginPage = $(".logIn").hasClass('logIn-page');

	if(!loginPage)
		$(".logIn").css({ "left": (document.documentElement.clientWidth - $(".logIn").width()) / 2, "top": (document.documentElement.clientHeight - $(".logIn").height()) / 2 });
	window.onresize = function() {
		$(".logIn").css({ "left": (document.documentElement.clientWidth - $(".logIn").width()) / 2, "top": (document.documentElement.clientHeight - $(".logIn").height()) / 2 });
	}

	$(".close").bind("click", function() {
		$(".mark,.logIn").hide();
		$(".logIn-cont input").val("");
		clearInterval(show); //停止轮询
		$(".showInvalid").css("display", "none");
		//当点击登陆时都是先出现提示，后进行倒计时消失
		$('#tsShow').css('display', 'block');
		$('#leftDiv').css('left', '15px');
	})
	/*登陆dialog*/

	$(document).on('click', '#login', function() {

		var url = "https://data.cma.cn/user/Login.html";
		var userName = $('#userName').val();
		var password = $('#passwordFoot').val();
		var verifyCode = $('#verifyCode').val();

		$.ajax({
			type: "post",
			url: url,
			cache: false,
			async: true,
			data: { userName: userName, password: password, verifyCode: verifyCode },
			dataType: 'jsonp',
			jsonp: 'callback',
			//timeout:8000,
			success: function(data) {

				var outUrl = "/user/logout.html";
				if(data.status == 1) {
					alert('验证码错误！');
				} else if(data.status == 104) {
					alert('您的账号未激活，请登录邮箱激活！');
				} else if(data.status == 105) {
					alert('您的手机号码不唯一，无法登录，如需登录，请电话（86-10-68407499）联系管理员修改！');
				} else if(data.status == 100) {
					var outLink = '<span><a style="border:0px;border-right:1px solid #b4b4b4;" href="' + outUrl + '" class="loginoutA">退出</a></span>&nbsp;';
					var loginStatus = outLink + '<a href="" class="head-top-contMu">我的会员</a><a style="text-decoration:none;border:0px;" href="/user/info.html" >欢迎您！&nbsp;' + data.trueName + '</a>&nbsp;';

					$(".mark,.logIn").hide();
					$("#regLink").hide();
					$('#loginStatus').html(loginStatus);
					$(".loginhead").removeClass("loginhead");
					$(".feedbacklogin").removeClass("feedbacklogin");
					if(1 != 0) {
						window.location = window.location;
					}
				} else {
					alert('用户名或密码错误！');
				}
			}

		});

	});

});

$(function() {
	/*测导航*/
	$(".search-left-nav i").click(function() {
		var contain = $(this).parent().next();
		if($(this).hasClass("unfold")) {
			contain.hide();
			$(this).toggleClass("unfold");
		} else if(contain.hasClass("contain")) {
			contain.show();
			$(this).toggleClass("unfold");
		}
	})
	$(".search-left-nav-cont a").click(function() {
		//console.log(this)
		$(this).toggleClass("select");
		$(this).parent().toggleClass("select");

	})

	/*测导航*/

	var leftNav = $(".search-left-nav");
	!leftNav.hasClass("no-padding") ? leftNav.css("min-height", $(".content").height()) : leftNav.css("min-height", "auto");

	$(document).on('click', '.validLogin', function() {
		if(!$(this).hasClass("loginhead")) {
			if($(this).hasClass("target")) {
				window.open($(this).attr('url'))
			} else {
				location.href = $(this).attr("url");
			}
		}
	});

	$(document).on('click', '.favorite', function() {
		var url = "/data/favoriteAdd.html"
		var params = {
			dataCode: $(this).attr("datacode")
		};
		$.get(url, params, function(d) {
			if(d.status) {
				alert(d.data.message);
			}
		})
	})
});

function getCookie(cname) {
	var name = cname + "=";
	var ca = document.cookie.split(';');
	for(var i = 0; i < ca.length; i++) {
		var c = ca[i];
		while(c.charAt(0) == ' ') c = c.substring(1);
		if(c.indexOf(name) != -1) return c.substring(name.length, c.length);
	}
	return "";
};

$(document).ready(function() {
	var surveyCookie = getCookie("surveyCookie");
	//		if(dialogCookie==""&&$(".notice-title").length==1){
	//alert(surveyCookie);
	if((surveyCookie == "" || surveyCookie == 0) && ($(".survey").length == 1)) {
		//          if(1&&($(".survey").length==1)){
		var $noticeDialog = $("#forSurveyDialog").dialog({});
		$("[aria-describedby='forSurveyDialog']").css({
			"transform": "scale(1)",
			"opacity": 1,
			"top": "107px",
			"left": "303px",
			"width": "506px",
			"padding": "0px"
		}).addClass("index-notice-dialog");
		if($(".survey").length == 1) {
			$(".ui-dialog-titlebar").css("background", "url('images/notice-header2.png')");
			$("#forSurveyDialog").css("background", "url('images/inform-bg.png')");
			$(".ui-dialog").css("border-radius", "11px");
			$("#forSurveyDialog").css("border-bottom-left-radius", "7px");
			$("#forSurveyDialog").css("border-bottom-right-radius", "7px");
			$(".ui-button").hide();
		}
		if($(".surveyFuBtOu").length == 0) {
			$(".surveyFuBtIn").css("margin-left", "168px");
		}
		var exprise = new Date().setTime(new Date().getTime() + 1000 * 3600 * 24);
		document.cookie = "surveyCookie=1;path=/";
	}
	$(".surveyFuBtOu").click(function() {
		$(".ui-button").click();
	});
	$(".loginoutA").click(function() {
		document.cookie = "surveyCookie=0;path=/";
	});
})
$(".footerIc").append(unescape("%3Cspan id='_ideConac' %3E%3C/span%3E%3Cscript src='http://dcs.conac.cn/js/33/000/0000/60652589/CA330000000606525890005.js' type='text/javascript'%3E%3C/script%3E"));
(function($) {
	require(["iealert"], function(IEAlert) {
		new IEAlert();
	});
	/*登陆dialog*/
	$(document).on('click', '.loginhead , .clickFlash', function() {
		if($(this).hasClass('loginhead') || $(this).hasClass('clickFlash')) { //不刷新页面移除类后不触发登录
			$(".mark,.logIn").show();
			setInvoid();
		}
	});

	//当鼠标触摸二维码，样式发生变化
	$('#leftImg').mouseover(function() {
		$('#tsShow').stop().fadeIn(1000);
		$('#leftDiv').stop().animate({ left: '15px' }, 500, 'linear');
		$('.showInvalid').stop().animate({ left: '15px' }, 500, 'linear');
	});
	$('#leftImg').mouseout(function() {
		$('#tsShow').stop().fadeOut("fast");
		$('#leftDiv').stop().animate({ left: '101px' }, 500, 'linear');
		$('.showInvalid').stop().animate({ left: '101px' }, 500, 'linear');
	});
	//console.log(document.documentElement.clientWidth);
	//console.log($(".logIn").width());
	//console.log(document.documentElement.clientHeight);
	//console.log($(".logIn").height());
	$(".logIn").css({ "left": (document.documentElement.clientWidth - $(".logIn").width()) / 2, "top": (document.documentElement.clientHeight - $(".logIn").height()) / 2 });
	window.onresize = function() {
		// console.log(document.documentElement.clientWidth);
		// console.log($(".logIn").width());
		// console.log(document.documentElement.clientHeight);
		// console.log($(".logIn").height());
		$(".logIn").css({ "left": (document.documentElement.clientWidth - $(".logIn").width()) / 2, "top": (document.documentElement.clientHeight - $(".logIn").height()) / 2 });
	}
	/*登陆dialog*/

	$(".close").on("click", function() {
		$(".mark").hide();
		$(this).parents(".logIn").hide();
		$(".logIn-cont input").val("");
		clearInterval(show); //停止轮询
		$(".showInvalid").css("display", "none");
		//当点击登陆时都是先出现提示，后进行倒计时消失
		$('#tsShow').css('display', 'block');
		$('#leftDiv').css('left', '15px');
	})
	$(".Code").on("focus", function() {
		$(this).addClass("blur-color");
	});
	$(".Code").on("blur", function() {
		$(this).removeClass("blur-color");
	})

	/*隔行变色*/
	var tablename = $(".download-rank12");
	var li = $(".download-rank12 li")
	for(var i = 0; i <= li.length; i++) {
		if(i % 2 != 0) {
			$(li[i]).addClass("color")
		}
	}
	/*隔行变色*/
})(jQuery)

if($("body").height() < $(document).height()) {
	$(".sub-body-content").height($(document).height() - $(".head-top-cont").height() - $(".head12").height() - $(".footer-bg14").height() - 18)
}
//2017.3.3新加js
function jumpPmg(e) {
	var id = $(e).attr("id");
	if(id == 'loginPhone') {
		$("#loginApp").css("display", "block");
		$("#loginRu").css("display", "none");
	} else if(id == 'loginWeb') {
		$("#loginRu").css("display", "block");
		$("#loginApp").css("display", "none");
	}
}
var show;
var time;
var stop;

function setInvoid() {
	$(".showInvalid").css("display", "none");
	//当点击登陆时都是先出现提示，后进行倒计时消失
	$('#tsShow').css('display', 'block');
	$('#leftDiv').css('left', '15px');
	//$('.showInvalid').css('left','15px');
	//调样式倒计时；倒计时4秒关闭！
	time = 0;
	stop = setInterval(function() {
		time = time + 1;
		if(time == 4) {
			$('#tsShow').stop().fadeOut("fast");
			$('#leftDiv').stop().animate({ left: '101px' }, 500, 'linear');
			$('.showInvalid').stop().animate({ left: '101px' }, 500, 'linear');
			clearInterval(stop);
		}
	}, 1000);

	//调方法qrCode进行加上二维码在页面上
	$.ajax({
		url: "/site/qrCode.html",
		type: "post",
		success: function(data) {
			data = JSON.parse(data);
			var code = data.qrcode;
			$('#leftImg').attr("src", data.imastr);
			//show = setInterval(loginfunction(code),1000);//轮询开始！
			show = setInterval(function() {
				$.ajax({
					url: "/site/getqrinfo.html",
					data: { qrcode: code },
					type: "post",
					//dataType:"josn",
					success: function(data) {
						//alert(3);
						data = JSON.parse(data);
						//alert(data.status);
						//alert(data.content.value);
						if(data.status == 0) {
							if(data.content.value != '' && data.content.value != null) {
								clearInterval(show); //停止轮询
								//登陆:存储sesson;把需要的参数全部存入完成自动登陆
								var userid = data.content.value;
								$.ajax({
									url: "/user/appLogin.html",
									data: { userid: userid },
									type: "post",
									dataType: "json",
									success: function(result) {
										if(result.status == 1) {
											alert('用户不存在！');
										}
										var outUrl = "/user/logout.html";
										if(result.status == 100) {
											var outLink = '<span><a style="border:0px;border-right:1px solid #b4b4b4;" href="' + outUrl + '" class="loginoutA">退出</a></span>&nbsp;';
											var loginStatus = outLink + '<a href="" class="head-top-contMu">我的会员</a><a style="text-decoration:none;border:0px;" href="/user/info.html" >欢迎您！&nbsp;' + result.trueName + '</a>&nbsp;';
											$(".mark,.logIn").hide();
											$("#regLink").hide();
											$('#loginStatus').html(loginStatus);
											$(".loginhead").removeClass("loginhead");
											$(".feedbacklogin").removeClass("feedbacklogin");
											if(1 != 0) {
												window.location = window.location;
											}
										}
									}
								});
							}
						} else if(data.status == -1) {
							clearInterval(show); //停止轮询
							//把二维码上面放上遮罩层，并做好样式
							$(".showInvalid").css("display", "block");
						}
					}
				});
			}, 1000);
		}
	});
}

$(document).on("click", ".right-barN .right-barN-list", function() {
	if($(".validfeedback.feedbacklogin").length != 0 && !$(this).hasClass("noneed-login")) {
		$(".mark,.logIn").show();
		setInvoid();
		return false;
	}
	if($(this).find(".auerl").val()) {
		window.location.href = $(this).find(".auerl").val();
	}

});
//首页进行判断
var stationId;
var is_repet_stationId = 0; //在没有城市的气温的情况下的标识量 0-找31个省会城市天气 1-默认北京
var is_live_stationid = 1; //是否存在cookie['stationId'] 0 不存在 1 存在
var myprovince = remote_ip_info['province'] ? remote_ip_info['province'] : '北京';
var mycity = remote_ip_info['city'] ? remote_ip_info['city'] : '北京';

stationId = getCookie('stationId');

if(!stationId) {

	$.ajax({
		url: "/forecast/AjaxGetStationID.html",
		type: "post",
		data: { city: mycity },
		dataType: "json",
		async: false,
		success: function(result) {
			stationId = result.StationID;
		},
		error: function(e) { console.log(e.responseText) }
	});
	is_live_stationid = 0;

}

getForecastInfo(stationId);
$('#' + stationId).click();
var forecastHref = $('#forecastCityA').attr('href') + '?t=' + stationId;
$('#forecastCityA').attr('href', forecastHref);

//获取预报信息
function getForecastInfo(stationId) {
	if(!stationId) {
		stationId = "54511";
	}

	$.ajax({
		url: "/forecast/getForecastInfo.html",
		data: { "stationId": stationId },
		type: "post",
		dataType: "json",
		error: function(e) { console.log(stationId) },
		success: function(result) {

			if(result.TEM_Max_24h == '-' && result.TEM_Min_24h == '-') {
				if(is_repet_stationId == 0) {
					is_repet_stationId = 1;
					stationId = check_province(myprovince);
					getForecastInfo(stationId);
				} else {
					stationId = "54511";
					getForecastInfo(stationId);
				}
				return;
			}

			//判断
			//   var city = $('#'+stationId).next().text();
			if(is_live_stationid == 0) {
				var city = result.City;
			} else {
				var city = $('#' + stationId).next().text();
			}

			var tmlg = result.TEM_Max_24h;
			var tmld = result.TEM_Min_24h;
			var wind = result.WIN_D;
			var windj = result.WIN_S;
			var water = result.PRE_24h;
			var WEP = result.WEP;
			var url = 'http://image.data.cma.cn' + '/static/image/forecast/bigIcon/' + WEP + '.png';
			var tml = tmld + '~' + tmlg + '°C';
			var weatherHtml1 = '<a title="' + weather.wth[WEP] + '" href="javascript:void(0)"   style="color:#397FD5;">' + cnSubstr(WEP != '-' ? weather.wth[WEP] : '-', 4) + '</a>';
			var weatherH2 = '<a title="' + weather.windDri(wind) + weather.windSpeed(windj) + '" href="javascript:void(0)" class="foreWinA"  style="">风：' + cnSubstr((wind != '-' ? weather.windDri(wind) : '-') + (windj != '-' ? weather.windSpeed(windj) : '-'), 10) + '</a>';
			//赋值
			$('#provinceName').html(city);
			$('.boxDivTop-content1').css('background', "url('" + url + "') no-repeat center center");
			//$('.boxDivTop-content1').css('backgroundRepeat',"no-repeat");
			$('.boxDivTop-content3').html(tml);
			$('.boxDivTop-content4').html(weatherHtml1);
			$('.boxDivTop-content5').html(weatherH2);
			//$('#water').html('24小时降水：'+weather.rainfall(water)+'mm');  
			$('#water').html('24小时降水：' + water + 'mm');
		}
	});
}

function getCookie(cname) {
	var name = cname + "=";
	var ca = document.cookie.split(';');
	for(var i = 0; i < ca.length; i++) {
		var c = ca[i];
		while(c.charAt(0) == ' ') c = c.substring(1);
		if(c.indexOf(name) != -1) return c.substring(name.length, c.length);
	}
	return "";
};
$(document).ready(function() {
	var dialogCookie = getCookie("dialogCookie");
	//		if(dialogCookie==""&&$(".notice-title").length==1){
	if(dialogCookie == "" && ($(".notice-title").length == 1 || $(".shareTop").length == 1)) {
		//		if(1&&($(".notice-title").length==1 || $(".shareTop").length==1)){
		var $noticeDialog = $("#forNoticeDialog").dialog({});
		$("[aria-describedby='forNoticeDialog']").css({
			"transform": "scale(1)",
			"opacity": 1,
			"top": "107px",
			"left": "303px",
			"width": "506px",
			"padding": "0px"
		}).addClass("index-notice-dialog");
		if($(".shareTop").length == 1) {
			$(".ui-dialog-titlebar").css("background", "url('images/share/dialogHe.png') no-repeat");
			$("#forNoticeDialog").css("background", "url('images/share/dialogMi.png') -1px 0px no-repeat");
			$("#forNoticeDialog").css("height", "236px");
			$(".ui-dialog").css("width", "336px");
			$(".ui-dialog-titlebar").css("height", "31px");
			$(".ui-dialog-titlebar-close").css("background", "url('images/close-btn.png') 10px 8px no-repeat");
			$("#forNoticeDialog").wrap("<a href='/share/index.html'></a>");
		}
		var exprise = new Date().setTime(new Date().getTime() + 1000 * 3600 * 24);
		document.cookie = "dialogCookie=1";
	}
})
$('.wlink').change(function() {
	var link = $(this).val();
	if(link != '') {
		window.open(link);
	}
	$(this).find('option')[0].selected = true;
});

$(".img-weather").mouseover(function(e) {
	//		var html = '<a href="http://m.data.cma.cn/app/web/appDownLoad" target="_blank"><img  width="88" height="88" src="images/td-code.png"/></a><div class="td-context">Android客户端<div>';
	var html = '<a href="http://m.data.cma.cn/app/web/appDownLoad" target="_blank"><img  width="88" height="88" src="' + $(this).attr("androidAPPImageUrl") + '"/></a><div class="td-context">Android客户端<div>';
	if($.trim($(this).attr("iosappimageurl")) != "") {
		html += '<a href="http://m.data.cma.cn/app/web/appDownLoad" target="_blank"><img  width="88" height="88" src="' + $(this).attr("iosappimageurl") + '"/></a><div class="td-context">IOS客户端<div>';
	}
	var d = dialog({
		width: 120,
		content: html,
		modal: false,
		quickClose: true // 点击空白处快速关闭
	});
	d.show(this);
	//移除遮罩
	//		$(d.node).next("div").remove();
	//		var img = $(this);
	//		var closeDialog = function(){
	//			d.remove();
	//			img.off("mouseout",closeDialog);
	//		}
	//		$(this).on("mouseout",closeDialog)
})

$(".img-weixin").mouseover(function() {
		var d = dialog({
			width: 120,
			content: '<img  width="88" height="88" src="http://image.data.cma.cn/mobile/image/weixin.jpg"/><div class="td-context" style="font-size:12px;">关注“中国气象数据网”<div>',
			quickClose: true, // 点击空白处快速关闭
			modal: false
		});
		d.show(this);
		//移除遮罩
		//		$(d.node).next("div").remove();
		//		var img = $(this);
		//		var closeDialog = function(){
		//			d.remove();
		//			img.off("mouseout",closeDialog);
		//		}
		//		$(this).on("mouseout",closeDialog)
	})
	(function($) {
		require(["iealert"], function(IEAlert) {
			new IEAlert();
		});

		/*登陆dialog*/
		$(".loginhead").on("click", function() {
			$(".mark,.logIn").show();
		})
		$(".logIn").css({ "left": (document.documentElement.clientWidth - $(".logIn").width()) / 2, "top": (document.documentElement.clientHeight - $(".logIn").height()) / 2 });
		window.onresize = function() {
			$(".logIn").css({ "left": (document.documentElement.clientWidth - $(".logIn").width()) / 2, "top": (document.documentElement.clientHeight - $(".logIn").height()) / 2 });
		}
		/*登陆dialog*/

		$(".close").on("click", function() {
			$(".mark,.logIn").hide();
			$(".logIn-cont input").val("");
		})
		$("#password, #username, #search").on("focus", function() {
			$(this).parent().addClass("blur-color");
		});
		$("#password, #username, #search").on("blur", function() {
			$(this).parent().removeClass("blur-color");
		});
		$(".Code").on("focus", function() {
			$(this).addClass("blur-color");
		});
		$(".Code").on("blur", function() {
			$(this).removeClass("blur-color");
		})
		/*banner--hover*/
		$(".banner-nav-list12").each(function() {
			$(this).hover(function() {
				$(this).addClass("showBanner").siblings().removeClass("showBanner");
			}, function() {})
		})

		window.onload = function() {
			$(".banner-nav-list12").each(function() {
				if(!$(this).hasClass("showBanner")) {
					$(this).addClass("showBanner");
				}
			})
			$(".banner-nav-cont").find("img").each(function() {
				$(this).height() < $(this).parents(".banner12").height() ? $(this).css({ "margin-top": ($(this).parents(".banner12").height() - $(this).height()) / 2 }) : $(this).height($(this).parents(".banner12").height());
			})

			$(".banner-nav-list12").not(":first").removeClass("showBanner");
			$(".banner12").each(function() {

				var t, n = 0,
					count, html = "",
					bannerIcon = $(".bannerIcon12", $(this)),
					banner = $(this),
					round = "round" + $(this).index();
				count = $("a", banner).length;
				for(var i = 0; i < count; i++) {
					html += "<li></li>"
				};
				bannerIcon.append(html);
				$("a:not(:first-child)", banner).hide();
				$("li:first-child", bannerIcon).addClass("current")
				$("li", bannerIcon).click(function() {
					var i = $(this).index();
					n = i;
					if(i >= count)
						return;
					$("li", bannerIcon).removeClass("current")
					$(this).addClass("current")
					$("a", banner).filter(":visible").fadeOut(500).parent().children().eq(i).fadeIn(1000);
				});
				var round = function() {
					n = n >= (count - 1) ? 0 : ++n;
					$("li", bannerIcon).eq(n).trigger('click');

				};
				t = setInterval(round, 3000);
				banner.hover(function() {

						clearInterval(t)
					},
					function() {
						t = setInterval(round, 3000);
					}
				);
			})
		};

		/*隔行变色*/
		/*
		 var tablename=$(".download-rank12");
		 var li=$(".download-rank12 li")
		 for (var i=0;i<=li.length;i++){
		 if (i%2!=0){
		 $(li[i]).addClass("color")
		 }
		 }*/
		/*隔行变色*/
	})(jQuery)
/*<![CDATA[*/
jQuery(function($) {
	jQuery('#yw0').after("<a id=\"yw0_button\" href=\"\/site\/captcha\/refresh\/1.html\">\u770b\u4e0d\u6e05\u6362\u4e00\u7ec4<\/a>");
	jQuery(document).on('click', '#yw0_button', function() {
		jQuery.ajax({
			url: "\/site\/captcha\/refresh\/1.html",
			dataType: 'json',
			cache: false,
			success: function(data) {
				jQuery('#yw0').attr('src', data['url']);
				jQuery('body').data('captcha.hash', [data['hash1'], data['hash2']]);
			}
		});
		return false;
	});

});
/*]]>*/