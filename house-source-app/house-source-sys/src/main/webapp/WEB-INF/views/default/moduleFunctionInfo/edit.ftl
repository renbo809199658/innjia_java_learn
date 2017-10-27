<link href="${basePath}/public/plugins/bootstrap-icon-picker/css/icon-picker.css" rel="stylesheet"/>
<script src="${basePath}/public/plugins/bootstrap-icon-picker/js/iconPicker.js"></script>
<script type="text/javascript">
	$(function () {
		$(".icon-picker").iconPicker();
    });
</script>
<div class="ibox">
	<div class="ibox-title">
    	<h4 class="pull-left"><label>公司编辑</label></h4>
    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    </div>
    <div class="ibox-content">
	<div class="pageContent">
		<form class="form-horizontal m-t" id="ajaxForm" method="post" action="${basePath}/admin/moduleFunctionInfo/update.do" >
		<input type="hidden" name="id" value="${model.id}"/>
		<div class="pageFormContent">
			<div class="row">
				<div class="form-group col-md-6 col-sm-6">
					<label class="col-md-3 col-sm-3 control-label">接口名称：</label>
					<div class="col-md-9 col-sm-9 input-group">
						<input class="form-control" name="interfaceName" value="${model.interfaceName}" type="text" required/>
						<span class="glyphicon glyphicon-info-sign form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>
				<div class="form-group col-md-6 col-sm-6">
					<label class="col-md-3 col-sm-3 control-label">应用名：</label>
					<div class="col-md-9 col-sm-9 input-group">
						<input class="form-control" name="applicationName" value="${model.applicationName}" type="text" required/>
						<span class="glyphicon glyphicon-info-sign form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>
				<div class="form-group col-md-6 col-sm-6">
					<label class="col-md-3 col-sm-3 control-label">请求模块名：</label>
					<div class="col-md-9 col-sm-9 input-group">
						<input class="form-control" name="controllerName" value="${model.controllerName}" type="text" required/>
						<span class="glyphicon glyphicon-info-sign form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>
				<div class="form-group col-md-6 col-sm-6">
					<label class="col-md-3 col-sm-3 control-label">调用方法名：</label>
					<div class="col-md-9 col-sm-9 input-group">
						<input class="form-control" name="methodName" value="${model.methodName}" type="text" required />
						<span class="glyphicon glyphicon-info-sign form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>
				<div class="form-group col-md-6 col-sm-6">
					<label class="col-md-3 col-sm-3 control-label">请求方式：</label>
					<div class="col-md-9 col-sm-9 input-group">
						<select name="requestWay" class="form-control" required>
							<option value="POST" <#if model.requestWay=='POST'> selected="selected"</#if>>POST</option>
							<option value="GET" <#if model.requestWay=='GET'> selected="selected"</#if>>GET</option>
							<option value="HEAD" <#if model.requestWay=='HEAD'> selected="selected"</#if>>HEAD</option>
							<option value="OPTIONS" <#if model.requestWay=='OPTIONS'> selected="selected"</#if>>OPTIONS</option>
							<option value="PUT" <#if model.requestWay=='PUT'> selected="selected"</#if>>PUT</option>
							<option value="DELETE" <#if model.requestWay=='DELETE'> selected="selected"</#if>>DELETE</option>
							<option value="TRACE" <#if model.requestWay=='TRACE'> selected="selected"</#if>>TRACE</option>
							<option value="CONNECT" <#if model.requestWay=='CONNECT'> selected="selected"</#if>>CONNECT</option>
						</select>
					</div>
				</div>
				<div class="form-group col-md-6 col-sm-6">
					<label class="col-md-3 col-sm-3 control-label">目标url：</label>
					<div class="col-md-9 col-sm-9 input-group">
						<input class="form-control" name="targetUrl" value="${model.targetUrl}" type="text" required/>
						<span class="glyphicon glyphicon-info-sign form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>
				<div class="form-group col-md-6 col-sm-6">
					<label class="col-md-3 col-sm-3 control-label">请求参数类型：</label>
					<div class="col-md-9 col-sm-9 input-group">
						<select name="requestParameterWay" class="form-control" required>
							<option value="PARAM" <#if model.requestParameterWay=='PARAM'> selected="selected"</#if>>PARAM</option>
							<option value="JSON" <#if model.requestParameterWay=='JSON'> selected="selected"</#if>>JSON</option>
						</select>
					</div>
				</div>
				<div class="form-group col-md-6 col-sm-6">
					<label class="col-md-3 col-sm-3 control-label">响应参数类型：</label>
					<div class="col-md-9 col-sm-9 input-group">
						<select name="responseParameterWay" class="form-control" required>
							<option value="JSON" <#if model.responseParameterWay=='JSON'> selected="selected"</#if>>JSON</option>
							<option value="HTML" <#if model.responseParameterWay=='HTML'> selected="selected"</#if>>HTML</option>
						</select>
					</div>
				</div>
				<div class="form-group col-md-6 col-sm-6">
					<label class="col-md-3 col-sm-3 control-label">选择状态：</label>
					<div class="col-md-9 col-sm-9 input-group">
						<select name="status" class="form-control" required>
							<option value="AVAILABLE" <#if model.status=='AVAILABLE'> selected="selected"</#if>>可用</option>
							<option value="DELETE" <#if model.status=='DELETE'> selected="selected"</#if>>删除</option>
							<option value="FORBID" <#if model.status=='FORBID'> selected="selected"</#if>>禁止</option>
						</select>
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
