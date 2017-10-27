
<script>
/**
 * 当自动生成选项被选择时，隐藏方法名和标签的输入框，并赋值。
 */
function onChangeBy_isCreated(value){
	if (value==1){
		$("#methodName").val("1");
		$("#p_methodName").hide();
		$("#methodTagName").val("1");
		$("#p_methodTagName").hide();
	}else{
		$("#methodName").val("");
		$("#p_methodName").show();
		$("#methodTagName").val("");
		$("#p_methodTagName").show();
	}
}
</script>

<div class="ibox">
    <div class="ibox-title">
    	<h4 class="pull-left"><label>功能新建</label></h4>
    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    </div>
    <div class="ibox-content">
<div class="pageContent">
	<form class="form-horizontal m-t" id="ajaxForm" method="post" action="${basePath }/admin/menuMethod/save.do">
		<div class="pageFormContent">
			<div class="row">
					<div class="form-group col-md-6 col-sm-6">
						<label class="col-md-3 col-sm-3 control-label">方法名称：</label>
						<div class="col-md-9 col-sm-9 input-group">
							<input id="methodName" class="form-control" name="methodName" type="text" required/>
							<span class="glyphicon glyphicon-info-sign form-control-feedback" aria-hidden="true"></span>
						</div>
					</div>
					<div class="form-group col-md-6 col-sm-6">
						<label class="col-md-3 col-sm-3 control-label">关&nbsp;&nbsp;键&nbsp;&nbsp;字：</label>
						<div class="col-md-9 col-sm-9 input-group">
							<input class="form-control" name="methodTagName" type="text" required/>
							<span class="glyphicon glyphicon-info-sign form-control-feedback" aria-hidden="true"></span>
						</div>
					</div>
					<div class="form-group col-md-6 col-sm-6">
						<label class="col-md-3 col-sm-3 control-label">所属菜单：</label>
						<div class="col-md-9 col-sm-9 input-group">
							${common.getSelectByMenuAll("menuLookup.id","")}
						</div>
					</div>
					<div class="form-group col-md-6 col-sm-6">
						<label class="col-md-3 col-sm-3 control-label">自动生成：</label>
						<div class="col-md-9 col-sm-9 input-group">
							<select name="isCreated" class="form-control" required>
								<option value="0">否</option>
								<option value="1">是</option>
							</select>
						</div>
					</div>
					<div class="form-group col-md-6 col-sm-6">
						<label class="col-md-3 col-sm-3 control-label">选择状态：</label>
						<div class="col-md-9 col-sm-9 input-group">
							<select name="isSelected" class="form-control" required>
								<option value="1">已选择</option>
								<option value="0">未选择</option>
							</select>
						</div>
					</div>
					<div class="form-group col-md-6 col-sm-6">
						<label class="col-md-3 col-sm-3 control-label">备注：</label>
						<div class="col-md-9 col-sm-9 input-group">
							<input id="remark" class="form-control" name="remark" type="text"/>
						</div>
					</div>
			</div>
		</div>
		<div class=" formBar">
			<div class="ibox-content">
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