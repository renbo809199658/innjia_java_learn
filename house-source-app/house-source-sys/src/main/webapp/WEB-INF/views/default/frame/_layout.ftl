<#macro layout page_tab="">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<title>盈家租金分期管理系统</title>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

	<link rel="shortcut icon" href="favicon.ico">
    <link href="${basePath }/public/hplus-4.1.0/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${basePath }/public/hplus-4.1.0/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${basePath }/public/hplus-4.1.0/css/animate.min.css" rel="stylesheet">
    <link href="${basePath }/public/hplus-4.1.0/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="${basePath }/public/hplus-4.1.0/js/plugins/layer/skin/layer.css" rel="stylesheet">
    <link href="${basePath }/public/hplus-4.1.0/js/plugins/layer/skin/layer.ext.css" rel="stylesheet">
    <link href="${basePath }/public/hplus-4.1.0/js/plugins/layer/skin/moon/style.css" rel="stylesheet">
    <link href="${basePath }/public/hplus-4.1.0/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="${basePath }/public/hplus-4.1.0/css/plugins/iCheck/custom.css" rel="stylesheet">
    
    <link href="${basePath }/public/hplus-4.1.0/js/plugins/fancybox/jquery.fancybox.css" rel="stylesheet">

	<script src="${basePath }/public/hplus-4.1.0/js/jquery.min.js?v=2.1.4"></script>
    <script src="${basePath }/public/hplus-4.1.0/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${basePath }/public/hplus-4.1.0/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${basePath }/public/hplus-4.1.0/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="${basePath }/public/hplus-4.1.0/js/plugins/layer/layer.min.js"></script>
    <script src="${basePath }/public/hplus-4.1.0/js/hplus.min.js?v=4.1.0"></script>
    <script src="${basePath }/public/hplus-4.1.0/js/contabs.min.js"></script>
    <script src="${basePath }/public/hplus-4.1.0/js/plugins/pace/pace.min.js"></script>
    <script src="${basePath }/public/hplus-4.1.0/js/plugins/peity/jquery.peity.min.js"></script>
    <script src="${basePath }/public/hplus-4.1.0/js/demo/peity-demo.min.js"></script>
    <script src="${basePath }/public/hplus-4.1.0/js/content.min.js?v=1.0.0"></script>
    <script src="${basePath }/public/hplus-4.1.0/js/plugins/jquery-ui/jquery-ui.min.js"></script>
    <script src="${basePath }/public/hplus-4.1.0/js/plugins/gritter/jquery.gritter.min.js"></script>
    <script src="${basePath }/public/hplus-4.1.0/js/plugins/easypiechart/jquery.easypiechart.js"></script>
    <script src="${basePath }/public/hplus-4.1.0/js/plugins/sparkline/jquery.sparkline.min.js"></script>
    <script src="${basePath }/public/hplus-4.1.0/js/demo/sparkline-demo.min.js"></script>
    <!--fancybox-->
    <script src="${basePath }/public/hplus-4.1.0/js/plugins/fancybox/jquery.fancybox.js"></script>
    
    <script src="${basePath }/public/hplus-4.1.0/js/plugins/layer/laydate/laydate.js"></script>
    <!--icheck-->
    <script src="${basePath }/public/hplus-4.1.0/js/plugins/iCheck/icheck.min.js" ></script>
    
    <!--bootstrap-table -->
    <link href="${basePath }/public/hplus-4.1.0/css/plugins/bootstrap-table/bootstrap-table.css" rel="stylesheet">
    <script src="${basePath }/public/hplus-4.1.0/js/plugins/bootstrap-table/bootstrap-table.js"></script>
    <script src="${basePath }/public/hplus-4.1.0/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    
    <!--jqgrid-->
    <link href="${basePath }/public/hplus-4.1.0/css/plugins/jqgrid/ui.jqgridffe4.css" rel="stylesheet">
    <script src="${basePath }/public/hplus-4.1.0/js/plugins/jqgrid/jquery.jqGrid.minffe4.js"></script>
    <script src="${basePath }/public/hplus-4.1.0/js/plugins/jqgrid/i18n/grid.locale-cnffe4.js"></script>
    <script src="${basePath }/public/js/jquery/jquery.contextmenu.js"></script>
    
    <!--jquery validate-->
	<script src="${basePath }/public/hplus-4.1.0/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="${basePath }/public/hplus-4.1.0/js/plugins/validate/messages_zh.min.js"></script>
    <script src="${basePath }/public/hplus-4.1.0/js/demo/form-validate-demo.min.js"></script>
	<!--对话框-->
	<script src="${basePath }/public/hplus-4.1.0/js/plugins/sweetalert/sweetalert.min.js"></script>
	
	<script src="${basePath }/public/js/modals.js"></script>
	<script src="${basePath }/public/js/utils/json2.js"></script>
	<script src="${basePath }/public/js/utils/string.js"></script>
	<script src="${basePath }/public/js/utils/jsMap.js"></script>
	<script src="${basePath }/public/js/utils/utils.js"></script>
	<script src="${basePath }/public/js/utils/ajax.js"></script>
	
	<script src="${basePath }/public/js/icheckboxselect.js"></script>
	
	<script src="${basePath }/public/js/middleController.js"></script>
	
	<!-- 基于bootstrap-table的数据列表工具 -->
	<script src="${basePath }/public/js/myTable.js"></script>
	<!-- 基于jqgrid-table的数据列表工具 -->
	<script src="${basePath }/public/js/jqGridTable.js"></script>
	
	<script src="${basePath }/public/js/viewBind.js"></script>

