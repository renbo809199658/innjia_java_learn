<link href="${basePath}/public/plugins/bootstrap-icon-picker/css/icon-picker.css" rel="stylesheet"/>
<script src="${basePath}/public/plugins/bootstrap-icon-picker/js/iconPicker.js"></script>
<script type="text/javascript">
	$(function () {
		$(".icon-picker").iconPicker();
    });
</script>
<div class="ibox">
	<div class="ibox-title">
    	<h4 class="pull-left"><label>业务功能新建</label></h4>
    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    </div>
    <div class="ibox-content">
	<div class="pageContent">
		<form class="form-horizontal m-t" id="ajaxForm" method="post" action="${basePath }/admin/moduleFunctionInfo/save.do" >
		<div class="pageFormContent">
			<div class="row">
				<div class="form-group col-md-6 col-sm-6">
					<label class="col-md-3 col-sm-3 control-label">接口名称：</label>
					<div class="col-md-9 col-sm-9 input-group">
						<input class="form-control" name="interfaceName" type="text" required/>
						<span class="glyphicon glyphicon-info-sign form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>
				<div class="form-group col-md-6 col-sm-6">
					<label class="col-md-3 col-sm-3 control-label">应用名：</label>
					<div class="col-md-9 col-sm-9 input-group">
						<input class="form-control" name="applicationName" type="text" required/>
						<span class="glyphicon glyphicon-info-sign form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>
				<div class="form-group col-md-6 col-sm-6">
					<label class="col-md-3 col-sm-3 control-label">请求模块名：</label>
					<div class="col-md-9 col-sm-9 input-group">
						<input class="form-control" name="controllerName" type="text" required/>
						<span class="glyphicon glyphicon-info-sign form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>
				<div class="form-group col-md-6 col-sm-6">
					<label class="col-md-3 col-sm-3 control-label">调用方法名：</label>
					<div class="col-md-9 col-sm-9 input-group">
						<input class="form-control" name="methodName" type="text" required />
						<span class="glyphicon glyphicon-info-sign form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>
				<div class="form-group col-md-6 col-sm-6">
					<label class="col-md-3 col-sm-3 control-label">请求方式：</label>
					<div class="col-md-9 col-sm-9 input-group">
						<select name="requestWay" class="form-control" required>
							<option value="POST">POST</option>
							<option value="GET">GET</option>
							<option value="HEAD">HEAD</option>
							<option value="OPTIONS">OPTIONS</option>
							<option value="PUT">PUT</option>
							<option value="DELETE">DELETE</option>
							<option value="TRACE">TRACE</option>
							<option value="CONNECT">CONNECT</option>
						</select>
					</div>
				</div>
				<div class="form-group col-md-6 col-sm-6">
					<label class="col-md-3 col-sm-3 control-label">目标url：</label>
					<div class="col-md-9 col-sm-9 input-group">
						<input class="form-control" name="targetUrl" type="text" required/>
						<span class="glyphicon glyphicon-info-sign form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>
				<div class="form-group col-md-6 col-sm-6">
					<label class="col-md-3 col-sm-3 control-label">请求参数类型：</label>
					<div class="col-md-9 col-sm-9 input-group">
						<select name="requestParameterWay" class="form-control" required>
							<option value="PARAM">PARAM</option>
							<option value="JSON">JSON</option>
						</select>
					</div>
				</div>
				<div class="form-group col-md-6 col-sm-6">
					<label class="col-md-3 col-sm-3 control-label">响应参数类型：</label>
					<div class="col-md-9 col-sm-9 input-group">
						<select name="responseParameterWay" class="form-control" required>
							<option value="JSON">JSON</option>
							<option value="HTML">HTML</option>
						</select>
					</div>
				</div>
				<div class="form-group col-md-6 col-sm-6">
					<label class="col-md-3 col-sm-3 control-label">选择状态：</label>
					<div class="col-md-9 col-sm-9 input-group">
						<select name="status" class="form-control" required>
							<option value="AVAILABLE">可用</option>
							<option value="DELETE">删除</option>
							<option value="FORBID">禁止</option>
						</select>
					</div>
				</div>
			</div>
		</div>
		<div class="formBar">
			<div class="ibox-content ">
				<button class="btn btn-primary" option="ajaxForm">保存</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
			</div>
		</div>
		</form>
	</div>
	</div>
</div>
<!-- 引入事件绑定 -->
<script src="${basePath }/public/js/viewBind.js"></script>
