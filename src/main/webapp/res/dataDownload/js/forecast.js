//首页天气预报
    //新增jq  点击更换城市
    $('.boxDivTop-header2').click(function(){
//        $('.province').removeClass('selected');
//        $('#54511').addClass('selected');
//        $('.province').attr('src','/static/images/home/circle-icon.png');
//        $('#54511').attr('src','/static/images/home/selected-icon.png'); 
        $('.weaterSelect').css('display','block');
        $('.weaterShow').css('display','block');
       //var ls = getCookie('stationId');alert(ls);
    });
    //新增 点击x进行关闭
    $('.weaterSelect-img,#buttom_qx').click(function(){
        $('.weaterSelect').css('display','none');
        $('.weaterShow').css('display','none');
    });
    //只能单选事件
    $('.province').click(function(){
        if($(this).attr('src') == '/static/images/home/circle-icon.png'){
           //把全部的都去除掉，单选
          $('.province').attr('src','/static/images/home/circle-icon.png'); 
          $('.province').removeClass('selected'); 
          $(this).attr('src','/static/images/home/selected-icon.png'); 
          $(this).addClass('selected');
        }
    });
        //cnSubstr函数作用：为截取字符串；
        function cnSubstr(str, len) {
            //length属性读出来的汉字长度为1
	    if(str.length*2 <= len) {
	        return str;
	    }
	    var strlen = 0;
	    var s = "";
	    for(var i = 0;i < str.length; i++) {
	        s = s + str.charAt(i);
	        if (str.charCodeAt(i) > 128) {
	            strlen = strlen + 2;
	            if(strlen > len){
	                return s.substring(0,s.length-1) + "...";
	            }
	        } else {
	            strlen = strlen + 1;
	            if(strlen > len){
	                return s.substring(0,s.length-2) + "...";
	            }
	        }
	    }
	    return s;
         }
    //设置cookie
    $('.yhzc-boxDivTop').click(function(){
        var forecastHref = $('#forecastCityA').attr('href');
        location.href=forecastHref;
    });
    $('#buttom_bc').click(function(){
        var  stationId = $('.selected').attr('id');
        //用js存cookie
        setCookie('stationId',stationId);
        getForecastInfo(stationId);
        //掉接口，ajax返回数据
        $('.weaterSelect').css('display','none');
        $('.weaterShow').css('display','none');
        var forecastHref = $('#forecastCityA').attr('href');
        if(forecastHref.indexOf('?')!=-1){
            forecastHref = forecastHref.substring(0,forecastHref.indexOf('?'))+'?t='+stationId;
        }
        $('#forecastCityA').attr('href',forecastHref);
        is_live_stationid = 1;
    }); 
    function setCookie(name,value){
            var Days = 365;
            var exp = new Date();
            exp.setTime(exp.getTime() + Days*24*60*60*1000);
            document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString()+";path=/";
    }
//-------------------------
//定义天气情况
var weather = {};
weather.wth = {
	0 : '晴',
	1 : '多云',
	2 : '阴',
	3 : '阵雨',
	4 : '雷阵雨',
	5 : '雷阵雨伴有冰雹',
	6 : '雨夹雪',
	7 : '小雨',
	8 : '中雨',
	9 : '大雨',
	10 : '暴雨',
	11 : '大暴雨',
	12 : '特大暴雨',
	13 : '阵雪',
	14 : '小雪',
	15 : '中雪',
	16 : '大雪',
	17 : '暴雪',
	18 : '雾',
	19 : '冻雨',
	20 : '沙尘暴',
	21 : '小到中雨',
	22 : '中到大雨',
	23 : '大到暴雨',
	24 : '暴雨到大暴雨',
	25 : '大暴雨到特大暴雨',
	26 : '小到中雪',
	27 : '中到大雪',
	28 : '大到暴雪',
	29 : '浮尘',
	30 : '扬沙',
	31 : '强沙尘暴',
	53 :'霾'
};
//定义风向
weather.windDirect = {
	0 : '北风',
	45 : '东北风',
	90 : '东风',
	135 : '东南风',
	180 : '南风',
	225 : '西南风',
	270 : '西风',
	315 : '西北'
};
//风向
weather.windDri = function(win) {
	if (weather.windDirect[win] != undefined) {
		return weather.windDirect[win];
	} else {
		if (0 < win && win < 45)
			return '北偏东';
		if (45 < win && win < 90)
			return '东偏北';
		if (90 < win && win < 135)
			return '东偏南';
		if (135 < win && win < 180)
			return '南偏东';
		if (180 < win && win < 225)
			return '南偏西';
		if (225 < win && win < 270)
			return '西偏南';
		if (270 < win && win < 315)
			return '西偏北';
		if (315 < win && win < 360)
			return '北偏西';
	}
};
// 风速
weather.windSpeed = function(speed) {
	if (speed <= 0.2)
		return windLevel = "微风";
	else if (speed <= 1.5 && speed>0.2)
		return windLevel = "1级";
	else if (speed <= 3.3 && speed>1.5)
		return windLevel = "2级";
	else if (speed <= 5.4 && speed>3.3)
		return windLevel = "3级";
	else if (speed <= 7.9 && speed>5.4)
		return windLevel = "4级";
	else if (speed <= 10.7 && speed>7.9)
		return windLevel = "5级";
	else if (speed <= 13.8 && speed>10.7)
		return windLevel = "6级";
	else if (speed <= 17.1 && speed>13.8)
		return windLevel = "7级";
	else if (speed <= 20.7 && speed>17.1)
		return windLevel = "8级";
	else if (speed <= 24.4 && speed>20.7)
		return windLevel = "9级";
	else if (speed <= 28.4 && speed>24.4)
		return windLevel = "10级";
	else if (speed <= 32.6 && speed>28.4)
		return windLevel = "11级";
	else if (speed <= 132 && speed>32.6)
		return windLevel = "12级以上"
};
//雨量pre处理
weather.rainfall=function(rainfall){
	if(rainfall==0)
		return 0;
	if (0 < rainfall && rainfall <1)
		return 1;
	if (1<= rainfall && rainfall < 10)
		return 2;
	if (10 <= rainfall && rainfall < 25)
		return 3;
	if (25 <= rainfall && rainfall < 50)
		return 4;
	if (50 <= rainfall && rainfall < 100)
		return 5;
	if (100 <= rainfall && rainfall < 200)
		return 6;
	if (200<= rainfall && rainfall < 300)
		return 7;
	if (300 <= rainfall && rainfall < 400)
		return 8;
	if (400 <= rainfall && rainfall < 600)
		return 9;
	if (600 <= rainfall)
		return 10;
}

