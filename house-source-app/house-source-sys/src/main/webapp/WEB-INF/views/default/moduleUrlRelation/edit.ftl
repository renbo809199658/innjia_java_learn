<link href="${basePath}/public/plugins/bootstrap-icon-picker/css/icon-picker.css" rel="stylesheet"/>
<script src="${basePath}/public/plugins/bootstrap-icon-picker/js/iconPicker.js"></script>
<script type="text/javascript">
	$(function () {
		$(".icon-picker").iconPicker();
		var functionId = $('select[name="moduleFunctionId"] option:selected').val();
		$("#showMothod").val($("#"+functionId).text());
    });
    function selectFunctionXXX(obj){
    	$("#showMothod").val($("#"+obj.value+"").text());
    }
</script>
<div class="ibox">
	<div class="ibox-title">
    	<h4 class="pull-left"><label>项目功能关系编辑</label></h4>
    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    </div>
    <div class="ibox-content">
	<div class="pageContent">
		<form class="form-horizontal m-t" id="ajaxForm" method="post" action="${basePath }/admin/moduleUrlRelation/update.do" >
		<input type="hidden" name="id" value="${model.id}"/>
		<div class="pageFormContent">
			<div class="row">
				<div class="form-group col-md-6 col-sm-6">
					<label class="col-md-3 col-sm-3 control-label">项目名称：</label>
					<div class="col-md-9 col-sm-9 input-group">
						${common.getProjectIds("projectId","${model.projectId}")}
					</div>
				</div>
				<div class="form-group col-md-6 col-sm-6">
					<label class="col-md-3 col-sm-3 control-label">接口名称：</label>
					<div class="col-md-9 col-sm-9 input-group">
						${common.getModuleFunctionIds("moduleFunctionId","${model.moduleFunctionId}")}
					</div>
				</div>
				<div class="form-group col-md-6 col-sm-6">
					<label class="col-md-3 col-sm-3 control-label">功能及方法：</label>
					<div class="col-md-9 col-sm-9 input-group">
						<input id="showMothod" class="form-control" type="text" readonly="true"/>
					</div>
				</div>
				<div class="form-group col-md-6 col-sm-6">
					<label class="col-md-3 col-sm-3 control-label">接口类型：</label>
					<div class="col-md-9 col-sm-9 input-group">
						<input name="interType" class="form-control" type="text" readonly="true" value="basicInterface"/>
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