<style>
	li{
		list-style-type:none;
	}
</style>

	<script>
		/*
 		* 数组移除
 		*/
		Array.prototype.remove=function(dx){
			if(isNaN(dx)||dx>this.length){
				return false;
			}
			for(var i=0,n=0;i<this.length;i++){
				if(this[i]!=this[dx]){
					this[n++] = this[i];
				}
			}
			this.length -= 1;
		}
		
	</script>

</head>
<body class="">
<script>
	var basePath = '${basePath}';
	
	$(function () {
        
	});
	$(window).load(function(){
    	//页面加载完成
		
	});
	
	//刷新显示对话框
	function doDialog(url) {
		$.ajax({
    		type: "get",
    		url: url,
    		beforeSend: function(XMLHttpRequest){
    			startBounceLoading();
    		},
    		success: function(data, textStatus){
    			$("#my-modal .modal-body").html(data);
    			$("#my-modal").modal('toggle');
    		},
    		complete: function(XMLHttpRequest, textStatus){
    			stopLoading();
    		},
    		error: function(){
    			
    		}
    	});
	}
	
	function doPage(page) {
		$("#pageNum").val(page);
		$("#pagerForm").submit();
	}
	
	//replace 当前页面
	function replaceView(url) {
		location.replace(url);
	}
	
</script>
<div id="view-load"></div>

<div class="animated fadeIn">
	<!-- Content Wrapper. Contains page content -->
    <section class="content">
    	<#nested />
    </section>

</div>

<div id="my-modal" class="modal inmodal fade" tabindex="0" role="dialog" aria-labelledby="mySmallModalLabel" >
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
            	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                
            </div>
            <div class="modal-footer">
                
            </div>
        </div>
    </div>
</div>

<div id="my-modal-without-body" class="modal inmodal fade" tabindex="0" role="dialog" aria-labelledby="mySmallModalLabel" >
    <div class="modal-dialog modal-lg" style="width:95%">
        <div class="modal-content">
        </div>
    </div>
</div>

<div id="common-modal-with-body" class="modal inmodal fade" tabindex="0" role="dialog" aria-labelledby="mySmallModalLabel" >
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-body">
                
            </div>
        </div>
    </div>
</div>

<div id="common-modal" class="modal inmodal fade" tabindex="0" role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-lg">
    </div>
</div>


</body>
</html>
</#macro>