//缩小显示适应
$(function(){
    reLayOut();
});
$(window).resize(function(){
    reLayOut();  
});
function reLayOut(){
    var zoomNum = checkZoom();
    if(zoomNum < 100){//缩小了
        $('.yhzc-boxDiv').css('margin-left','8px');
        $('.body-content-dataSub').css('width','328px');
        $('.content-dataRi').css('width','207px');
        $('.body-content-NoticeSubScience').css('width','537px');
    }else{//100%或放大
        $('.yhzc-boxDiv').css('margin-left','9px');
        $('.body-content-dataSub').css('width','329px');
        $('.content-dataRi').css('width','208px');
        $('.body-content-NoticeSubScience').css('width','538px');
    }
}
function checkZoom() {
	var ratio = 0, screen = window.screen, ua = navigator.userAgent.toLowerCase();
	if (window.devicePixelRatio !== undefined) {
		ratio = window.devicePixelRatio;
	} else if (~ua.indexOf('msie')) {
		if (screen.deviceXDPI && screen.logicalXDPI) {
			ratio = screen.deviceXDPI / screen.logicalXDPI;
		}
	} else if (window.outerWidth !== undefined && window.innerWidth !== undefined) {
		ratio = window.outerWidth / window.innerWidth;
	}
	if (ratio) {
		ratio = Math.round(ratio * 100);
	}
	return ratio;
}



 function check_province(myprovince){
            var tmp_stationId ="";
            switch(myprovince){
                 case "北京":
                        tmp_stationId = "54511";
                        break;
                 case "天津":
                        tmp_stationId = "54527";
                        break;
                 case "河北":
                        tmp_stationId = "53698";
                        break;
                 case "山西":
                        tmp_stationId = "53772";
                        break;
                 case "内蒙古":
                        tmp_stationId = "53463";
                        break;
                 case "辽宁":
                        tmp_stationId = "54342";
                        break;
                 case "吉林":
                        tmp_stationId = "54161";
                        break;
                 case "黑龙江":
                        tmp_stationId = "50953";
                        break;
                 case "上海":
                        tmp_stationId = "58367";
                        break;
                 case "江苏":
                        tmp_stationId = "58238";
                        break;
                 case "浙江":
                        tmp_stationId = "58457";
                        break;
                 case "安徽":
                        tmp_stationId = "58321";
                        break;
                  case "福建":
                        tmp_stationId = "58847";
                        break;
                  case "江西":
                        tmp_stationId = "58606";
                        break;
                  case "山东":
                        tmp_stationId = "54823";
                        break;
                 case "河南":
                        tmp_stationId = "57083";
                        break;
                case "湖北":
                        tmp_stationId = "57494";
                        break;
                 case "湖南":
                        tmp_stationId = "57687";
                        break;
                  case "广东":
                        tmp_stationId = "59287";
                        break;
                   case "广西":
                        tmp_stationId = "59431";
                        break;
                  case "海南":
                        tmp_stationId = "59785";
                        break;
                   case "重庆":
                        tmp_stationId = "57516";
                        break;
                    case "四川":
                        tmp_stationId = "56290";
                        break;
                    case "贵州":
                        tmp_stationId = "57816";
                        break;
                     case "云南":
                        tmp_stationId = "56778";
                        break;
                     case "西藏":
                        tmp_stationId = "55591";
                        break;
                     case "陕西":
                        tmp_stationId = "57039";
                        break; 
                      case "甘肃":
                        tmp_stationId = "52889";
                        break; 
                      case "青海":
                        tmp_stationId = "52866";
                        break; 
                     case "宁夏":
                        tmp_stationId = "53614";
                        break;
                      case "新疆":
                        tmp_stationId = "51463";
                        break;
            }
            return tmp_stationId;
        }