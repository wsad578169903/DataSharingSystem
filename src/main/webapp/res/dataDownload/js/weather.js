var weather = weather ? weather : {};
weather.config = {
    ajaxLoading: false,
    url: null,
    params: null,
    id: null
}
weather.loadSatelliteQueryForm = function () {
//    $("input[name='P[SatelliteSeriesCode]']").
}
weather.loadLatellite = function () {
    var url = $("#P_SatelliteCode").attr("url");
    var satelliteSeriesCode = $("input[name='P[SatelliteSeriesCode]']:checked").val();
    var params = {
        satelliteSeriesCode: satelliteSeriesCode
    };
    $.get(url, params, function (d) {
        var html = "";
        $(d).each(function (i) {
            html += "<option value='" + this.SatelliteCode + "'>" + this.SatelliteName + "</option>";
        });
        $("#P_SatelliteCode").html(html);
//        weather.loadInstrument($("#P_SatelliteCode").val());
    }, 'json');
}
weather.loadInstrument = function () {
    var url = $("#P_InstrumentCode").attr("url");
    var satelliteCode = $("#P_SatelliteCode").val();
    var params = {
        satelliteCode: satelliteCode
    };
    $.get(url, params, function (d) {
        var html = "";
        $(d).each(function (i) {
            html += "<option value='" + this.InstrumentCode + "'>" + this.InstrumentNameCHN + "</option>";
        });
        $("#P_InstrumentCode").html(html);
    }, 'json');

}
weather.satellitequeryForm = function () {
    $("input[name='P[SatelliteSeriesCode]']").change(function () {
        jQuery.ajaxSettings.async = false;
        weather.loadLatellite();
        weather.loadInstrument();
        weather.config = $.extend(weather.config, weather.satelliteQueryConfig($("#form-satellite")));
        weather.loadPage();
    });
    $("#P_SatelliteCode").change(function () {
        jQuery.ajaxSettings.async = false;
        weather.loadInstrument();
        weather.config = $.extend(weather.config, weather.satelliteQueryConfig($("#form-satellite")));
        weather.loadPage();
    });
    $("#P_InstrumentCode").change(function () {
        weather.config = $.extend(weather.config, weather.satelliteQueryConfig($("#form-satellite")));
        weather.loadPage();
    });
    weather.config = $.extend(weather.config, weather.satelliteQueryConfig($("#form-satellite")));
    weather.loadPage();
}


//##############自由##########################################################

weather.loadCategoryLabel = function (obj) {
    var form = $(obj).parents("form");
    var url = form.attr("url");
    var params = form.serialize();
    var appendID = form.attr("id");
    $.get(url, params, function (json) {
        //设置标签切换后ajax的值到不同区域
        var category_label = 'category_label_1'
        var instrument_label = 'instrument_label_1';
        if (form.attr("id") == 'form-satellite2') {
            category_label = 'category_label_2';
        }
        var html_category = "<a>&nbsp;</a>";
        $(json.dataTypeDef).each(function (i) {
            var id = Math.random();
            html_category += "<a><input type='checkbox' id='" + id + "' name='P[DataTypeCode][]' class='free3-1' value='" + this.DataTypeCode + "'/><label for='" + id + "'>" + this.CHNName + "</label></a>";
        });
        $("#" + category_label).html(html_category)

        var html_instrument = "<a>&nbsp;</a>";
        $(json.instrument).each(function (i) {
            var id = Math.random();
            html_instrument += "<a><input type='checkbox' id='" + id + "' name='P[InstrumentCode][]' class='free4-1' value='" + this.InstrumentCode + "'/><label for='" + id + "'>" + this.InstrumentNameCHN + "</label></a>";
        });
        $("#" + instrument_label).html(html_instrument)

        //加载列表
        weather.config = $.extend(weather.config, weather.satelliteQueryConfig(form, appendID));
        weather.loadPage();
    }, 'json');
}
weather.loadSatelliteQueryList = function (form) {
    weather.config = $.extend(weather.config, weather.satelliteQueryConfig(form, form.attr("id")));
    weather.loadPage();
    var json = $.parseJSON($("#cagegory").val());
    var html = "<a>&nbsp;</a>";
    $(json.dataTypeDef).each(function (i) {
        html += "<a><input type='checkbox' value='" + this.DataTypeCode + "'/><label>" + this.CHNName + "</label></a>";
    });
    $("#category_label").html(html)

}

