(function(){
	var paths={
		/**
		 * 基于jQuery的多级下拉框联动插件, 炫空间有KISSY的修改版本.
		 */
		selectors: "module/selectors",
			/**
		 * 基于jQuery的表单验证插件
		 * @see  formValid.html
		 */
		css: "css.min",	
		formValid: "module/form-valid",
		iealert : "module/iealert/index",
		showMark : "module/showMark",
		dialog:"jqueryui/jquery.ui.dialog.min",
		core:"jqueryui/jquery.ui.core.min",
		widget:"jqueryui/jquery.ui.widget.min",
		mouse:"jqueryui/jquery.ui.mouse.min",
		button:"jqueryui/jquery.ui.button.min",
		draggable:"jqueryui/jquery.ui.draggable.min",
		position:"jqueryui/jquery.ui.position.min"
	};
	var scripts = document.getElementsByTagName('script') , _src = scripts[scripts.length-1].src;
	require.baseUrl = _src.replace( /\/[^\/]*$/,"" )
	require.config({
		baseUrl: require.baseUrl,
	   	paths : paths,
	   	urlArgs: 'v=1.3',
	   	shim :{
		   	iealert:{
				deps: ["css!module/iealert/css/style.css"]
			},
			dialog:{
				deps: ["core","widget","mouse","button","draggable","position","css!../css/jquery-ui/jquery-ui.css"]
			}
	   	}
	})

})();
