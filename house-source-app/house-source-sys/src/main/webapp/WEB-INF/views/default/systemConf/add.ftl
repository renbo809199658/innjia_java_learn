<link href="${basePath}/public/plugins/bootstrap-icon-picker/css/icon-picker.css" rel="stylesheet"/>
<script src="${basePath}/public/plugins/bootstrap-icon-picker/js/iconPicker.js"></script>
<script type="text/javascript">
	$(function () {
		$(".icon-picker").iconPicker();
    });
</script>
<div class="ibox">
	<div class="ibox-title">
    	<h4 class="pull-left"><label>菜单新建</label></h4>
    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    </div>
    <div class="ibox-content">
	<div class="pageContent">
		<form class="form-horizontal m-t" id="ajaxForm" method="post" action="${basePath }/admin/systemConf/save.do" >
		<div class="pageFormContent">
			<div class="row">
			
					<div class="form-group col-md-6 col-sm-6">
						<label class="col-md-3 col-sm-3 control-label">参数名称：</label>
						<div class="col-md-9 col-sm-9 input-group">
							<input class="form-control" name="paramKey" type="text" required/>
							<span class="glyphicon glyphicon-info-sign form-control-feedback" aria-hidden="true"></span>
						</div>
					</div>
					
					<div class="form-group col-md-6 col-sm-6">
						<label class="col-md-3 col-sm-3 control-label">参数内容：</label>
						<div class="col-md-9 col-sm-9 input-group">
							<input class="form-control" name="paramValue" type="text" required />
							<span class="glyphicon glyphicon-info-sign form-control-feedback" aria-hidden="true"></span>
						</div>
					</div>
					
					<div class="form-group col-md-6 col-sm-6">
						<label class="col-md-3 col-sm-3 control-label">参数备注说明：</label>
						<div class="col-md-9 col-sm-9 input-group">
							<input class="form-control" name="remark" type="text" required/>
							<span class="glyphicon glyphicon-info-sign form-control-feedback" aria-hidden="true"></span>
						</div>
					</div>
			</div>
			
		</div>
		<div class="formBar">
			<div class="ibox-content ">
				<button class="btn btn-primary" option="ajaxForm" >保存</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>
		</form>
	</div>
	</div>
</div>
<!-- 引入事件绑定 -->
<script src="${basePath }/public/js/viewBind.js"></script>