weather.freeQueryInit = function () {
    $(".free1,.free2").change(function () {
        var form = $(this).parents("form");
        var checkbox = $(this).parents(".box-list-1216").find("input[type=checkbox]");
        if (this.checked) {
            checkbox.prop("checked", true);
        } else {
            checkbox.prop("checked", false);
        }
        if ($(this).hasClass("loadSatelliteData")) {
            weather.loadCategoryLabel(this);
        }
    });
    $(".free3,.free4").change(function () {
        var form = $(this).parents("form");
        var checkbox = $(this).parents(".box-list-1216").find("input[type=checkbox]");
        if (this.checked) {
            checkbox.prop("checked", true);
        } else {
            checkbox.prop("checked", false);
        }
        if ($(this).hasClass("loadSatelliteData")) {
            //加载列表
            weather.config = $.extend(weather.config, weather.satelliteQueryConfig(form, form.attr("id")));
            weather.loadPage();
        }
    });
    $(".free1-1,.free2-1").change(function () {
        weather.loadCategoryLabel(this);
    })
    $(document).on('change', '.free3-1,.free4-1', function () {
        var form = $(this).parents("form");
        //加载列表
        weather.config = $.extend(weather.config, weather.satelliteQueryConfig(form, form.attr("id")));
        weather.loadPage();
    });
}
weather.satelliteQueryConfig = function (form, appendID) {
    appendID = 'div_satellite_1';
    return {
        ajaxLoading: false,
        url: form.attr("action"),
        params: form.serialize(),
        id: appendID
    };
}
weather.loadPage = function () {
    var obj = $("#" + weather.config.id);
    if (weather.config.ajaxLoading) {
        return false;
    }
    $.ajax({
        url: weather.config.url,
        data: weather.config.params,
        dataType: 'html',
        timeout: 100000,
        beforeSend: function () {
            weather.config.ajaxLoading = false;
            obj.html("页面加载中……");
        },
        success: function (html) {
            obj.html(html);
            var satellite = $.parseJSON($(html).find("input[id=satellite]").val());
            var instrument = $.parseJSON($(html).find("input[id=instrument]").val());

            $("#satellite_title").html(satellite.SateFullNameCHN + "(发射日期：" + satellite.SatelliteBeginDate + ")");
            $("#instrument_title").html(instrument.InstrumentNameCHN);

            $("#tab_satellite").html(satellite.SatelliteBriefCHN);
            $("#satellite_linkurl").attr("href",satellite.LinkURL);
            $("#tab_instrument").html(instrument.DescriptionCHN);
            $("#instrument_linkurl").attr("href",instrument.LinkURL);
        },
        complete: function () {
            weather.config.ajaxLoading = true;
        },
        error: function (err, msg) {
            obj.html("没有找到有效数据");
        }
    });
}
weather.init = function () {
    this.ajaxLoading = false;
}

/**
 * 创建在线分析地面曲线图
 * @param {jQuery} id jQuery页面对象
 * @param {string} name 曲线名称
 * */
weather.createDmzliveLine = function (id, name, x, y) {
    $(id).highcharts({
        credits: {
            enabled: false
        },
        legend: {
            enabled: false
        },
        chart: {
            plotBackgroundColor: 'rgba(255, 255, 255, .9)'
        },
        title: {
            text: name
        },
        tooltip: {
            enabled: true,
            formatter: function () {
                return '<b>' + this.series.name + '</b><br>' + this.x + ': ' + this.y + '°C';
            }
        },
        plotOptions: {
            line: {
                dataLabels: {
                    enabled: false
                },
                enableMouseTracking: true
            }
        },
        series: [
            {
                name: name,
                data: y
            }
        ],
        xAxis: {
            gridLineWidth: 1,
            lineColor: '#000',
            tickColor: '#000',
            categories: x
        },
        yAxis: {
            enabled: false,
            minorTickInterval: 'auto',
            lineColor: '#000',
            lineWidth: 1,
            tickWidth: 1,
            tickColor: '#000',
            title: {
                enabled: false
            }
        }
    });
}

weather.showImage = function (id, url) {
    if(url == undefined){
        return false;
    }
    require(['showMark'], function (showImg) {
        showImg(
                {
                    html: '<div class="mark"></div>' +
                            '<div class="mark-img-1227">' +
                            '	<a><img src="' + url + '"><i class="close"></i></a>' +
                            '</div>',
                    appendTo: 'body',
                    open: id,
                    showObject: '.mark, .mark-img-1227',
                    showCenter: '.mark-img-1227',
                    close: '.close',
                    callback: function () {

                    }
                }
        )
    })
}

$(function () {
    weather.showImage($(".imageShow"), $(".imageShow").attr("src"));
})