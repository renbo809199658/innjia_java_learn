

<div class="ibox">
    <div class="ibox-title">
    	<h4 class="pull-left"><label>功能编辑</label></h4>
    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    </div>
    <div class="ibox-content">
<div class="pageContent">
	<form class="form-horizontal m-t" id="ajaxForm" method="post" action="${basePath }/admin/menuMethod/update.do">
		<input type="hidden" name="id" value="${model.id}"/>
		<div class="pageFormContent">
			<div class="row">
					<div class="form-group col-md-6 col-sm-6">
						<label class="col-md-3 col-sm-3 control-label">方法名称：</label>
						<div class="col-md-9 col-sm-9">
							<input id="methodName" class="form-control" value="${model.methodName}" name="methodName" type="text" required/>
						</div>
					</div>
					<div class="form-group col-md-6 col-sm-6">
						<label class="col-md-3 col-sm-3 control-label">关&nbsp;&nbsp;键&nbsp;&nbsp;字：</label>
						<div class="col-md-9 col-sm-9">
							<input class="form-control" value="${model.methodTagName}" name="methodTagName" type="text" required/>
						</div>
					</div>
					<div class="form-group col-md-6 col-sm-6">
						<label class="col-md-3 col-sm-3 control-label">所属菜单：</label>
						<div class="col-md-9 col-sm-9">
							${common.getSelectByMenuAll("menuLookup.id","${model.menu.id}")}
						</div>
					</div>
					<div class="form-group col-md-6 col-sm-6">
						<label class="col-md-3 col-sm-3 control-label">选择状态：</label>
						<div class="col-md-9 col-sm-9">
							<select name="isSelected" class="form-control" required>
								<option value="1" <#if model.isSelected==1> selected="selected"</#if>>已选择</option>
								<option value="0" <#if model.isSelected==0> selected="selected"</#if>>未选择</option>
							</select>
						</div>
					</div>
					<div class="form-group col-md-6 col-sm-6">
						<label class="col-md-3 col-sm-3 control-label">记录状态：</label>
						<div class="col-md-9 col-sm-9">
							<select name="status" class="form-control" required>
								<option value="AVAILABLE" <#if model.status=='AVAILABLE'> selected="selected"</#if>>可用</option>
								<option value="FORBID" <#if model.status=='FORBID'> selected="selected"</#if>>禁止</option>
								<option value="DELETE" <#if model.status=='DELETE'> selected="selected"</#if>>删除</option>
							</select>
						</div>
					</div>
					<div class="form-group col-md-6 col-sm-6">
						<label class="col-md-3 col-sm-3 control-label">备注：</label>
						<div class="col-md-9 col-sm-9">
							<input id="remark" class="form-control" name="remark" value="${model.remark}" type="text"/>
						</div>
					</div>
			</div>
			
		</div>
		<div class="formBar">
			<div class="ibox-content">
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